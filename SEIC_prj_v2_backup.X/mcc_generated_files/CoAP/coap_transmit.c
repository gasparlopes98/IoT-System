/**
  CoAP client implementation

  Company:
    Microchip Technology Inc.

  File Name:
    coap_transmit.c

  Summary:
     This is the implementation of CoAP Transmit.

  Description:
    This source file provides the implementation of the Transmit side of CoAP protocol.

 */

/*

© [2015] Microchip Technology Inc. and its subsidiaries.  You may use this software
and any derivatives exclusively with Microchip products.

THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER EXPRESS,
IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF
NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSE, OR ITS
INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION WITH ANY OTHER PRODUCTS, OR USE
IN ANY APPLICATION.

IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL
OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED
TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY
OR THE DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S
TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED
THE AMOUNT OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE TERMS.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "../TCPIPLibrary/tcpip_types.h"
#include "../TCPIPLibrary/tcpip_config.h"
#include "../TCPIPLibrary/udpv4.h"
#include "coap.h"
#include "coap_options.h"
#include "../TCPIPLibrary/lfsr.h"
#include "../TCPIPLibrary/ip_database.h"
#include "coap_blockwise.h"



#define ARRAYSIZE(a) (sizeof(a)/sizeof(*a))


typedef enum
{ 
    INIT =0,
    RETRANSMISSION,
    MAX_RETRANSMISSION,
    LIFETIME,
    RESET
}coap_timerState_t;


typedef struct
{
    time_t init_time;
    time_t COAP_Timeout;
    time_t COAP_MaxRetransmit;
    time_t COAP_Lifetime;    
    time_t ret_counter;     //Re-Transmission Counter
    time_t init_retcounter;    
}coap_timers_t;


typedef struct
{
    coapHeader_t coapHeader;
    OptionTypeHandler_t *option;
    payload_t *payload;
    ObservePayload_t *observePayload;
    uint16_t messageID;
    uint8_t token[COAP_TOKEN_SIZE];   
    uint32_t destIP;    
    coap_timers_t coapTime;
    coap_timerState_t coapTimerState;    
    uint16_t destPort;
    uint16_t srcPort;    
    observeNotify_t observeNotifiers;
    uint8_t retransmission;
    uint8_t ackReceived;
    uint8_t rstReceived;
    uint8_t isMaxAge;
}coap_t;


static coapHeader_t coapHeader,recvheader;
static coap_t coapRetransmitClients[NUMBER_OF_SUPPORTED_CLIENTS];
static coap_t txCoapClient;

coap_t *coapClientList = NULL;
static uint8_t timerIdx = 1;
        
static int16_t COAP_AllocateClient();
static void COAP_FreeClient(coap_t *ptr);

static void CreateNewToken(coap_t *ptr);
static void CreateNewMID(coap_t *ptr);
static bool COAP_InitTimers(coap_t *ptr, time_t now);
static void COAP_TransmitInit(void);
static void COAP_TransmitMessageManage(void);

static error_msg COAP_SendMessage(coapTransmit_t *ptr, bool Retransmission);
static error_msg COAP_Request(coap_t *ptr);
static void COAP_Options(coap_t *ptr);
static void CoAP_Payload(coap_t *ptr);
static void CoAP_ObservePayload(coap_t *ptr);
char null[] ={0};
coapTransmit_t coapDiscPtr;

const OptionTypeHandler_t CoAPWellKnownOptions[] = 
{
    {COAP_AddWellKnownURIPathOptions}
};

void COAP_Init(void)
{
    COAP_TransmitInit(); 
    COAP_ConfigDefaultBlockParams(); 
}

void COAP_Manage(void)
{
    COAP_TransmitMessageManage();
    COAP_BlockClientManage();
}

static void COAP_TransmitInit(void)
{
    uint8_t i =0;
    memset(&coapHeader,0,sizeof(coapHeader));
    memset(&txCoapClient,0,sizeof(txCoapClient));    
    memset(coapRetransmitClients,0,sizeof(coapRetransmitClients));
    memset(&coapClientList,0,sizeof(coapClientList));  
    for(i =0; i< NUMBER_OF_SUPPORTED_CLIENTS; i++)
    {
        coapRetransmitClients[i].coapTimerState = RESET;
    }
}

static void CreateNewToken(coap_t *ptr)
{
    if(strncmp(ptr->token,null,sizeof(ptr->token))==0)
    {
        ptr->token[3] = lfsr();
        ptr->token[2] = lfsr();
        ptr->token[1] = lfsr();
        ptr->token[0] = lfsr();
       
    }
    ptr->coapHeader.tkl = strlen(ptr->token);
}

static void CreateNewMID(coap_t *ptr)
{
    if(ptr->messageID==0)
    {       
        ptr->messageID = lfsr();   
    }    
}

static int16_t COAP_AllocateClient()
{
    uint8_t i=0;
    for(i=0; i< NUMBER_OF_SUPPORTED_CLIENTS; i++)
    {
        if(coapRetransmitClients[i].coapTimerState == RESET)
        {
            coapRetransmitClients[i].coapTimerState = INIT;
            return i;
        }
    }
    return -1;   
    
}

static void COAP_FreeClient(coap_t *ptr)
{
    memset(ptr,0,sizeof(coap_t));
    timerIdx = 1;
    ptr->coapTimerState = RESET;
    ptr->observeNotifiers.isObserveServerFlag = 0;
}

bool COAP_FreeEndpointMessageIDTokenPairIfMatched(uint32_t receviedIPAddress, uint16_t messageID, char *token, uint8_t tokenLength, coapTypes type)
{
    bool ret = false;
    
    uint8_t i=0;
    for(i=0; i< NUMBER_OF_SUPPORTED_CLIENTS; i++)
    {
        if(tokenLength > 0)
        {
            if(coapRetransmitClients[i].messageID == messageID && coapRetransmitClients[i].destIP == receviedIPAddress && (strncmp(coapRetransmitClients[i].token,token,COAP_TOKEN_SIZE) == 0))
            { 
                if(type == ACK_TYPE)
                {
                    coapRetransmitClients[i].ackReceived = 1;                                      
                }
                else if(type == RST_TYPE)
                {
                    coapRetransmitClients[i].rstReceived = 1;                    
                }   
                COAP_FreeClient(&coapRetransmitClients[i]);
                return true;              
            }
        }
        else
        {
            if(coapRetransmitClients[i].messageID == messageID && coapRetransmitClients[i].destIP == receviedIPAddress)
            { 
                if(type == ACK_TYPE)
                {
                    coapRetransmitClients[i].ackReceived = 1;   
                    
                }
                else if(type == RST_TYPE)
                {
                    coapRetransmitClients[i].rstReceived = 1;                    
                } 
                COAP_FreeClient(&coapRetransmitClients[i]);
                return true;         
            }
        }        
    }
    return ret;    
}

bool COAP_IsEndpointTokenPairMatched(uint32_t receviedIPAddress, char *token)
{
    bool ret = false;    

    return ret;    
}

static bool COAP_InitTimers(coap_t *ptr,time_t now)
{ 
    bool ret = false;
     /***Initial Timer Value of 1 second and double the value at each transmission upto maximum 45 seconds*/
    switch(ptr->coapTimerState)
    {                  
        case INIT:           
            ptr->coapTime.init_time = now;
            ptr->coapTime.COAP_Timeout = now + ACK_TIMEOUT;
            ptr->coapTime.COAP_MaxRetransmit = now + MAX_TRANSMIT_SPAN;
            if(ptr->coapHeader.t == CON_TYPE)
            {
                ptr->coapTime.COAP_Lifetime = now + EXCHANGE_LIFETIME;    
            }
            else
            {
                ptr->coapTime.COAP_Lifetime = now + NON_LIFETIME;    
            }
            ptr->coapTimerState = RETRANSMISSION;
            ret = true;
            break;
        case RETRANSMISSION:  
            if(now==ptr->coapTime.COAP_Lifetime)
            {
                ptr->coapTimerState = LIFETIME;
                ret = false;
            }
            else if(now==ptr->coapTime.COAP_MaxRetransmit)
            {
                ptr->coapTimerState = MAX_RETRANSMISSION;
                ret = false;
            }
            else if(now == ptr->coapTime.COAP_Timeout)
            {
                timerIdx = timerIdx * ACK_TIMEOUT;
                ptr->coapTime.COAP_Timeout = ptr->coapTime.COAP_Timeout + (timerIdx * ACK_TIMEOUT);
                ptr->coapTimerState = RETRANSMISSION;               
                ret = true;
            }                
            break;
        case MAX_RETRANSMISSION:           
            COAP_FreeClient(ptr);
            ret = false;
            break;           
        case LIFETIME:   
            ptr->coapTimerState = RESET;
            ret = false;
            break;
        case RESET:
            break;
        default:
            break;
    }    
    return ret;
}

static void COAP_TransmitMessageManage(void)
{
    time_t now;
    uint8_t i=0;

    for(i =0; i< NUMBER_OF_SUPPORTED_CLIENTS; i++)
    {
        if(coapRetransmitClients[i].coapTimerState != RESET)
        {
            time(&now);
            if(COAP_InitTimers(&coapRetransmitClients[i], now))
            {
                if((coapRetransmitClients[i].retransmission == 1) && (coapRetransmitClients[i].ackReceived == 0) && (coapRetransmitClients[i].rstReceived == 0))
                {
                    if(COAP_Request(&coapRetransmitClients[i])==SUCCESS)   
                    {  
                        COAP_Options(&coapRetransmitClients[i]);
                        if(coapRetransmitClients[i].observeNotifiers.isObserveServerFlag == 1)
                        {
                            CoAP_ObservePayload(&coapRetransmitClients[i]);                       
                        }
                        else
                        {                          
                            CoAP_Payload(&coapRetransmitClients[i]);
                        }
                        COAP_Send();
                    }
                }
            }            
        }     
    }   
}


error_msg COAP_Transmit(coapTransmit_t *ptr,coapTypes Type, coapCodes Code, bool Retransmission) 
{
    error_msg ret = ERROR;    
    
    coapHeader.ver = 1;
    coapHeader.t = Type;
    coapHeader.code = Code;    
    

    switch(Type)
    {
        case CON_TYPE:
            ret = COAP_SendMessage(ptr,Retransmission);
            break;
        case NON_TYPE:
             ret = COAP_SendMessage(ptr,0);
            break;
        case ACK_TYPE:
            break;
        default:
            break;
    }
    return ret;
}

static error_msg COAP_SendMessage(coapTransmit_t *ptr, bool Retransmission)
{
    error_msg ret = ERROR; 
    time_t now;
    int16_t idx = -1;
    
    idx = COAP_AllocateClient();
    if(coapHeader.t == NON_TYPE && coapHeader.code == CONTENT && idx == -1 
            || (ptr->destIP == ipdb_classAbroadcastAddress())
            || (ptr->destIP == ipdb_classBbroadcastAddress())
            || (ptr->destIP == ipdb_classCbroadcastAddress())
            || (ptr->destIP == ipdb_specialbroadcastAddress()))            
    {
        memset(&txCoapClient,0,sizeof(txCoapClient));
        coapHeader.t = NON_TYPE;        
        memcpy(&txCoapClient.coapHeader,&coapHeader,sizeof(txCoapClient.coapHeader));
        txCoapClient.destIP = ptr->destIP;
        txCoapClient.option = ptr->clientOption;
        txCoapClient.observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;        
        txCoapClient.destPort = ptr->destPort;
        txCoapClient.srcPort = ptr->srcPort;
        txCoapClient.observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;
        txCoapClient.observeNotifiers.observedVertexIndex = ptr->observeNotifiers.observedVertexIndex;
        txCoapClient.observeNotifiers.observedAcceptFormat = ptr->observeNotifiers.observedAcceptFormat;
        txCoapClient.retransmission = 0; //No retransmission
        txCoapClient.ackReceived = 0;
        strncpy(txCoapClient.token, ptr->clientToken, strlen(ptr->clientToken));
        CreateNewMID(&txCoapClient);
        CreateNewToken(&txCoapClient);
        strncpy(ptr->clientToken,txCoapClient.token, strlen(txCoapClient.token));       
        ret = COAP_Request(&txCoapClient); 
        if(ret==SUCCESS)
        {
            COAP_Options(&txCoapClient);
            if(txCoapClient.observeNotifiers.isObserveServerFlag == 1)
            {              
                txCoapClient.observePayload = ptr->observePayload;              
                CoAP_ObservePayload(&txCoapClient);
            }
            else
            {
                txCoapClient.payload = ptr->clientPayload;
                CoAP_Payload(&txCoapClient);
            }
        }       
    }
    else
    {
        time(&now); 
        if(idx != -1)
        {
            coapRetransmitClients[idx].coapHeader = coapHeader;
            coapRetransmitClients[idx].destIP = ptr->destIP;
            coapRetransmitClients[idx].option = ptr->clientOption;
            coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;
            if(coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag == 1)
            {
                coapRetransmitClients[idx].observePayload = ptr->observePayload;
            }
            else
            {
                coapRetransmitClients[idx].payload = ptr->clientPayload;
            }  
            coapRetransmitClients[idx].destPort = ptr->destPort;
            coapRetransmitClients[idx].srcPort = ptr->srcPort;
            coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag = ptr->observeNotifiers.isObserveServerFlag;
            coapRetransmitClients[idx].observeNotifiers.observedVertexIndex = ptr->observeNotifiers.observedVertexIndex;
            coapRetransmitClients[idx].observeNotifiers.observedAcceptFormat = ptr->observeNotifiers.observedAcceptFormat;
            coapRetransmitClients[idx].retransmission = Retransmission;
            coapRetransmitClients[idx].ackReceived = 0;
            strncpy(coapRetransmitClients[idx].token, ptr->clientToken, strlen(ptr->clientToken));
            CreateNewMID(&coapRetransmitClients[idx]);
            CreateNewToken(&coapRetransmitClients[idx]);
            strncpy(ptr->clientToken,coapRetransmitClients[idx].token, strlen(coapRetransmitClients[idx].token));
            if(COAP_InitTimers(&coapRetransmitClients[idx], now))
            {
                ret = COAP_Request(&coapRetransmitClients[idx]);
                if(ret==SUCCESS)
                {
                    COAP_Options(&coapRetransmitClients[idx]);
                    if(coapRetransmitClients[idx].observeNotifiers.isObserveServerFlag == 1)
                    {
                        CoAP_ObservePayload(&coapRetransmitClients[idx]);
                    }
                    else
                    {
                        CoAP_Payload(&coapRetransmitClients[idx]);
                    }
                    
                }                
            }
        } 
    }
    return ret; 
}

static error_msg COAP_Request(coap_t *ptr)
{
    error_msg ret = ERROR;
    
    
    ret = UDP_Start(ptr->destIP, ptr->srcPort, ptr->destPort); 

    if(ret == SUCCESS)
    {
        UDP_WriteBlock((char*)&ptr->coapHeader,sizeof(coapHeader));
        UDP_Write16(ptr->messageID);
        UDP_WriteBlock((char*)ptr->token,strlen((char*)ptr->token));
    }
    else
    {               
        COAP_FreeClient(ptr);
    }

    return ret;
}

static void COAP_Options(coap_t *ptr)
{
    OptionTypeHandler_t *hptr;

    COAP_ResetLastOptionNumber();
    if(ptr->option != 0)
    {
        hptr = ptr->option;
        if(hptr->addOptions != NULL)
        {
            hptr->addOptions();
        }        
    }
}

static void CoAP_Payload(coap_t *ptr)
{  
    payload_t *hptr;
    
   if(ptr->payload != 0)
   {
        hptr = ptr->payload;
        if(hptr->addPayload != NULL)
        {
            COAP_EndofOptions();
            hptr->addPayload();
        }
   }    

}

static void CoAP_ObservePayload(coap_t *ptr)
{  
    ObservePayload_t *hptr;
    
   if(ptr->observePayload != 0)
   {
        hptr = ptr->observePayload;
        if(hptr->addObservePayload != NULL)
        {            
            hptr->addObservePayload(ptr->observeNotifiers.observedVertexIndex,ptr->observeNotifiers.observedAcceptFormat);
        }
   }    

}

void COAP_EndofOptions()
{
    UDP_Write8(0xFF);
}

error_msg COAP_Send()
{
    error_msg ret = ERROR;
    ret =  UDP_Send();
   
   return ret;
}


void COAP_Discover(coapTransmit_t *ptr)
{
    error_msg ret = ERROR;
    
    ptr->destPort = COAP_CLIENT_DEST_PORT;
    ptr->srcPort = COAP_CLIENT_SRC_PORT;
    ptr->clientOption = CoAPWellKnownOptions;
    ret = COAP_Transmit(ptr,CON_TYPE,GET,true);
    if(ret==SUCCESS)
    {
        COAP_Send();    
    }
}


error_msg COAP_StartDiscover(void)
{
    error_msg ret = ERROR;    

    if(ipdb_getAddress()==0)
        return ERROR;

    memset(&coapDiscPtr,0,sizeof(coapDiscPtr));
    coapDiscPtr.destIP = MAKE_IPV4_ADDRESS(255,255,255,255);
    coapDiscPtr.destPort = COAP_CLIENT_DEST_PORT;
    coapDiscPtr.srcPort = COAP_CLIENT_SRC_PORT;
    coapDiscPtr.clientOption = CoAPWellKnownOptions;    
    ret = COAP_Transmit(&coapDiscPtr,NON_TYPE,POST,false);
    if(ret==SUCCESS)
    {
        COAP_Send();
    }
    return ret;
   
}
