/**
  Generated Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This is the main file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  Description:
    This header file provides implementations for driver APIs for all modules selected in the GUI.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.4
        Device            :  PIC18F26K40
        Driver Version    :  2.00
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/

#include "mcc_generated_files/mcc.h"
//#include <stdio.h>
//#include <stdlib.h>
#include "mcc_generated_files/TCPIPLibrary/tcpip_config.h"
#include "mcc_generated_files/TCPIPLibrary/ip_database.h"
//#include "mcc_generated_files/datamodel/Led.c"
#include <time.h>

/*
                         Main application
 */
extern bool sistEn;
extern bool janAberta;
extern bool portAberta;
extern bool movdet;
extern bool alarmeAt;

void alarme(void);

void movInterrupt(void);
void btnB5Interrupt(void);
void btnB3Interrupt(void);
void btnA0Interrupt(void);

void main(void)
{
    
    unsigned long ip, old_ip=0;
    char *ip_str;
    
    // Initialize the device
    SYSTEM_Initialize();
    
    IOCBF4_SetInterruptHandler(movInterrupt); //MOVIMENTO
    IOCBF5_SetInterruptHandler(btnB5Interrupt); //JANELA
    IOCAF0_SetInterruptHandler(btnA0Interrupt); //SISTEMA
    IOCBF3_SetInterruptHandler(btnB3Interrupt); //PORTA
    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts
    // Use the following macros to:

    // Enable the Global Interrupts
    INTERRUPT_GlobalInterruptEnable();

    // Disable the Global Interrupts
    //INTERRUPT_GlobalInterruptDisable();

    // Enable the Peripheral Interrupts
    INTERRUPT_PeripheralInterruptEnable();

    // Disable the Peripheral Interrupts
    //INTERRUPT_PeripheralInterruptDisable();
    
    while (1){
        //transmitCoAPPutRequest();
        
        Network_Manage();
        ip = ipdb_getAddress();
        if( (ip == 0) || (old_ip != ip) ){
            old_ip = ip;
            ip_str = makeIpv4AddresstoStr(ip);
            printf(ip_str);
        } 
        //Sistema, Alarme, Janela, Porta, Mov
        if (sistEn){
            LedA4_SetHigh();
            if (movdet){
                alarme();
            }
            if (janAberta){
                alarme();
            }
            if (portAberta){
                alarme();
            }
            if (!movdet && !janAberta && !portAberta){
                LedA5_SetLow();
                alarmeAt = false;
            }
        }else{
            movdet = false;
            janAberta = false;
            portAberta = false;
            alarmeAt = false;
            LedA5_SetLow();
            LedA4_SetLow();
        }
        
    }
}

// %5 sec on
// 5 locked
void movInterrupt(void){
    if (sistEn){
        movdet = true;
    }
}

void alarme(void){
    LedA5_SetHigh();
    alarmeAt = true;
}

void btnB5Interrupt(void){
    if (sistEn){
        janAberta = true; 
    }
}

void btnB3Interrupt(void){
    if (sistEn){
        portAberta = true; 
    }
}

void btnA0Interrupt(void){
    //Interrupcao para ligar e deligar o sistema (nao utilizada)
    sistEn = !sistEn; //On Off
}


/**
 End of File
*/