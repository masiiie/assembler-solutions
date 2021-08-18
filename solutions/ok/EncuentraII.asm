%include "io.inc"

section .data
cadena times 100 db 0
char db 0
sol dd -1 ;si no -1 le resto al final la dm

section .text
global CMAIN
CMAIN:
    call problema
    xor eax, eax
    ret
    
    problema:
    GET_STRING cadena, 100
    GET_CHAR char
    cld
    mov esi,cadena
    mov edi,char
    
    ciclo:
    cmp[esi],byte 0
    je termino
    cmpsb 
    jne seguir
    cmp [sol],esi
    jl cambio
    jmp seguir
    cambio:
    mov dword[sol],esi
    seguir:
    dec edi
    jmp ciclo
    
    termino:
    cmp dword [sol],-1
    je imprimo
    sub dword [sol],cadena
    imprimo:
    PRINT_DEC 4,sol
    ret