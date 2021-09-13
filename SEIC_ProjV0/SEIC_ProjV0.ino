#include "Arduino.h"
#include <TFT_eSPI.h> // Hardware-specific library
#include <SPI.h>
#include <WiFi.h>
#include <Wire.h>
#include <PubSubClient.h>
#include <stdio.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_TSL2561_U.h>
#include "DHT.h"
#include "esp_adc_cal.h"
/************************* WiFi Access Point *********************************/
//const char* ssid = "Vodafone-D13748"; // Enter your WiFi name
//const char* password =  "AnYtPs37R7"; // Enter WiFi password
const char* ssid = "labs";
const char* password =  "robot1cA!ESTG";

const char* BROKER_MQTT = "10.20.228.19";
int BROKER_PORT = 1883;
#define ID_MQTT  "esp32_mqtt"

/************ Tópicos **************************/
#define TOPICO_SUBSCRIBE_LED         "local/iluminacao/#"
#define TOPICO_SUBSCRIBE_ALARME      "local/seguranca/alarme"
#define TOPICO_SUBSCRIBE_SEGURANCA 	 "local/seguranca/sistema"
#define TOPICO_PUBLISH_TEMPERATURA   "local/ambiente/temp"
#define TOPICO_PUBLISH_LUMINOSIDADE  "local/ambiente/lum"
#define TOPICO_PUBLISH_HUMIDADE 	 "local/ambiente/hum"

/************ Pinos **************************/
#define I2C_SDA 21
#define I2C_SCL 22
#define ledPin3  12
#define ledPin2  14
#define ledPin1  25
#define LM35  35
#define DHT_Pin  33

#define DHTTYPE DHT11
DHT dht(DHT_Pin, DHTTYPE);

bool alarme, seguranca= false;

// WiFi Setup
WiFiClient espClient;
PubSubClient MQTT(espClient);

// Sensor I2C
Adafruit_TSL2561_Unified tsl = Adafruit_TSL2561_Unified(TSL2561_ADDR_FLOAT, 12345);

//-------- Ecrã LCD -------
TFT_eSPI tft = TFT_eSPI();       // Biblioteca TFT_eSPI

/* Prototypes */
float faz_leitura_temperatura(void);
float faz_leitura_luminosidade(void);
float faz_leitura_humidade(void);
void atualizar_lcd(String,String,String);
void initWiFi(void);
void initMQTT(void);
void mqtt_callback(char* topic, byte* payload, unsigned int length);
void reconnectMQTT(void);
void reconnectWiFi(void);
void VerificaConexoesWiFIEMQTT(void);
void alarme_screen(void);

/*=================== Funções dos Sensores ========================================*/
/* Função: Configuração do sensor TSL2561 */
void configureSensorTSL(void)
{
  /* You can also manually set the gain or enable auto-gain support */
  // tsl.setGain(TSL2561_GAIN_1X);      /* No gain ... use in bright light to avoid sensor saturation */
  // tsl.setGain(TSL2561_GAIN_16X);     /* 16x gain ... use in low light to boost sensitivity */
  tsl.enableAutoRange(true);            /* Auto-gain ... switches automatically between 1x and 16x */

  /* Changing the integration time gives you better sensor resolution (402ms = 16-bit data) */
  tsl.setIntegrationTime(TSL2561_INTEGRATIONTIME_13MS);      /* fast but low resolution */
  // tsl.setIntegrationTime(TSL2561_INTEGRATIONTIME_101MS);  /* medium resolution and speed   */
  // tsl.setIntegrationTime(TSL2561_INTEGRATIONTIME_402MS);  /* 16-bit data but slowest conversions */

  /* Update these values depending on what you've set above! */
  Serial.println("------------------------------------");
  Serial.print  ("Gain:         "); Serial.println("Auto");
  Serial.print  ("Timing:       "); Serial.println("13 ms");
  Serial.println("------------------------------------");
}

/* Função: conversor ADC */
uint32_t readADC_Cal(int ADC_Raw)
{
  esp_adc_cal_characteristics_t adc_chars;

  esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, 1200, &adc_chars);
  return(esp_adc_cal_raw_to_voltage(ADC_Raw, &adc_chars));
}

/* Função: faz a leitura de temperatura (sensor LM35) */
float faz_leitura_temperatura(void)
{
	float LM35_Value = analogRead(LM35);
	float Voltage = readADC_Cal(LM35_Value);
    return (Voltage*0.1)/1.3;
}

/* Função: faz a leitura de luminosidade (sensor TSL2561) */
float faz_leitura_luminosidade(void)
{
	sensors_event_t event;
	tsl.getEvent(&event);

	return event.light;
}

/* Função: faz a leitura de temperatura (sensor DHT11) */
float faz_leitura_humidade(void)
{
	return dht.readHumidity();
}

/*=================== Funções do LCD ========================================*/
/* Atualiza valores dos sensores no LCD */
void atualizar_lcd(String temp,String lum,String hum){
	tft.fillRect(110, 55, 50, 75, TFT_BLACK);
	tft.setTextColor(TFT_WHITE, TFT_BLACK);
	tft.drawString(temp, 110, 55,2);
	tft.drawString(hum, 110, 83,2);
	tft.drawString(lum, 110, 110,2);

}

/* Função: caso haja intruso, atualiza o LCD */
void alarme_screen(void){

	tft.fillRect(5, 255, 230, 60, TFT_BLACK);
	tft.setTextColor(TFT_RED, TFT_BLACK);
	tft.drawString("INTRUSO", 90, 270,2);
	delay(500);
	tft.fillRect(5, 255, 230, 60, TFT_RED);
	tft.setTextColor(TFT_BLACK, TFT_RED);
	tft.drawString("INTRUSO", 90, 270,2);
}

/*=================== Funções de Ligação WiFi e MQTT ========================================*/
/* Função: inicializa e conecta-se à rede WI-FI */
void initWiFi(void)
{

    delay(10);
    Serial.println("------Conexao WI-FI------");
    Serial.print("Conectando-se na rede: ");
    Serial.println(ssid);
    Serial.println("Aguarde");

    reconnectWiFi();
}

/* Função: inicializa parâmetros de conexão MQTT */
void initMQTT(void)
{
    MQTT.setServer(BROKER_MQTT, BROKER_PORT);   //informa qual broker e porta deve ser conectado
    MQTT.setCallback(mqtt_callback);            //atribui função de callback (função chamada quando qualquer informação de um dos tópicos subescritos chega)
}

/* Função: reconecta-se ao broker MQTT (caso ainda não esteja conectado ou em caso de a conexão cair) */
void reconnectMQTT(void)
{
    while (!MQTT.connected())
    {
        Serial.print("* A tentar ligar-se ao Broker MQTT: ");
        Serial.println(BROKER_MQTT);
        if (MQTT.connect(ID_MQTT))
        {
            Serial.println("Conectado com sucesso ao broker MQTT!");
            MQTT.subscribe(TOPICO_SUBSCRIBE_LED);
            MQTT.subscribe(TOPICO_SUBSCRIBE_ALARME);
            MQTT.subscribe(TOPICO_SUBSCRIBE_SEGURANCA);
        }
        else
        {
            Serial.println("Falha ao reconectar.");
            Serial.println("Em 2s haverá nova tentatica de conexão.");
            delay(2000);
        }
    }
}

/* Função: reconectar-se ao WiFi */
void reconnectWiFi(void)
{
    //se já está conectado a rede WI-FI, nada é feito.
    //Caso contrário, são efetuadas tentativas de conexão
    if (WiFi.status() == WL_CONNECTED)
        return;

    WiFi.begin(ssid, password); // Conecta na rede WI-FI

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(100);
        Serial.print(".");
    }

    Serial.println();
    Serial.print("Conectado com sucesso à rede ");
    Serial.print(ssid);
    Serial.println("IP obtido: ");
    Serial.println(WiFi.localIP());
}

/* Função: verifica o estado das conexões WiFI e do broker MQTT. Em caso de desconexão (qualquer uma das duas), é refeita a ligação. */
void VerificaConexoesWiFIEMQTT(void)
{
    if (!MQTT.connected())
        reconnectMQTT(); //se não há ligação com o Broker, a conexão é refeita

    reconnectWiFi(); //se não há ligação com o WiFI, a conexão é refeita
}

/*=================== Função CallBack ========================================*/
/* Função: função de callback é chamada sempre que uma informação de um dos tópicos subescritos chega */
void mqtt_callback(char* topic, byte* payload, unsigned int length)
{
    String msg;

    /* obtem a string do payload recebido */
    for(int i = 0; i < length; i++)
    {
       char c = (char)payload[i];
       msg += c;
    }
    /********* Descodificar de qual tópico a mensagem foi publicada ********/
    switch (topic[20]) {
    case '1':
    	if (msg.equals("true"))
		  {
			  digitalWrite(ledPin1, HIGH);
			  tft.fillRect(10, 175, 63, 40, TFT_GREEN);
			  tft.setTextColor(TFT_WHITE, TFT_GREEN);
			  tft.drawString("1", 40, 185,2);
		  }
    	else
		  {
			  digitalWrite(ledPin1, LOW);
			  tft.fillRect(10, 175, 63, 40, TFT_BLACK);
			  tft.setTextColor(TFT_WHITE);
			  tft.drawString("1", 40, 185,2);
		  }
    	break;
    case '2':
    	if (msg.equals("true"))
		  {
			  digitalWrite(ledPin2, HIGH);
			  tft.fillRect(87, 175, 65, 40, TFT_GREEN);
			  tft.setTextColor(TFT_WHITE, TFT_GREEN);
			  tft.drawString("2", 119, 185,2);
		  }
		else
		  {
			  digitalWrite(ledPin2, LOW);
			  tft.fillRect(87, 175, 65, 40, TFT_BLACK);
			  tft.setTextColor(TFT_WHITE);
			  tft.drawString("2", 119, 185,2);
		  }
		break;
    case '3':
    	if (msg.equals("true"))
		  {
			  digitalWrite(ledPin3, HIGH);
			  tft.fillRect(167, 175, 63, 40, TFT_GREEN);
			  tft.setTextColor(TFT_WHITE, TFT_GREEN);
			  tft.drawString("3", 197, 185,2);
		  }
		else
		  {
			  digitalWrite(ledPin3, LOW);
			  tft.fillRect(167, 175, 63, 40, TFT_BLACK);
			  tft.setTextColor(TFT_WHITE);
			  tft.drawString("3", 197, 185,2);
		  }
		break;
    case 'm':
    	if (msg.equals("true"))
		  {
    		if(seguranca)alarme= true;
		  }
		else
		  {
			if(seguranca){
				tft.fillRect(5, 255, 230, 60, TFT_BLACK);
				tft.setTextColor(TFT_GREEN,TFT_BLACK);
				tft.drawString(" ATIVO  ", 96, 270,2);
			}
			alarme= false;
		  }
		break;
    case 'e':
        	if (msg.equals("true"))
    		  {
        		tft.setTextColor(TFT_GREEN,TFT_BLACK);
        		tft.drawString(" ATIVO   ", 90, 270,2);
        		seguranca=true;
    		  }
    		else
    		  {
    			tft.setTextColor(TFT_RED,TFT_BLACK);
				tft.drawString("DESATIVO", 90, 270,2);
				seguranca=false;
				alarme= false;
    		  }
    		break;
    default:
    	Serial.println("ERRO! Mensagem sem destino");
    	break;
    }
}

/* Função: Setup */
void setup()
{
	Serial.begin(115200);
    //-------- Ecrã LCD --------

    tft.init(); // inicialização TFT
    tft.setRotation(0);
    tft.fillScreen(TFT_BLACK);
    //--------- info do projeto
    tft.setTextSize(1);
    tft.setTextColor(TFT_YELLOW, TFT_BLACK);

    tft.drawString("Realizado por:", 70, 100,2);
    tft.drawString("Goncalo Lopes", 70, 120,2);
    tft.drawString("Mateo Rodriguez", 70, 140,2);

    delay(1000); // espera 1 segundo para ver

    //-------- escreve e desenha informações fixas
    tft.fillScreen(TFT_BLACK);
    tft.drawString("Projeto SEIC", 85, 0,2);
    tft.drawLine(0,20,240,20,TFT_YELLOW);

    tft.fillRect(0, 25, 240, 20, TFT_BLUE);
    tft.drawRect(0, 25, 240, 115, TFT_BLUE);
    tft.setTextColor(TFT_WHITE, TFT_BLUE);
    tft.drawString("Valor de Sensores", 60, 28,2);

    tft.setTextColor(TFT_WHITE, TFT_BLACK);
    tft.drawString("Temperatura: ", 10, 55,2);
    tft.drawString("Humidade: ", 10, 83,2);
    tft.drawString("Luminosidade: ", 10, 110,2);

    tft.drawString("C", 180, 55,2);
    tft.drawString("RH%", 180, 83,2);
    tft.drawString("lux", 180, 110,2);

    tft.fillRect(0, 145, 240, 20, TFT_YELLOW);
	tft.drawRect(0, 145, 240, 80, TFT_YELLOW);
	tft.setTextColor(TFT_BLACK, TFT_YELLOW);
	tft.drawString("Estado das Luzes", 60, 148,2);
	tft.drawRect(5, 170, 73, 50, TFT_WHITE);
	tft.drawRect(83, 170, 75, 50, TFT_WHITE);
	tft.drawRect(162, 170, 73, 50, TFT_WHITE);

	tft.setTextColor(TFT_WHITE, TFT_BLACK);
	tft.drawString("1", 40, 185,2);
	tft.drawString("2", 119, 185,2);
	tft.drawString("3", 197, 185,2);

    tft.fillRect(0, 230, 240, 20, TFT_RED);
    tft.drawRect(0, 230, 240, 90, TFT_RED);
    tft.setTextColor(TFT_WHITE, TFT_RED);
    tft.drawString("Estado de Seguranca", 55, 233,2);

    tft.setTextColor(TFT_RED,TFT_BLACK);
	tft.drawString("DESATIVO", 90, 270,2);

	// Inicializa todas as ligações e os parâmetros dos componentes
    pinMode(ledPin1, OUTPUT);
    digitalWrite(ledPin1,LOW);
    pinMode(ledPin2, OUTPUT);
	digitalWrite(ledPin2,LOW);
	pinMode(ledPin3, OUTPUT);
	digitalWrite(ledPin3,LOW);

    initWiFi();
    initMQTT();

    dht.begin();
    Wire.begin(I2C_SDA, I2C_SCL, 100000);
    Wire.setClock(400000);

    if(!tsl.begin())
	  {
		/* There was a problem detecting the TSL2561 ... check your connections */
		Serial.print("Ooops, no TSL2561 detected ... Check your wiring or I2C ADDR!");
		while(1);
	  }
    /* Setup the sensor gain and integration time */
    configureSensorTSL();
}

/* Função: Loop */
void loop()
{
	char temperatura_str[10] = {0};
	char lum_str[10] = {0};
	char hum_str[10] = {0};
	// garante funcionamento das ligações WiFi e do broker MQTT
	VerificaConexoesWiFIEMQTT();

	// Compõe as strings a serem enviadas para o dashboard (campos texto)
	sprintf(temperatura_str,"%.2f", faz_leitura_temperatura());
	sprintf(lum_str,"%.0f", faz_leitura_luminosidade());
	sprintf(hum_str,"%.0f", faz_leitura_humidade());

	//  Envia as strings ao dashboard MQTT
	MQTT.publish(TOPICO_PUBLISH_TEMPERATURA, temperatura_str);
	MQTT.publish(TOPICO_PUBLISH_LUMINOSIDADE, lum_str);
	MQTT.publish(TOPICO_PUBLISH_HUMIDADE, hum_str);

	// Chama a função de atualização dos parametros do LCD
	atualizar_lcd(temperatura_str,lum_str,hum_str);

	// Se houver intruso entra nesta função
	if(alarme) alarme_screen();

	// keep-alive da comunicação com o broker MQTT
	MQTT.loop();

	/* Refaz o ciclo após 2 segundos */
	delay(2000);
}
