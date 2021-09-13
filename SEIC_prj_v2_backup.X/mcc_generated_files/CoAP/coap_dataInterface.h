/**
  Data Model Configuration file
	
  Company:
    Microchip Technology Inc.

  File Name:
    coap_dataInterface.h

  Summary:
    Header file for CoAP to Data Interface

  Description:
    This header file provides the definitions of the CoAP Data Interface.

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

#ifndef COAP_DATAINTERFACE_H
#define COAP_DATAINTERFACE_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include "../content_type/contentFormat.h"


#define MAX_WORD_SIZE                       (32)
#define DEFAULT_CONTENT_FORMAT              TEXT_PLAIN
#define MAX_URI_PATH_COUNT                  (10)
#define MAX_URI_QUERY_COUNT                 (5)


uint8_t getResourceType();


int setURIPath(char *);

void setURIQuery(char *);

bool isURIPathValid(int8_t *uri_path, uint8_t count);

bool isURIQueryValid(void);

uint8_t getRootToLeafPathCount(void);

char *getDiscoveryPath(uint8_t idx);

uint8_t getPathLength(uint8_t idx);

void resetOptions(void);

void addPayloadOverHead(uint8_t idx, uint8_t numOfResources);

int16_t processPayloadOverHead( uint8_t receivedPayloadLength, content_format_t cfType);

uint8_t getResourceDataID(void);

uint32_t getDiscoveryLength(void);

int8_t getPathResourceIdx(void);

int8_t getLeafResourceIdx(void);

void resetLeafAndPathResourceIdices(void);
/****************************/


#endif /* COAP_DATAINTERFACE_H */
