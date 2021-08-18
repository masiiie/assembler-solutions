%include "io.inc"

;%1 donde voy a escribir y %2 donde dejo el lengh
%macro Leer 2.nolist
mov dword[%2],0
mov edi,%1
%%lee:
GET_CHAR al
cmp al,byte 10
je %%finaliza
inc dword[%2]
stosb
jmp %%lee
%%finaliza:
%endmacro


;%1 lo que se quiere imprimir
;%2 cantidad
%macro Imprime 2.nolist
mov ecx,%2
mov ebx,%1
%%imprime:
PRINT_CHAR [ebx]
inc ebx
loop %%imprime
%endmacro

;%1 es un indice de data
%macro Machea 1.nolist
mov eax,0

mov ebx,[n]
sub ebx,%1
sub ebx,[m]
jl %%nosepuede

mov edi,%1
add edi,datos
mov esi,patron
mov ecx,[m]
%%mache:
cmpsb 
jne %%nosepuede
loop %%mache
mov eax,1
%%nosepuede:
%endmacro

section .data
datos times 10 db 0
patron times 10 db 0
n dd 0;datos
m dd 0;patron

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    Leer datos,n
    Leer patron,m
    Machea 1
    PRINT_DEC 4,eax
    xor eax, eax
    ret
    