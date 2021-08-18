%include "io.inc"

section .data
mal db 'No hay solucion',0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4,ebx
    GET_DEC 4,ecx
    push ebx
    push ecx
    call ackerman
    add esp,8
    PRINT_DEC 4,eax
    xor eax, eax
    ret
    
    ;(n,m)
    ackerman:
    push ebp
    mov ebp,esp
    
    cmp dword[esp + 12],0
    je caso1
    jl sinsolucion
    
    cmp dword[esp + 8],0
    je caso2
    jl sinsolucion
    jmp caso3
    
    caso1:
    mov eax,dword[esp + 8]
    inc eax
    jmp retorno
    
    caso2:
    mov ebx,dword[esp + 12]
    dec ebx
    push ebx
    push dword 1
    call ackerman
    add esp,8
    jmp retorno
    
    caso3:
    mov eax,dword[esp + 8]
    dec eax
    push dword[esp + 12]
    push eax
    call ackerman
    add esp,8
    
    mov ebx,dword[esp + 12]
    dec ebx
    push ebx
    push eax
    call ackerman
    add esp,8
    jmp retorno 
    
    sinsolucion:
    PRINT_STRING mal
    retorno:
    mov esp,ebp
    pop ebp
    ret