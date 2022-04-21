;******************************************************
; pantalla.asm
; Ejercicio para imprimir por pantalla con printf y puts
; Objetivos
;	- usar printf con y sin formato
;	- usar puts y comparar la diferencia con printf
;
;******************************************************
global	main
extern	printf
extern	puts

section	.data
	mensaje1	db	'Imprimo con printf--'0
	mensaje2	db	'Imprimo con puts',0
	mensaje3	db	'Imprimo con printf el numero %li',10,0
	numero		dq	1234
	;numero		dw	-1		;imprime 65535!! por estar definido como dw (16 bits) y formatear a %li (long integer 64 bits)
	;numero		dq	0ABh 	;imprime 171
section	.bss

section	.text
main:
	sub     rsp, 28h             ; Reserva espacio para el Shadow Space
									;deje rsp en una dir multiplo de 16
	mov		rcx,mensaje1	;Parametro 1: direccion del mensaje a imprimir
	call	printf				;printf: imprime hasta el 0 binario. NO agrega fin de linea

	mov		rcx,mensaje2	;Parametro 1: direccion del mensaje a imprimir
	call	puts					;puts: imprime hasta el 0 binario y agrega fin de linea

	mov		rcx,mensaje3	;Parametro 1: direccion del mensaje a imprimir
	mov		rdx,[numero]	;Parametro 2: dato a imprimir formateado
	call	printf
	
	add     rsp, 28h             ; Libera el espacio reservado del Shadow Space
	ret
