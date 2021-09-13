

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "contentFormat.h"
#include "textPlainCF.h"
#include "cborCF.h"
#include "../datamodel/datamodel.h"

#define ARRAYSIZE(a) (sizeof(a)/sizeof(*a))
elements_t CfElements;
static contentFormatHandlers_t *theContentFormatHandler;

typedef struct
{
     content_format_t contentFormatType;  
}supportedTypes_t;

const supportedTypes_t supportedCFType[CONTENT_FORMAT_SIZE] = 
{
    {(content_format_t)TEXT_PLAIN},
    {(content_format_t)CBOR}};

const contentFormatHandlers_t *contentFormatHandlers[CONTENT_FORMAT_SIZE] =
{   
    &TEXT_PLAINdataHandlers,
    &CBORdataHandlers};

bool iscfMatched(content_format_t cfType)
{
    const supportedTypes_t *hptr;
    
    hptr = supportedCFType;
    
    for(uint8_t i = 0; i < ARRAYSIZE(contentFormatHandlers); i++)
    {
        if(hptr->contentFormatType == cfType)
        {
            setContentFormatDataHandlers(i);
            return true;
        }
        hptr++;
    }
    return false;
}

void setContentFormatDataHandlers(uint8_t index)
{
    theContentFormatHandler =  contentFormatHandlers[index];
}

void Get_ToEthernet(long data, ContentDataType_t type)
{
      theContentFormatHandler->encodeFormatter(data,type); 
}

void Put_ToResource(char *data, void *variable, ContentDataType_t type)
{ 
    theContentFormatHandler->decodeFormatter(data,variable,type);             
}

uint8_t parseData(char *data,uint8_t sizeOfData)
{
    uint8_t len = 0;
    
    if(sizeOfData > MAX_WORD_SIZE)
        return 0;    
    memset(data,0,sizeOfData);
    len = theContentFormatHandler->parseDataHandler(data);           
      
      return len;
}

void writeAuxData(void *data,cFMenuItems items)
{
    theContentFormatHandler->writeDataHandler(data,items);          
}

