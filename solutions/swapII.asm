%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 4,eax
    call swapII
    PRINT_DEC 4,eax
    xor eax, eax
    ret
    
    swapII:
    mov cl,0
    xor esi,esi
    ciclo:
    mov ebx,3
    and ebx,eax
    
    cmp ebx,2
    jne uno
    mov ebx,1
    jmp suma
    
    uno:
    cmp ebx,1
    jne suma
    mov ebx,2
    
    suma:
    push eax
    push ecx
    
    mov eax,2
    mul cl 
    mov cl,al
    shl ebx,cl
    or esi,ebx
    
    pop ecx
    pop eax
    
    shr eax,2
    inc cl
    cmp cl,16
    jne ciclo
    
    mov eax,esi
    ret