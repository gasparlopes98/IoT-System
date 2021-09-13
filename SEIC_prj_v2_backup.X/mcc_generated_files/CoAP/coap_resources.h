/**
  CoAP Protocol Header file

  Company:
    Microchip Technology Inc.

  File Name:
    coap_resources.h

  Summary:
    Header file for CoAP Resources implementation.

  Description:
    This header file provides the API for the CoAP Resources.

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

#ifndef TCPIP_COAP_RESOURCES_H
#define TCPIP_COAP_RESOURCES_H


#include "coap_options.h"
#include "coap.h"

typedef bool (*restfulFunctionPointer)(uint8_t);
typedef bool (*restfulFuntionInitPointer)(uint8_t);


typedef struct
{ 
    restfulFuntionInitPointer initializer;
    restfulFunctionPointer getter;
    restfulFunctionPointer putter;
    restfulFunctionPointer patcher;
    restfulFunctionPointer deleter;
    restfulFunctionPointer poster;         
}restfulMethodStructure_t;

extern const restfulMethodStructure_t *restfulHandler[];

bool coapwellknownHandler(coapReceive_t *ptr);
bool COAP_ResourceHandler(coapReceive_t *ptr); 


#endif	/* COAP_RESOURCES_H */

