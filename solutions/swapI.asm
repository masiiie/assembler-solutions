%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax,eax
    GET_DEC 1,al
    call swap
    PRINT_DEC 1,al
    NEWLINE
    PRINT_UDEC 1,al 
    xor eax, eax
    ret
    
    swap:
    mov bl,al
    mov cl,4
    shr al,cl
    shl bl,cl
    or al,bl
    ret
    
    