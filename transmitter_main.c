/* 
 * File:   main.c
 * Author: joe
 *
 * Created on March 6, 2024, 7:45 PM
 */

// PIC18F4331 Configuration Bit Settings

// 'C' source line config statements

// CONFIG1H
#pragma config OSC = IRC        // Oscillator Selection bits (Internal oscillator block, CLKO function on RA6 and port function on RA7)
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor enabled)
#pragma config IESO = ON        // Internal External Oscillator Switchover bit (Internal External Switchover mode enabled)

// CONFIG2L
#pragma config PWRTEN = ON      // Power-up Timer Enable bit (PWRT enabled)
#pragma config BOREN = ON       // Brown-out Reset Enable bits (Brown-out Reset enabled)
// BORV = No Setting

// CONFIG2H
#pragma config WDTEN = OFF      // Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
#pragma config WDPS = 32768     // Watchdog Timer Postscale Select bits (1:32768)
#pragma config WINEN = OFF      // Watchdog Timer Window Enable bit (WDT window disabled)

// CONFIG3L
#pragma config PWMPIN = OFF     // PWM output pins Reset state control (PWM outputs disabled upon Reset (default))
#pragma config LPOL = HIGH      // Low-Side Transistors Polarity (PWM0, 2, 4 and 6 are active-high)
#pragma config HPOL = HIGH      // High-Side Transistors Polarity (PWM1, 3, 5 and 7 are active-high)
#pragma config T1OSCMX = ON     // Timer1 Oscillator MUX (Low-power Timer1 operation when microcontroller is in Sleep mode)

// CONFIG3H
#pragma config FLTAMX = RC1     // FLTA MUX bit (FLTA input is multiplexed with RC1)
#pragma config SSPMX = RC7      // SSP I/O MUX bit (SCK/SCL clocks and SDA/SDI data are multiplexed with RC5 and RC4, respectively. SDO output is multiplexed with RC7.)
#pragma config PWM4MX = RB5     // PWM4 MUX bit (PWM4 output is multiplexed with RB5)
#pragma config EXCLKMX = RC3    // TMR0/T5CKI External clock MUX bit (TMR0/T5CKI external clock input is multiplexed with RC3)
#pragma config MCLRE = ON       // MCLR Pin Enable bit (Enabled)

// CONFIG4L
#pragma config STVREN = ON      // Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
#pragma config LVP = OFF        // Low-Voltage ICSP Enable bit (Low-voltage ICSP disabled)

// CONFIG5L
#pragma config CP0 = OFF        // Code Protection bit (Block 0 (000200-000FFFh) not code-protected)
#pragma config CP1 = OFF        // Code Protection bit (Block 1 (001000-001FFF) not code-protected)

// CONFIG5H
#pragma config CPB = OFF        // Boot Block Code Protection bit (Boot Block (000000-0001FFh) not code-protected)
#pragma config CPD = OFF        // Data EEPROM Code Protection bit (Data EEPROM not code-protected)

// CONFIG6L
#pragma config WRT0 = OFF       // Write Protection bit (Block 0 (000200-000FFFh) not write-protected)
#pragma config WRT1 = OFF       // Write Protection bit (Block 1 (001000-001FFF) not write-protected)

// CONFIG6H
#pragma config WRTC = OFF       // Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write-protected)
#pragma config WRTB = OFF       // Boot Block Write Protection bit (Boot Block (000000-0001FFh) not write-protected)
#pragma config WRTD = OFF       // Data EEPROM Write Protection bit (Data EEPROM not write-protected)

// CONFIG7L
#pragma config EBTR0 = OFF      // Table Read Protection bit (Block 0 (000200-000FFFh) not protected from table reads executed in other blocks)
#pragma config EBTR1 = OFF      // Table Read Protection bit (Block 1 (001000-001FFF) not protected from table reads executed in other blocks)

// CONFIG7H
#pragma config EBTRB = OFF      // Boot Block Table Read Protection bit (Boot Block (000000-0001FFh) not protected from table reads executed in other blocks)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#define _XTAL_FREQ 4000000

#include <xc.h>
#include <stdio.h>
#include <stdlib.h>

#include "../PIC18_spi.X/spi.h"
#include "../PIC18_adc.X/adc.h"

void __interrupt( __high_priority ) h_isr( void );
void message_transmitted();
void delay(int);

uint8_t adc_res_hi = 0;         // Value of high byte
uint8_t adc_res_lo = 0;         // Value of low byte
uint8_t drive_dir = 0;          // Drive direction

uint8_t message_start = 0b11111111;

uint8_t adc_lob_flag = 0;       // Whether ADC low byte has been sent
uint8_t adc_hib_flag = 0;       // Whether ADC high byte has been sent
uint8_t drive_dir_flag = 0;     // Whether drive direction has been sent
uint8_t message_start_flag = 0; // Whether message start has been sent

uint8_t send_message = 1;



int main( int argc, char** argv ) 
{    
    // set system clock to 4MHz
    IRCF0 = 0;                 
    IRCF1 = 1;
    IRCF2 = 1;
    
    TRISD0 = 1;                     // RD0 input
    
    adc_init();                     // Initialize ADC module
    spi_master_init();              // Initialize SPI as master
    
    SSPBUF = 0b00000000;            // idk why this needs to be here to work im tired rn
    
    while( 1 )
    {
        drive_dir = RD0;                // Read drive direction off of RD0
        if ( send_message )
        {
            delay(50);
            if( SSPIF )                     // If buffer is empty
            //delay();
            {
                if ( !message_start_flag )
                {
                    SSPBUF = message_start;
                    message_start_flag = 1;
                    SSPIF = 0;
                }
                else if ( !adc_lob_flag )        // If ADC low byte hasn't been sent yet
                {
                    SSPBUF = adc_res_lo;    // Load ADC low byte into buffer
                    adc_lob_flag = 1;       // ADC low byte has been transmitted
                    SSPIF = 0;              // Waiting to transmit
                }
                else if ( !adc_hib_flag )
                {
                    SSPBUF = adc_res_hi;    // Load ADC high byte into buffer 
                    adc_hib_flag = 1;       // ADC high byte has been transmitted
                    SSPIF = 0;              // Waiting to transmit
                }
                else if ( !drive_dir_flag )
                {
                    SSPBUF = drive_dir;     // Load drive direction into buffer
                    drive_dir_flag = 1;     // Drive direction has been transmitted
                    SSPIF = 0;              // Waiting to transmit
                    //GODONE = 1;             // Start ADC again
                    message_transmitted();
                    GODONE = 1;             // Start ADC again
                    delay(1000);
                }
            }
        }
    }
    return ( EXIT_SUCCESS );
}

// high priority interrupts
void __interrupt( __high_priority ) h_isr( void ) 
{
    if ( ADIE && ADIF )
    {
        send_message = 1;
        
        adc_res_hi = ADRESH;    // Result high byte
        adc_res_lo = ADRESL;    // Result low byte
        adc_lob_flag = 0;       // Low byte has not been transmitted yet
        adc_hib_flag = 0;       // High byte has not been transmitted yet
        
        ADIF = 0;
        GODONE = 0;             // Stop adc until current reading has been sent out
    }
    return;    
}

void message_transmitted()
{
    message_start_flag = 0;
    drive_dir_flag = 0;
    //send_message = 0;
}

void delay(int end)
{
    int i;
    for( i = 0; i < end; i++ )
    {
        
    }
}

