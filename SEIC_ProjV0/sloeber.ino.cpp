#ifdef __IN_ECLIPSE__
//This is a automatic generated file
//Please do not modify this file
//If you touch this file your change will be overwritten during the next build
//This file has been generated on 2021-06-25 15:15:35

#include "Arduino.h"
#include "Arduino.h"
#include <TFT_eSPI.h>
#include <SPI.h>
#include <WiFi.h>
#include <Wire.h>
#include <PubSubClient.h>
#include <stdio.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_TSL2561_U.h>
#include "DHT.h"
#include "esp_adc_cal.h"

void configureSensorTSL(void) ;
uint32_t readADC_Cal(int ADC_Raw) ;
float faz_leitura_temperatura(void) ;
float faz_leitura_luminosidade(void) ;
float faz_leitura_humidade(void) ;
void atualizar_lcd(String temp,String lum,String hum);
void alarme_screen(void);
void initWiFi(void) ;
void initMQTT(void) ;
void reconnectMQTT(void) ;
void reconnectWiFi(void) ;
void VerificaConexoesWiFIEMQTT(void) ;
void mqtt_callback(char* topic, byte* payload, unsigned int length) ;
void setup() ;
void loop() ;

#include "SEIC_ProjV0.ino"


#endif
