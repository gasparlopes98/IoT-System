#ifndef DATA_MODEL_H
#define DATA_MODEL_H

#include "../CoAP/coap_resources.h"
#include "../content_type/contentFormat.h"

char *getStingFromIdx(uint8_t idx);
int getIdxFromString(char *str);

void setResourceDataID(uint8_t id);

void ResourcesInit();
extern restfulMethodStructure_t LedMethods;

/*********Get from MCC **/
#define MAX_TREE_DEPTH       (4)
#define Led_TYPE_COUNT   (5)
#define DISCOVERY_BODY_LENGTH   (60)

#endif 
