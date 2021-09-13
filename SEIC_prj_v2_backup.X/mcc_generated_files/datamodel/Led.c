/**
  Led Data Model 

  Company:
    Microchip Technology Inc.

  File Name:
    Led.c

  Summary:
     This is the implementation of Led RESTful APIs.

  Description:
    This source file provides the implementation of RESTful APIs for the Led Data Model.

*/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../datamodel/datamodel.h"
#include "Led.h"
#include "../content_type/contentFormat.h"

#include "../pin_manager.h"
#include "../eusart1.h"

bool sistEn = false;
bool alarmeAt = false;
bool janAberta = false;
bool portAberta = false;
bool movdet = false;

typedef struct {
 uint8_t ledStatus;
}Led_t;

Led_t Led[Led_TYPE_COUNT];

bool LedInit(uint8_t id) { 
 Led[id].ledStatus=0; 
 return SUCCESS; }


bool LedGetter(uint8_t idx){
    if (idx+1 == 2){ //ALARME
        if(alarmeAt){
            Led[idx].ledStatus = 1;
        }else
            Led[idx].ledStatus = 0;
    }
    if (idx+1 ==3){ //JANELA
        if(janAberta){
            Led[idx].ledStatus = 1;
        }else
            Led[idx].ledStatus = 0;
    }
    if (idx+1 ==4){ //PORTA
        if(portAberta){
            Led[idx].ledStatus = 1;
        }else
            Led[idx].ledStatus = 0;
    }
    if (idx+1 ==5){ //MOVIMENTO
        if(movdet){
            Led[idx].ledStatus = 1;
        }else
            Led[idx].ledStatus = 0;
    }
    
 bool ret = ERROR;
 Get_ToEthernet((char *) "led", TEXT_STRING);
 Get_ToEthernet(Led[idx].ledStatus, UNSIGNED_INTEGER);
 printf("\n\rEnviado: ,led,%d,",Led[idx].ledStatus);
 return SUCCESS;
}

bool LedPutter(uint8_t idx){
 bool ret = ERROR;
 char led[MAX_WORD_SIZE];
 
 //parse "Led" string
 parseData(&led, sizeof(led));
 
 if(strncmp(led, "Led", sizeof(led))==0){
 parseData(&led,sizeof(led));
 // Atualiza estado do recurso (memória do servidor)
 Put_ToResource(led,&Led[idx].ledStatus,UNSIGNED_INTEGER);
 // Atualiza estado efetivo do recurso 
 switch(idx+1){

    case 1: 
        printf("case1\r\n");
        if(Led[idx].ledStatus == 1){
            sistEn = true;
        }else{
            sistEn = false;
            alarmeAt = false;
        } 
        break;

    case 2: 
        printf("case2\r\n");
        if(alarmeAt){ //Se o alarme estiver ativado
            printf("%d", alarmeAt);
            LedA5_SetLow(); 
            //Coloca os estados dos sensores a false
            alarmeAt = false;
            janAberta = false;
            portAberta = false;
            movdet = false;
        }
        break;

    case 3:    
        printf("case3\r\n"); //JANELA
        break;
        
    case 4:    
        printf("case4\r\n"); //PORTA
        break;
        
    case 5:    
        printf("case5\r\n"); //MOVIMENTO
        break;
    
 
 default: printf("\r\nErro: Led não existe"); 
 } 
 printf("\n\r Led%d atualizado para %d", idx+1,Led[idx].ledStatus); 
 return SUCCESS;
 }else
 printf("\r\nErro: recurso desconhecido");
 
 return ret;
}

bool LedPatcher(uint8_t idx)
{
    bool ret = ERROR;
     
    return ret;
}


bool LedPoster(uint8_t idx)
{
    bool ret = ERROR;
     
    return ret;
}


bool LedDeleter(uint8_t idx)

{
    bool ret = ERROR;
     
    return ret;
}


restfulMethodStructure_t LedMethods = {LedInit,LedGetter,LedPutter,LedPatcher,LedDeleter,LedPoster};