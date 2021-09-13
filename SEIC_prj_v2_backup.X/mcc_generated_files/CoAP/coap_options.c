/**
  CoAP client implementation

  Company:
    Microchip Technology Inc.

  File Name:
    coap_options.c

  Summary:
     This is the implementation of CoAP Options.

  Description:
    This source file provides the implementation of the CoAP Options.

 */

/*

Ã?Â©  [2015] Microchip Technology Inc. and its subsidiaries.  You may use this software
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
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include "../TCPIPLibrary/tcpip_types.h"
#include "../TCPIPLibrary/udpv4.h"
#include "coap.h"
#include "coap_options.h"
#include "coap_resources.h"
#include "coap_blockwise.h"
#include "../TCPIPLibrary/ip_database.h"

/************************** CoAP Options Data Encapsulation *******************/

typedef enum
{
    IF_MATCH        = 1,
    URI_HOST        = 3,
    ETAG            = 4,
    IF_NONE_MATCH   = 5,
    OBSERVE         = 6,
    URI_PORT        = 7,
    LOCATION_PATH   = 8,
    URI_PATH        = 11,
    CONTENT_FORMAT  = 12,
    MAX_AGE         = 14,
    URI_QUERY       = 15,
    ACCEPT          = 17, 
    LOCATION_QUERY  = 20,
    BLOCK2          = 23,
    BLOCK1          = 27,
    PROXY_URI       = 35,
    PROXY_SCHEME    = 39,
    SIZE1           = 60
}coapOptions_t;

typedef enum
{
    INTEGER          = 0,
    STRING           = 1  
}coapOptionFormatType_t;

typedef struct
{
    coapOptions_t           type;
    char                    value[MAX_WORD_SIZE];
    coapOptionFormatType_t  format;
}coapOptionTable_t;

typedef union
{
    uint16_t                opt_delta_ext_16;
    uint8_t                 opt_delta_ext_8;
}OptionDeltaExtension_t;

typedef union
{
    uint16_t                opt_length_ext_16;
    uint8_t                 opt_length_ext_8;
}OptionLengthExtension_t;

typedef struct
{
    unsigned                opt_delta:4;
    unsigned                opt_length:4;
    OptionDeltaExtension_t  opt_delta_ext;
    OptionLengthExtension_t opt_length_ext;
}OptionSet_t;


/************************** Constant Variables************************************/
const char WellKnown[] = ".well-known";
const char Core[] = "core";

/**************************Static Variables************************************/
static OptionSet_t Options;
static uint32_t optionDelta,optionLength;
static uint8_t numOfOptionsAdded =0;
static bool IsWellKnown = false;
static bool IsCore = false;
static uint8_t lastOptionNumber =0;
static Option_t opt_ptr;
static char optionStr[11];

/********************Definition of Extern Variables****************************/
bool coapObserveOptionRecvd = false;

/**************************Local API Prototypes********************************/
static void COAP_DeltaLength(void);
static bool COAP_DecodeOptions(Option_t *opt_ptr, coapReceive_t *ptr);
static uint8_t getOptionNibble(uint32_t optionValue);
static void COAP_AddOptions(coapOptions_t type, const char* value,coapOptionFormatType_t format);

/***************************Local Macro Definitions****************************/
#define ARRAYSIZE(a) (sizeof(a)/sizeof(*a))
/******************************************************************************/


/**************************CoAP Option Formatters *****************************/

static void COAP_DeltaLength(void)
{
    Options.opt_length = getOptionNibble(optionLength);
    
    UDP_Write8((Options.opt_delta << 4)| Options.opt_length);

    if(Options.opt_delta == 13)
    {
        Options.opt_delta_ext.opt_delta_ext_8 = optionDelta - 13;
        UDP_Write8(Options.opt_delta_ext.opt_delta_ext_8);
    }
    else if(Options.opt_delta == 14)
    {
        Options.opt_delta_ext.opt_delta_ext_16 = optionDelta - 269;
        UDP_Write16(Options.opt_delta_ext.opt_delta_ext_16);
    }

    if(Options.opt_length == 13)
    {
        Options.opt_length_ext.opt_length_ext_8 = optionLength - 13;
        UDP_Write8(Options.opt_length_ext.opt_length_ext_8);
    }
    else if(Options.opt_length == 14)
    {
        Options.opt_length_ext.opt_length_ext_16 = optionLength - 269;
        UDP_Write16(Options.opt_length_ext.opt_length_ext_16);
    }
}       


static uint8_t getOptionNibble(uint32_t optionValue)
{
    if (optionValue <= 12) {
        return optionValue;
    } else if (optionValue <= 255 + 13) {
        return 13;
    } else if (optionValue <= 65535 + 269) {
        return 14;
    } else {
        return 0;
    }
}

static void COAP_AddOptions(coapOptions_t type, const char* value,coapOptionFormatType_t format)
{
    uint32_t integerFormatOptionValue = 0;
    
    optionDelta = type - lastOptionNumber;
    Options.opt_delta = getOptionNibble(optionDelta);

    switch(format)
    {
        case INTEGER:
            integerFormatOptionValue = atol(value);
            if(integerFormatOptionValue <= 0xFF)
            {
                optionLength = 1;
                COAP_DeltaLength();
                UDP_Write8(integerFormatOptionValue);
                break;
            }
            else if(integerFormatOptionValue <= 0xFFFF)
            {
                optionLength = 2;
                COAP_DeltaLength();
                UDP_Write16(integerFormatOptionValue);
                break;
            }
            else if(integerFormatOptionValue <= 0xFFFFFF)
            {
                optionLength = 3;
                COAP_DeltaLength();
                UDP_Write24(integerFormatOptionValue);
                break;
            }
            else 
            {
                optionLength = 4;
                COAP_DeltaLength();
                UDP_Write32(integerFormatOptionValue);
            }        
            break;
        case STRING:
            optionLength = strlen(value);
            COAP_DeltaLength();
            UDP_WriteBlock(value,optionLength);
            break;
        default:
            break;
    }
    numOfOptionsAdded++;
    lastOptionNumber = type;    
}

void COAP_AddWellKnownURIPathOptions()
{
    COAP_AddOptions((coapOptions_t)URI_PATH,".well-known", STRING);
    COAP_AddOptions((coapOptions_t)URI_PATH,"core", STRING);
}

void COAP_AddBlock2Options(char *str)
{    
    COAP_AddOptions((coapOptions_t)BLOCK2,(char *)str, INTEGER);   
}


void COAP_AddAcceptOption(content_format_t acceptFormat)
{
    memset(optionStr,0,sizeof(optionStr));
    sprintf(optionStr,"%u",acceptFormat);
    COAP_AddOptions((coapOptions_t)ACCEPT,(char *)optionStr, INTEGER);   
}

void COAP_AddContentFormatOption(content_format_t contentFormat)
{   
    memset(optionStr,0,sizeof(optionStr));
    sprintf(optionStr,"%u",contentFormat);
    COAP_AddOptions((coapOptions_t)CONTENT_FORMAT,(char *)optionStr, INTEGER);   
}

void COAP_AddURIPathOption(const char *uriPathStr)
{
     COAP_AddOptions((coapOptions_t)URI_PATH,uriPathStr,STRING);
}

void COAP_AddURIQueryOption(const char *uriQueryStr)
{
    COAP_AddOptions((coapOptions_t)URI_QUERY,uriQueryStr,STRING);
}

/************************CoAP Option Parsers***********************************/

static bool COAP_DecodeOptions(Option_t *opt_ptr, coapReceive_t *ptr)
{   
    uint8_t type , j =0;
    uint16_t length =0;   
    char value[MAX_WORD_SIZE];  
    bool ret = 0; 
    int val = -1;
    
    memset(value,0,sizeof(value));
    
    type = opt_ptr->type;
    switch(type)
    {
        case URI_HOST:
            length = opt_ptr->len.length_16;
            strncpy(value,(char*)opt_ptr->opt_value,length);            
            ptr->destIP = makeStrToIpv4Address(value);
            ret = 1;
            break;
        case URI_PATH:
            length = opt_ptr->len.length_16; 
            strncpy(value,opt_ptr->opt_value,length);
            if(!(strncmp(value,WellKnown,strlen(WellKnown))))
            {
                IsWellKnown = true;                
                ret = 1;
            }
            else if(!(strncmp(value,Core,strlen(Core))))
            {
                IsCore = true;                
                ret = 1;
            }
            else
            {
                val = setURIPath(value);
                if(val != -1)
                {
                    ptr->optlist.uri_path[ptr->optlist.uripath_count++] = val;
                    ret = 1;
                }
                else
                {
                    ptr->retCode = METHOD_NOT_ALLOWED;
                    ret = 0;
                }
            }
            break;
        case CONTENT_FORMAT:
            ptr->optlist.content_format = (content_format_t)(*(opt_ptr->opt_value));
            ret =1;
            break;
        case URI_QUERY:
            length = opt_ptr->len.length_16;
            strncpy(value,opt_ptr->opt_value,length);
            setURIQuery(value);
            ptr->optlist.uriquery_count++;
            ret = 1;
            break;
        case ACCEPT:
             ptr->optlist.accept_format = (content_format_t)(*(opt_ptr->opt_value));
            ret =1;
            break;
        case BLOCK2:
            if(IsWellKnown)
            {
                length = opt_ptr->len.length_16;
                ret = COAP_ProcessBlock2Option(ptr->destIP,(opt_ptr->opt_value),length);
                if(ret == 0)
                     ptr->retCode = BAD_OPTION;                  
            }
            else
            {
                ptr->retCode = BAD_OPTION;
                ret = 0;
            }
            break;
        default:
            ptr->retCode = BAD_OPTION;
            ret = 0;
            break;
                
    }             
    return ret;
}

bool COAP_ParseOptions(coapReceive_t *ptr, int16_t length)
{
    bool ret = false;
    uint8_t next_byte;
    
    Options.opt_delta =0;   
    opt_ptr.type = 0;
    
    uint16_t temp_opt_length_ext_16=0;
    uint8_t temp_opt_length_ext_8=0;
   
    ptr->optlist.uripath_count =0;
    ptr->optlist.uriquery_count=0;
    ptr->optlist.content_format = DEFAULT_CONTENT_FORMAT;
    ptr->optlist.accept_format = DEFAULT_CONTENT_FORMAT;  
    memset(ptr->optlist.queryList,0,sizeof(ptr->optlist.queryList));
    memset(ptr->optlist.uri_path,0,sizeof(ptr->optlist.uri_path));
    memset(opt_ptr.opt_value,0,sizeof(opt_ptr.opt_value));
    ptr->payload_waiting = false;
    ptr->payload_length = 0;    
    resetOptions();
   
    IsWellKnown = false; 
    IsCore = false;
    coapObserveOptionRecvd = false;
    
    
    while(length)
    {
        next_byte = UDP_Read8();
        length -= 1;
        if(next_byte!= 0xFF)
        {
            memset(opt_ptr.opt_value,0,sizeof(opt_ptr.opt_value));
            Options.opt_delta = (0xF0 & next_byte) >> 4;
            opt_ptr.type += Options.opt_delta;
            opt_ptr.len.length_8  = Options.opt_length = (0x0F & next_byte);


            if(Options.opt_delta == 13)
            {
                Options.opt_delta_ext.opt_delta_ext_8 = UDP_Read8();
                opt_ptr.type = opt_ptr.type + Options.opt_delta_ext.opt_delta_ext_8;
                length -= 1;
            }
            else if(Options.opt_delta == 14)
            {
                Options.opt_delta_ext.opt_delta_ext_16 = UDP_Read16();
                 opt_ptr.type =  opt_ptr.type + Options.opt_delta_ext.opt_delta_ext_16;
                length -= 2;
            }


            if(Options.opt_length == 13)
            {
                 Options.opt_length_ext.opt_length_ext_8 = UDP_Read8();
                 UDP_ReadBlock((void *)opt_ptr.opt_value, (Options.opt_length + Options.opt_length_ext.opt_length_ext_8));
                 temp_opt_length_ext_8 = opt_ptr.len.length_8 + Options.opt_length_ext.opt_length_ext_8;
                 opt_ptr.len.length_8 = temp_opt_length_ext_8;
                 length -= 1 + (Options.opt_length + Options.opt_length_ext.opt_length_ext_8);

            }
            else if(Options.opt_length == 14)
            {
                 Options.opt_length_ext.opt_length_ext_16 = UDP_Read16();
                 UDP_ReadBlock((void *)opt_ptr.opt_value, (Options.opt_length + Options.opt_length_ext.opt_length_ext_16));
                 temp_opt_length_ext_16 = opt_ptr.len.length_16 + Options.opt_length_ext.opt_length_ext_16;
                 opt_ptr.len.length_16 = temp_opt_length_ext_16;
                 length -= 2 + (Options.opt_length + Options.opt_length_ext.opt_length_ext_16);
            }

            else
            {
                UDP_ReadBlock((void *)opt_ptr.opt_value, Options.opt_length);
                length -= Options.opt_length;
            }
            
            ret = COAP_DecodeOptions(&opt_ptr, ptr);
            if(!ret)
            {
                ret = false;
                break;
            }
            ptr->opt_count += 1;
        }
        else if(next_byte == 0xff)
        {
            ptr->payload_waiting = true;
            ptr->payload_length = length;            
            length = 0;
            ret = true;
        }       
    }
    return ret;    
}

/********************CoAP Option Helper APIs***********************************/

void COAP_ResetLastOptionNumber(void)
{
    lastOptionNumber =0;
    numOfOptionsAdded = 0;
}

uint8_t COAP_GetNumberOfOptionsAdded(void)
{
    return numOfOptionsAdded;
}
  
uint8_t COAP_GetLengthOfIntegerOptionValue(uint32_t val)
{
    if(val <= 0xFF)
    {
        return 1;
    }
    else if(val <= 0xFFFF)
    {        
        return 2;
    }
    else if(val <= 0xFFFFFF)
    {          
        return 3;
    }
    else 
    {          
        return 4;
    }              
}

/************************* Resource Traverse API ******************************/
bool COAP_TraverseToResource(coapReceive_t *ptr)
{   
    bool ret = false;    
    
    if(IsWellKnown == true && IsCore == true)
    {
        ret = coapwellknownHandler(ptr);
    }
    else
    {       
        ret = isURIPathValid(ptr->optlist.uri_path, ptr->optlist.uripath_count);
        if(ret)
        {
            ret = COAP_ResourceHandler(ptr);
        }
                  
    }
    return ret;    
}
