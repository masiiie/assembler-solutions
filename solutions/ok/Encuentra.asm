%include "io.inc"

section .data
cadena times 100 db 0
caracter dd 0

section .text
global CMAIN
CMAIN:
    call problema
    xor eax, eax
    ret
    
    problema:
    GET_STRING cadena,100
    GET_CHAR caracter
    cld
    mov esi,caracter
    mov edi,cadena
    ciclo:
    cmp [edi],dword 0
    je noesta
    cmpsb 
    je esta
    dec esi
    jmp ciclo
    
    esta:
    sub edi,cadena
    mov eax,edi
    jmp imprime
    
    noesta:
    mov eax, -1
    imprime:
    PRINT_DEC 4,eax
    ret