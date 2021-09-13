/**
  CoAP client implementation

  Company:
    Microchip Technology Inc.

  File Name:
    coap_resources.c

  Summary:
     This is the implementation of CoAP Resources.

  Description:
    This source file provides the implementation of the CoAP Resource Handler APIs.

 */

/*

?  [2015] Microchip Technology Inc. and its subsidiaries.  You may use this software
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
#include <string.h>
#include "coap.h"
#include "../TCPIPLibrary/udpv4.h"
#include "coap_options.h"
#include "coap_resources.h"
#include "coap_dataInterface.h"
#include "coap_blockwise.h"
#include "../content_type/contentFormat.h"

/***************************Local Macro Definitions****************************/
#define COAP_RESOURCE_START '<'
#define COAP_RESOURCE_END '>'
#define COAP_RESOURCE_NEXT ','
#define COAP_SLASH '/'
#define ARRAYSIZE(a) (sizeof(a)/sizeof(*a))

/***************************Extern Variables***********************************/
bool firstPutEntry= true;

/******************************Static Variables********************************/
static int8_t queryName[MAX_URI_QUERY_COUNT];
static uint8_t vertexCount =0;
static uint8_t validQueryCount =0;


/*****************************Local API Prototypes*****************************/
static bool COAP_StartGetResponse(coapReceive_t *ptr);
static bool COAP_ProcessPutResponse(coapReceive_t *ptr);

/******************************************************************************/

/***************************Resource Handlers**********************************/

bool coapwellknownHandler(coapReceive_t *ptr)
{
    uint8_t i =0;
    coapCodes ret;
    uint8_t rootLeafCount =0;
    uint8_t idx = 0;

    switch(ptr->code)
    {
        case GET:
            ptr->code = CONTENT;   
            ptr->type = ACK_TYPE;
            ret = COAP_MessageResponse(ptr);
            COAP_AddContentFormatOption(LINK_FORMAT);
            if(ret == SUCCESS)
            {
                if(isBlockOptionRequired())
                {
                    COAP_DiscoveryBlockTransmit(ptr);
                }
                else
                {
                    UDP_Write8(0xFF);                
                    rootLeafCount = getRootToLeafPathCount();
                    while(rootLeafCount > 0)
                    {
                        UDP_Write8(COAP_RESOURCE_START);
                        UDP_WriteBlock(getDiscoveryPath(idx),getPathLength(idx));
                                         
                        UDP_Write8(COAP_RESOURCE_END);
                        UDP_Write8(COAP_RESOURCE_NEXT);
                        rootLeafCount--;
                        idx++;
                    }
                }
                COAP_Send();
            }
            break;        
        default:
            ptr->code = METHOD_NOT_ALLOWED;            
            ret = COAP_MessageResponse(ptr);
            if(ret == SUCCESS)
            {
                ptr->code = METHOD_NOT_ALLOWED;
                ptr->type = ACK_TYPE;
                ret = METHOD_NOT_ALLOWED;
                COAP_Send();
            }
            break;
    }
}


bool COAP_ResourceHandler(coapReceive_t *ptr)
{
      bool ret = false, IsQueryMatched = true; 
      uint8_t type;         
      int16_t remainingPayloadLength;      
     

      IsQueryMatched = isURIQueryValid();      
      type = getResourceType();
      if(isURIQueryValid())
      {          
          switch(ptr->code) 
          {
              case GET:
                  ptr->code = CONTENT;
                  ptr->type = ACK_TYPE;
                  if(iscfMatched(ptr->optlist.accept_format))
                  {                      
                      ret = COAP_StartGetResponse(ptr); 
                      if(ret==true)
                      {
                          addPayloadOverHead(getResourceDataID(), 1);                                
                      }                      
                  }                     
                  else
                  {
                      ret = false;
                      ptr->retCode = UNSUPPORTED_CONTENT_FORMAT;
                      
                      return ret;
                  }
                  if(ret == true)
                  {
                      ret = restfulHandler[type]->getter(getResourceDataID());
                      if(ret == true)
                      {
                          COAP_Send();
                      }
                      else 
                      {
                          UDP_DumpPacketInCreation();
                          ptr->retCode = METHOD_NOT_ALLOWED;
                          ret = false;                                
                      }
                  }
                  else
                  {
                      ptr->retCode = METHOD_NOT_ALLOWED;
                      ret = false;  
                  }
                  break;
              case PUT:
                  ptr->code = CHANGED;  
                  ptr->type = ACK_TYPE;
                  ret = false;
                  if(iscfMatched(ptr->optlist.content_format))
                  {                  
                    if((remainingPayloadLength = processPayloadOverHead(ptr->payload_length,ptr->optlist.content_format))!= 0)
                    {
                        ret = restfulHandler[type]->putter(getResourceDataID());    
                        ptr->payload_length = 0;                                    
                    }                  
                    if(ret==true)
                    {
                        firstPutEntry=true;
                        ret = COAP_MessageResponse(ptr);
                        if(ret==true)
                        {
                            COAP_Send();
                        }
                    }                         
                  }
                  else
                  {
                      ret = false;
                      ptr->retCode = UNSUPPORTED_CONTENT_FORMAT;
                      
                      return ret;
                  }
                  if (ret != true)
                  {
                      ptr->retCode = METHOD_NOT_ALLOWED;                       
                  }
                  break;
              case PATCH:
                  ptr->code = CHANGED;   
                   ret = restfulHandler[type]->patcher(getResourceDataID());
                  break;
              case POST:            
                  ptr->code = CREATED; 
                  ret = restfulHandler[type]->poster(getResourceDataID());
                  break;
              case DELETE:
                  ptr->code = DELETED; 
                  ret = restfulHandler[type]->deleter(getResourceDataID());
                  break;
              case CONTENT:
                  break;
              default:
                  ptr->retCode = METHOD_NOT_ALLOWED; 
                  ptr->type = ACK_TYPE; 
                  ret = false;         
                  break; 
          }
      }
      else
      {
          ret = false;
          ptr->type = ACK_TYPE; 
          ptr->retCode = METHOD_NOT_ALLOWED;
      }  
      return ret;
}

static bool COAP_StartGetResponse(coapReceive_t *ptr)
{
    error_msg ret = ERROR;
    
    ret = COAP_MessageResponse(ptr);
    if(ret == SUCCESS)
    {        
        COAP_AddContentFormatOption(ptr->optlist.accept_format);        
        UDP_Write8(0xFF);  
    }
    
    return ret;
}




