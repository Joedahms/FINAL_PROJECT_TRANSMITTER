subtitle "Microchip MPLAB XC8 C Compiler v2.45 (Free license) build 20230818022343 Og1 "

pagewidth 120

	opt flic

	processor	18F4331
include "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/18f4331.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 54 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
DFLTCON equ 0F60h ;# 
# 118 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP3CON equ 0F61h ;# 
# 177 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP2CON equ 0F62h ;# 
# 236 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP1CON equ 0F63h ;# 
# 295 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP3BUFL equ 0F64h ;# 
# 300 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
MAXCNTL equ 0F64h ;# 
# 307 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP3BUFH equ 0F65h ;# 
# 312 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
MAXCNTH equ 0F65h ;# 
# 319 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP2BUFL equ 0F66h ;# 
# 324 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSCNTL equ 0F66h ;# 
# 331 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP2BUFH equ 0F67h ;# 
# 336 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSCNTH equ 0F67h ;# 
# 343 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP1BUFL equ 0F68h ;# 
# 348 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
VELRL equ 0F68h ;# 
# 355 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CAP1BUFH equ 0F69h ;# 
# 360 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
VELRH equ 0F69h ;# 
# 367 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
OVDCONS equ 0F6Ah ;# 
# 437 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
OVDCOND equ 0F6Bh ;# 
# 507 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FLTCONFIG equ 0F6Ch ;# 
# 569 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
DTCON equ 0F6Dh ;# 
# 695 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PWMCON1 equ 0F6Eh ;# 
# 761 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PWMCON0 equ 0F6Fh ;# 
# 831 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SEVTCMPH equ 0F70h ;# 
# 838 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SEVTCMPL equ 0F71h ;# 
# 845 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC3H equ 0F72h ;# 
# 852 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC3L equ 0F73h ;# 
# 859 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC2H equ 0F74h ;# 
# 866 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC2L equ 0F75h ;# 
# 873 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC1H equ 0F76h ;# 
# 880 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC1L equ 0F77h ;# 
# 887 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC0H equ 0F78h ;# 
# 894 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PDC0L equ 0F79h ;# 
# 901 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PTPERH equ 0F7Ah ;# 
# 908 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PTPERL equ 0F7Bh ;# 
# 915 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PTMRH equ 0F7Ch ;# 
# 922 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PTMRL equ 0F7Dh ;# 
# 929 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PTCON1 equ 0F7Eh ;# 
# 956 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PTCON0 equ 0F7Fh ;# 
# 1038 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PORTA equ 0F80h ;# 
# 1199 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PORTB equ 0F81h ;# 
# 1270 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PORTC equ 0F82h ;# 
# 1536 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PORTD equ 0F83h ;# 
# 1607 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PORTE equ 0F84h ;# 
# 1733 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR5 equ 0F87h ;# 
# 1740 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR5L equ 0F87h ;# 
# 1747 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR5H equ 0F88h ;# 
# 1754 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
LATA equ 0F89h ;# 
# 1866 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
LATB equ 0F8Ah ;# 
# 1978 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
LATC equ 0F8Bh ;# 
# 2090 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
LATD equ 0F8Ch ;# 
# 2202 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
LATE equ 0F8Dh ;# 
# 2254 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PR5 equ 0F90h ;# 
# 2261 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PR5L equ 0F90h ;# 
# 2268 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PR5H equ 0F91h ;# 
# 2275 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TRISA equ 0F92h ;# 
# 2280 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
DDRA equ 0F92h ;# 
# 2497 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TRISB equ 0F93h ;# 
# 2502 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
DDRB equ 0F93h ;# 
# 2719 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TRISC equ 0F94h ;# 
# 2724 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
DDRC equ 0F94h ;# 
# 2941 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TRISD equ 0F95h ;# 
# 2946 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
DDRD equ 0F95h ;# 
# 3163 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TRISE equ 0F96h ;# 
# 3168 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
DDRE equ 0F96h ;# 
# 3265 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADCHS equ 0F99h ;# 
# 3403 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADCON3 equ 0F9Ah ;# 
# 3475 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
OSCTUNE equ 0F9Bh ;# 
# 3533 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PIE1 equ 0F9Dh ;# 
# 3613 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PIR1 equ 0F9Eh ;# 
# 3693 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
IPR1 equ 0F9Fh ;# 
# 3773 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PIE2 equ 0FA0h ;# 
# 3814 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PIR2 equ 0FA1h ;# 
# 3855 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
IPR2 equ 0FA2h ;# 
# 3896 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PIE3 equ 0FA3h ;# 
# 3988 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PIR3 equ 0FA4h ;# 
# 4048 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
IPR3 equ 0FA5h ;# 
# 4108 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
EECON1 equ 0FA6h ;# 
# 4174 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
EECON2 equ 0FA7h ;# 
# 4181 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
EEDATA equ 0FA8h ;# 
# 4188 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
EEADR equ 0FA9h ;# 
# 4195 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
BAUDCON equ 0FAAh ;# 
# 4200 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
BAUDCTL equ 0FAAh ;# 
# 4375 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
RCSTA equ 0FABh ;# 
# 4380 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
RCSTA1 equ 0FABh ;# 
# 4585 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TXSTA equ 0FACh ;# 
# 4590 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TXSTA1 equ 0FACh ;# 
# 4841 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TXREG equ 0FADh ;# 
# 4846 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TXREG1 equ 0FADh ;# 
# 4853 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
RCREG equ 0FAEh ;# 
# 4858 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
RCREG1 equ 0FAEh ;# 
# 4865 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SPBRG equ 0FAFh ;# 
# 4870 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SPBRG1 equ 0FAFh ;# 
# 4877 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SPBRGH equ 0FB0h ;# 
# 4884 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
QEICON equ 0FB6h ;# 
# 5036 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
T5CON equ 0FB7h ;# 
# 5154 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ANSEL0 equ 0FB8h ;# 
# 5216 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ANSEL1 equ 0FB9h ;# 
# 5236 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCP2CON equ 0FBAh ;# 
# 5315 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCPR2 equ 0FBBh ;# 
# 5322 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCPR2L equ 0FBBh ;# 
# 5329 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCPR2H equ 0FBCh ;# 
# 5336 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCP1CON equ 0FBDh ;# 
# 5415 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCPR1 equ 0FBEh ;# 
# 5422 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCPR1L equ 0FBEh ;# 
# 5429 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
CCPR1H equ 0FBFh ;# 
# 5436 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADCON2 equ 0FC0h ;# 
# 5512 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADCON1 equ 0FC1h ;# 
# 5608 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADCON0 equ 0FC2h ;# 
# 5727 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADRES equ 0FC3h ;# 
# 5734 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADRESL equ 0FC3h ;# 
# 5741 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
ADRESH equ 0FC4h ;# 
# 5748 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SSPCON equ 0FC6h ;# 
# 5753 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SSPCON1 equ 0FC6h ;# 
# 5886 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SSPSTAT equ 0FC7h ;# 
# 6107 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SSPADD equ 0FC8h ;# 
# 6114 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
SSPBUF equ 0FC9h ;# 
# 6121 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
T2CON equ 0FCAh ;# 
# 6219 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PR2 equ 0FCBh ;# 
# 6224 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
MEMCON equ 0FCBh ;# 
# 6329 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR2 equ 0FCCh ;# 
# 6336 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
T1CON equ 0FCDh ;# 
# 6448 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR1 equ 0FCEh ;# 
# 6455 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR1L equ 0FCEh ;# 
# 6462 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR1H equ 0FCFh ;# 
# 6469 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
RCON equ 0FD0h ;# 
# 6612 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
WDTCON equ 0FD1h ;# 
# 6639 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
LVDCON equ 0FD2h ;# 
# 6704 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
OSCCON equ 0FD3h ;# 
# 6790 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
T0CON equ 0FD5h ;# 
# 6866 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR0 equ 0FD6h ;# 
# 6873 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR0L equ 0FD6h ;# 
# 6880 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TMR0H equ 0FD7h ;# 
# 6887 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
STATUS equ 0FD8h ;# 
# 6958 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR2 equ 0FD9h ;# 
# 6965 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR2L equ 0FD9h ;# 
# 6972 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR2H equ 0FDAh ;# 
# 6979 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PLUSW2 equ 0FDBh ;# 
# 6986 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PREINC2 equ 0FDCh ;# 
# 6993 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSTDEC2 equ 0FDDh ;# 
# 7000 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSTINC2 equ 0FDEh ;# 
# 7007 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
INDF2 equ 0FDFh ;# 
# 7014 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
BSR equ 0FE0h ;# 
# 7021 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR1 equ 0FE1h ;# 
# 7028 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR1L equ 0FE1h ;# 
# 7035 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR1H equ 0FE2h ;# 
# 7042 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PLUSW1 equ 0FE3h ;# 
# 7049 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PREINC1 equ 0FE4h ;# 
# 7056 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSTDEC1 equ 0FE5h ;# 
# 7063 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSTINC1 equ 0FE6h ;# 
# 7070 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
INDF1 equ 0FE7h ;# 
# 7077 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
WREG equ 0FE8h ;# 
# 7084 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR0 equ 0FE9h ;# 
# 7091 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR0L equ 0FE9h ;# 
# 7098 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
FSR0H equ 0FEAh ;# 
# 7105 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PLUSW0 equ 0FEBh ;# 
# 7112 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PREINC0 equ 0FECh ;# 
# 7119 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSTDEC0 equ 0FEDh ;# 
# 7126 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
POSTINC0 equ 0FEEh ;# 
# 7133 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
INDF0 equ 0FEFh ;# 
# 7140 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
INTCON3 equ 0FF0h ;# 
# 7232 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
INTCON2 equ 0FF1h ;# 
# 7309 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
INTCON equ 0FF2h ;# 
# 7426 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PROD equ 0FF3h ;# 
# 7433 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PRODL equ 0FF3h ;# 
# 7440 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PRODH equ 0FF4h ;# 
# 7447 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TABLAT equ 0FF5h ;# 
# 7456 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TBLPTR equ 0FF6h ;# 
# 7463 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TBLPTRL equ 0FF6h ;# 
# 7470 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TBLPTRH equ 0FF7h ;# 
# 7477 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TBLPTRU equ 0FF8h ;# 
# 7486 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PCLAT equ 0FF9h ;# 
# 7493 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PC equ 0FF9h ;# 
# 7500 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PCL equ 0FF9h ;# 
# 7507 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PCLATH equ 0FFAh ;# 
# 7514 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
PCLATU equ 0FFBh ;# 
# 7521 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
STKPTR equ 0FFCh ;# 
# 7595 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TOS equ 0FFDh ;# 
# 7602 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TOSL equ 0FFDh ;# 
# 7609 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TOSH equ 0FFEh ;# 
# 7616 "/home/joe/.mchp_packs/Microchip/PIC18Fxxxx_DFP/1.6.159/xc8/pic/include/proc/pic18f4331.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_spi_master_init
	FNROOT	_main
	global	_SSPEN
_SSPEN	set	0x7E35
	global	_SSPM3
_SSPM3	set	0x7E33
	global	_SSPM2
_SSPM2	set	0x7E32
	global	_SSPM1
_SSPM1	set	0x7E31
	global	_SSPM0
_SSPM0	set	0x7E30
	global	_CKE
_CKE	set	0x7E3E
	global	_TRISC5
_TRISC5	set	0x7CA5
	global	_TRISC7
_TRISC7	set	0x7CA7
	global	_TRISC4
_TRISC4	set	0x7CA4
	global	_CKP
_CKP	set	0x7E34
	global	_SMP
_SMP	set	0x7E3F
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	file	"dist/default/production/FINAL_PROJECT_TRANSMITTER.X.production.s"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAM,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAM
__pcstackCOMRAM:
?_spi_master_init:	; 1 bytes @ 0x0
??_spi_master_init:	; 1 bytes @ 0x0
?_main:	; 2 bytes @ 0x0
main@argc:	; 2 bytes @ 0x0
	ds   2
main@argv:	; 3 bytes @ 0x2
	ds   3
??_main:	; 1 bytes @ 0x5
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAM           95      5       5
;!    BANK0           160      0       0
;!    BANK1           256      0       0
;!    BANK2           256      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAM
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 5     0      5       0
;!                                              0 COMRAM     5     0      5
;!                    _spi_master_init
;! ---------------------------------------------------------------------------------
;! (1) _spi_master_init                                      0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _spi_master_init
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMRAM           5F      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!COMRAM              5F      5       5       1        5.3%
;!STACK                0      0       0       2        0.0%
;!BITBANK0            A0      0       0       3        0.0%
;!BANK0               A0      0       0       4        0.0%
;!BITBANK1           100      0       0       5        0.0%
;!BANK1              100      0       0       6        0.0%
;!BITBANK2           100      0       0       7        0.0%
;!BANK2              100      0       0       8        0.0%
;!BITBIGSFRhh         38      0       0       9        0.0%
;!BITBIGSFRhl         31      0       0      10        0.0%
;!BITBIGSFRl          34      0       0      11        0.0%
;!ABS                  0      0       0      12        0.0%
;!BIGRAM             2FF      0       0      13        0.0%
;!DATA                 0      0       0      14        0.0%
;!BIGSFR               0      0       0     200        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "main.c"
;; Parameters:    Size  Location     Type
;;  argc            2    0[COMRAM] int 
;;  argv            3    2[COMRAM] PTR PTR unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] int 
;; Registers used:
;;		cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2
;;      Params:         5       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_spi_master_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	14
global __ptext0
__ptext0:
psect	text0
	file	"main.c"
	line	14
	
_main:
;incstack = 0
	callstack 30
	line	16
	
l717:
;main.c: 16:     spi_master_init();
	call	_spi_master_init	;wreg free
	line	19
	
l7:
	global	start
	goto	start
	callstack 0
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,8314
	global	_spi_master_init

;; *************** function _spi_master_init *****************
;; Defined at:
;;		line 5 in file "spi.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMRAM   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=1
	file	"spi.c"
	line	5
global __ptext1
__ptext1:
psect	text1
	file	"spi.c"
	line	5
	
_spi_master_init:
;incstack = 0
	callstack 30
	line	7
	
l711:
;spi.c: 7:     TRISC4 = 1;
	bsf	c:(31908/8),(31908)&7	;volatile
	line	8
;spi.c: 8:     TRISC7 = 0;
	bcf	c:(31911/8),(31911)&7	;volatile
	line	9
;spi.c: 9:     TRISC5 = 0;
	bcf	c:(31909/8),(31909)&7	;volatile
	line	11
;spi.c: 11:     SMP = 1;
	bsf	c:(32319/8),(32319)&7	;volatile
	line	12
;spi.c: 12:     CKP = 0;
	bcf	c:(32308/8),(32308)&7	;volatile
	line	13
;spi.c: 13:     CKE = 0;
	bcf	c:(32318/8),(32318)&7	;volatile
	line	17
;spi.c: 17:     SSPM0 = 0;
	bcf	c:(32304/8),(32304)&7	;volatile
	line	18
;spi.c: 18:     SSPM1 = 0;
	bcf	c:(32305/8),(32305)&7	;volatile
	line	19
;spi.c: 19:     SSPM2 = 0;
	bcf	c:(32306/8),(32306)&7	;volatile
	line	20
;spi.c: 20:     SSPM3 = 0;
	bcf	c:(32307/8),(32307)&7	;volatile
	line	22
;spi.c: 22:     SSPEN = 1;
	bsf	c:(32309/8),(32309)&7	;volatile
	line	23
	
l32:
	return	;funcret
	callstack 0
GLOBAL	__end_of_spi_master_init
	__end_of_spi_master_init:
	signat	_spi_master_init,89
psect	smallconst,class=SMALLCONST,space=0,reloc=2,noexec
global __psmallconst
__psmallconst:
	db	0
	db 0	; dummy byte at the end
	global	__smallconst
	global	__mediumconst
	GLOBAL	__activetblptr
__activetblptr	EQU	0
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
