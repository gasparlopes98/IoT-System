
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../TCPIPLibrary/ethernet_driver.h"
#include "contentFormat.h"
#include "cborCF.h"
#include "../cbor/cbor.h"


#define ARRAYSIZE(a)    (sizeof(a) / sizeof(*(a)))

/*CBOR*/

void CBOREncoder(long data, ContentDataType_t type)
{
    uint8_t i =0;
    char str_val[11];
    memset(str_val,0,11);   
            
    switch(type)
    {
        case SIGNED_INTEGER: 
            CBOR_Encode_Signed_Int((int32_t)data);
            break;
        case UNSIGNED_INTEGER:
            CBOR_Encode_Unsigned_Int((uint32_t)data);
            break;
        case BOOLEAN:
            CBOR_Encode_Bool((bool)data);
            break;
        case BYTE_STRING: 
            CBOR_Encode_Byte_String((char *)data);
            break;
        case TEXT_STRING:
            CBOR_Encode_Text_String((char *)data);
            break;        
        default:
            break;
    }    
    
}

void CBORDecoder(char * data ,void *variable, ContentDataType_t type)
{
    uint8_t i =0;
    char *x = variable;     
     switch(type)
    {
        case SIGNED_INTEGER:           
        case UNSIGNED_INTEGER:
        case BOOLEAN:     
        case BYTE_STRING:            
        case TEXT_STRING:  
            *x = *data;
            break;      
         
        default:
            break;
    }
    
}

uint8_t CBORParseData(char * data)
{
    uint8_t len =0;
    
    len = CBOR_Decode_Read_Data(data);
    
    if(strncmp(data,"MAP",4)==0)
    {
        CfElements.array_map_elements = cbor_elements();
    }
    else if(strncmp(data,"ARRAY",6)==0)
    {
        CfElements.array_elements = cbor_elements();
    }
       
    return len;
}

void CBORWriteData(void *data,cFMenuItems items)
{
    volatile uint8_t x =0;   
    char *value = data;
    
    switch(items)
    {
        case MAP:
            ETH_Write8(CBOR_MAJOR_MAP | *value);    
            break;
        case ARRAY:
             ETH_Write8(CBOR_MAJOR_ARRAY | *value);    
            break;
        default:
            break;
    }
}

const contentFormatHandlers_t CBORdataHandlers = {CBOREncoder,CBORDecoder, CBORParseData, CBORWriteData};
