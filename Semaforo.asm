;IFMA - CAMPUS MONTE CASTELO - ENGENHARIA ELÉTRICA INDUSTRIAL
;Período - 2022.1 - Professora: Lucilene Mouzinho
;Integrantes: Reinier Soares(20211EE0021), 
;			  Luis Henrique(20211EE0002), 
;			  Matheus Espíndola(20211EE0005)

//------------------------Projeto Sémaforo------------------------------//
.INCLUDE "M328DEF.INC"
.org 0x0000

//Instrução----Operando-----Comentário----------------------------------------

// Vermelho 1
SBI 		DDRB,0		;Bit=1, faz pino 0 da portaB (PB0) como pino de saída		

// Amarelo 1
SBI 		DDRB,1		;Bit=1, faz pino 1 da portaB (PB1) como pino de saída		

// Verde 1
SBI 		DDRB,2		;Bit=1, faz pino 2 da portaB (PB2) como pino de saída		

// Vermelho 2 
SBI 		DDRC,0		;Bit=1, faz pino 0 da portaC (PC0) como pino de saída		

// Amarelo 2	
SBI 		DDRC,1		;Bit=1, faz pino 1 da portaC (PC1) como pino de saída		

// Verde 2
SBI 		DDRC,2		;Bit=1, faz pino 2 da portaC (PC2) como pino de saída		


L1:
	SBI 	PORTB, 0	;Vermelho 1 Acende											
	SBI 	PORTC, 2	;Verde 2 Acende												
	RCALL 	DELAY_15s	;Chama a Função DELAY_15s									
			
	RCALL	PISCA_VER2	;Chama a Função PISCA_VERDE_2								

	CBI		PORTC, 2	;Verde 2 Apaga												
	SBI 	PORTC, 1	;Amarelo 2 Acende											
	RCALL 	DELAY_5s	;Chama a Função DELAY_5s									

	CBI		PORTC, 1	;Amarelo 2 Apaga											
	CBI		PORTB, 0	;Vermelho 1 Apaga											
	SBI		PORTC, 0	;Vermelho 2 Acende											
	SBI		PORTB, 2	;Verde 1 Acende												
	RCALL	DELAY_15s	;Chama a Função DELAY_15s								

	RCALL	PISCA_VER1	;Chama a Função PISCA_VERDE_1								

	CBI		PORTB, 2	;Verde 1 Apaga												
	SBI		PORTB, 1	;Amarelo 1 Acende											
	RCALL	DELAY_5s	;Chama a Função DELAY_5s									

	CBI		PORTB, 1	;Apagar Amarelo 1											
	CBI		PORTC, 0	;Apagar Vermelho 2											
			
	RJMP 	L1			;Jump L1													


// Função para o Delay de 1 segundo
DELAY_1s:
	LDI 	R20,15		;R20 = 21(decimal)											
delay1:
	LDI 	R19,105		;R19 = 252(decimal)											
delay2:
	LDI 	R18,105		;R18 = 251(decimal)											
delay3:
	DEC 	R18			;Decrementa em R18									
	BRNE 	delay3		;Vai pra delay3 se Z=0, ou seja quando R18!=0		

	DEC 	R19			;Decrementa em R19								
	BRNE 	delay2		;Vai pra delay3 se Z=0, ou seja quando R19!=0
	DEC 	R20			;Decrementa em R20										
	BRNE	delay1		;Vai pra delay3 se Z=0, ou seja quando R20!=0			 

	RET					;RETORNA													
// No BRNE se a condição for verdadeira o ciclo é 2, senão o ciclo é 1.

// Função para o Delay de 15 segundos
DELAY_15s: 	
	RCALL	DELAY_5s	;Chama a Função DELAY_5s									
	RCALL	DELAY_5s	;Chama a Função DELAY_5s									
	RCALL	DELAY_5s	;Chama a Função DELAY_5s	
	RET					;RETORNA													

// Função para o Delay de 5 segundos
DELAY_5s:	        
	RCALL 	DELAY_1s	;Chama a Função DELAY_1s									
	RCALL 	DELAY_1s	;Chama a Função DELAY_1s									
	RCALL 	DELAY_1s	;Chama a Função DELAY_1s									
	RCALL 	DELAY_1s	;Chama a Função DELAY_1s										
	RCALL 	DELAY_1s	;Chama a Função DELAY_1s									
	RET					;RETORNA													

PISCA_VER1:

	CBI		PORTB, 2
	RCALL 	DELAY_1s
	SBI		PORTB, 2
	RCALL 	DELAY_1s
	CBI		PORTB, 2
	RCALL 	DELAY_1s
	SBI		PORTB, 2
	RCALL 	DELAY_1s
	CBI		PORTB, 2
	RCALL 	DELAY_1s
	SBI		PORTB, 2
	RET	
																					
PISCA_VER2:
	CBI		PORTC, 2
	RCALL 	DELAY_1s
	SBI		PORTC, 2
	RCALL 	DELAY_1s
	CBI		PORTC, 2
	RCALL 	DELAY_1s
	SBI		PORTC, 2
	RCALL 	DELAY_1s
	CBI		PORTC, 2
	RCALL 	DELAY_1s
	SBI		PORTC, 2	

	RET					;RETORNA												
	
