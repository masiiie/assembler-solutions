%include "io.inc"

;%1 cadena
%macro Imprimir 1.nolist
mov ebx, %1
%%ciclo:
cmp [ebx],byte 0
je %%finalice
PRINT_CHAR [ebx]
inc ebx
jmp %%ciclo
%%finalice:
%endmacro

section .data
cadena1 times 100 db 0
cadena2 times 100 db 0
index dd 0
sol times 100 db 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    call problema
    xor eax, eax
    ret
    
    problema:
    GET_STRING cadena1,100
    GET_STRING cadena2,100
    GET_DEC 4,index
    
    cld
    mov edi,sol
    mov esi,cadena1
    mov ecx,dword[index]
    rep movsb
    
    push esi
    mov esi,cadena2
    ciclo1:
    cmp byte[esi],0
    je termine1
    movsb
    jmp ciclo1
    
    termine1:
    pop esi
    dec edi
    ciclo2:
    cmp byte[esi],0
    je imprimir
    movsb
    jmp ciclo2
    
    imprimir:
    Imprimir sol
    ret