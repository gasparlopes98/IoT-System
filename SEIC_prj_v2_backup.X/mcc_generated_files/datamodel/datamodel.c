/**
  Data Model

  Company:
    Microchip Technology Inc.

  File Name:
    datamodel.c

  Summary:
     This is the generic data model implementation.

  Description:
    This source file provides the generic API implementation for the interface between REST Protocols and data.

*/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../CoAP/coap_resources.h"
#include "../CoAP/coap_dataInterface.h"
#include "../content_type/contentFormat.h"
#include "datamodel.h"
#include "Led.h"

#define ARRAYSIZE(a) (sizeof(a)/sizeof(*a))

static uint8_t TEXT_PLAINProcessPayloadOverHead(uint8_t receivedPayloadLength);
static uint8_t CBORProcessPayloadOverHead(uint8_t receivedPayloadLength);

static char resourcePathName[160];
static bool queryValid = true;
static char resourceStr[MAX_WORD_SIZE];

typedef void queryHandler_t(void);
/******************************************************************************/
typedef enum 
{   
    //Example Resource types
    Led_TYPE}coapResourceTypes_t;


typedef struct
{
    char discoveryPath[MAX_TREE_DEPTH];      
    uint8_t heightOftheNode;
}resourcePath_t;

typedef struct
{
    char validPath[MAX_TREE_DEPTH];  
    coapResourceTypes_t type;
    uint8_t dataID;
}validPath_t;

typedef struct
{
    uint8_t strIdx;
    char String[MAX_WORD_SIZE];
}String_t;

typedef struct
{
    char queryname[MAX_WORD_SIZE];
    queryHandler_t *queryHandler;
}Query_t;

/*
typedef struct
{
    char name[MAX_WORD_SIZE];
    char value[MAX_WORD_SIZE];   
}queryNameValuePair;
*/

static coapResourceTypes_t resourceType;
static uint8_t resourceDataID;
static queryNameValuePair query;
static uint8_t leafIdx =0;
static uint8_t pathIdx =0;

/********** const Tables from MCC ************/

const String_t StringTable[] = 
{
    {2,  "Led1"},  
    {3,  "Led2"},  
    {4,  "Led3"},  
    {1,  "mchp"},  
    {5,  "Led4"},  
    {6,  "Led5"}};

const validPath_t validPath[] = 
{
    {"1/2",  Led_TYPE,  0},  
    {"1/3",  Led_TYPE,  1},  
    {"1/4",  Led_TYPE,  2},  
    {"1/5",  Led_TYPE,  3},  
    {"1/6",  Led_TYPE,  4}};

const resourcePath_t discoveryPath[] = 
{
    {"1/2",2},
    {"1/3",2},
    {"1/4",2},
    {"1/5",2},
    {"1/6",2}};

const restfulMethodStructure_t *restfulHandler[] =
{
    &LedMethods};


void resetOptions()
{
    queryValid = true;
}

uint8_t getResourceType()
{
    return (uint8_t)resourceType;
}


int setURIPath(char *uriPath)
{    
   return getIdxFromString(uriPath);   
}

void setURIQuery(char *uriQuery)
{    
    if(strcmp(uriQuery,"mchp")==0)
        queryValid = true; 
    else
        queryValid = false;
    
}


bool isURIPathValid(int8_t *uri_path, uint8_t count)
{
    bool ret = false;
    validPath_t *hptr;
    uint8_t path =0;
    
    int8_t *temp;      

    uint8_t temp_count = count;
    
    temp = uri_path;
    hptr = validPath;
    char *pch;
    
    for(uint8_t i = 0; i< ARRAYSIZE(validPath); i++)
    {             
        pch = strtok(hptr->validPath,"/");
        while(count--)
        {
            path = atoi(pch);
            if(path == *uri_path++)
            {
                pch = strtok(NULL,"/");
                ret = true;                
            }
            else
            {
                ret = false;
                pch = NULL;
                break;
            }                
        }
        if(ret == true)
        {
            resourceType = hptr->type;
            setResourceDataID(hptr->dataID);
            break;
        }
        else
        {
            uri_path = temp;
            count = temp_count;
            hptr++;
        }
    }     
    return ret;
}


bool isURIQueryValid()
{  
    return queryValid;
}

uint8_t getRootToLeafPathCount()
{
    uint8_t count;
    
    count = ARRAYSIZE(discoveryPath);
    
    return count;
}

char *getDiscoveryPath(uint8_t idx)
{
    uint8_t strIdx = 0;
    char *pch;

    memset(resourcePathName,0,sizeof(resourcePathName));
    if(idx < ARRAYSIZE(discoveryPath))
    {
        pch = strtok(discoveryPath[idx].discoveryPath,"/");
        while(pch != NULL)
        {
            strIdx = atoi(pch);
            strcat(resourcePathName,getStingFromIdx(strIdx));
            strcat(resourcePathName,"/");
            pch = strtok(NULL,"/");
        }
    }
    return resourcePathName;
}

int8_t getLeafResourceIdx(void)
{
    if(leafIdx < ARRAYSIZE(discoveryPath))
        return leafIdx;
    
    return -1;
}

int8_t getPathResourceIdx(void)
{
    int8_t pathResourceIdx = -1;
    char *pch;

    if(leafIdx < getRootToLeafPathCount())
    {   
        if(pathIdx < discoveryPath[leafIdx].heightOftheNode)
        {
            pch = strtok(discoveryPath[leafIdx].discoveryPath,"/");
            for(uint8_t i=0; i< discoveryPath[leafIdx].heightOftheNode;i++)
            {    
                if(pch == NULL)
                {
                    leafIdx++;
                }
                if(i==pathIdx)
                {
                    pathIdx++;
                    pathResourceIdx = atoi(pch);  
                    pch = NULL;
                    break;
                }
                pch = strtok(NULL,"/");          
                       
            }
        }
        else
        {
            leafIdx = leafIdx + 1;
            pathIdx = 0;
        }
    }
   
        
    return pathResourceIdx;  
}

void resetLeafAndPathResourceIdices(void)
{
    leafIdx = 0;
    pathIdx = 0;
}

uint8_t getPathLength(uint8_t idx)
{
    if(idx < ARRAYSIZE(discoveryPath))
        return strlen(resourcePathName);    
}
/***************************  String Handlers ********************************************/

char *getStingFromIdx(uint8_t idx)
{
    String_t *hptr;
    
    hptr= StringTable;
    
    for(uint8_t i = 0; i< ARRAYSIZE(StringTable); i++)
    {
        if(idx == hptr->strIdx)
            return hptr->String;
        hptr++;
    }
}

int getIdxFromString(char *str)
{    
    String_t *hptr;
    
    hptr= StringTable;
    
    for(uint8_t i = 0; i< ARRAYSIZE(StringTable); i++)
    {
        if(strcmp(hptr->String,str)==0)
            return hptr->strIdx;
        hptr++;
    }
    return -1;
}

/***************************  Discovery Handlers ********************************************/

uint32_t getDiscoveryLength(void)
{    
    return DISCOVERY_BODY_LENGTH;
}

/***************************  Data Handlers ********************************************/

void setResourceDataID(uint8_t id)
{
    resourceDataID = id;
}

uint8_t getResourceDataID()
{
    return resourceDataID;
}

void ResourcesInit()
{
    for(uint8_t i = 0; i< Led_TYPE_COUNT; i++)
    {
        restfulHandler[Led_TYPE]->initializer(i);
    }
}

void addPayloadOverHead(uint8_t idx, uint8_t numOfResources)
{
    writeAuxData(&numOfResources,MAP);
}

int16_t processPayloadOverHead( uint8_t receivedPayloadLength, content_format_t cfType)
{
    //Remaining Payload MUST be returned
    switch(cfType)
    {
        case TEXT_PLAIN:
            receivedPayloadLength = TEXT_PLAINProcessPayloadOverHead(receivedPayloadLength);
            break;
        case CBOR:
            receivedPayloadLength = CBORProcessPayloadOverHead(receivedPayloadLength);
            break;
        default:
            break;
    }
    return receivedPayloadLength;
}

static uint8_t TEXT_PLAINProcessPayloadOverHead(uint8_t receivedPayloadLength)
{
    //Remaining Payload MUST be returned
    return receivedPayloadLength;
}
static uint8_t CBORProcessPayloadOverHead(uint8_t receivedPayloadLength)
{
    //Remaining Payload MUST be returned
    return receivedPayloadLength;
}
