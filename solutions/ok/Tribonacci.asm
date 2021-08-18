%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4,eax
    push eax
    call Tribonacci
    add esp,4
    PRINT_STRING 'solucion '
    PRINT_UDEC 4,eax
    NEWLINE
    PRINT_STRING 'esi '
    PRINT_UDEC 4,esi
    NEWLINE
    PRINT_STRING 'edi '
    PRINT_UDEC 4,edi
    
    xor eax, eax
    ret
   
    
     ;n  call ebp
     ;edi esi
    Tribonacci:
    push ebp
    mov ebp,esp
    
    mov esi,0
    mov edi,0
    
    cmp dword[esp + 8],0
    jne uno
    mov eax,0
    jmp retornar
    
    uno:
    cmp dword[esp + 8],1
    jne dos
    mov eax,1
    jmp retornar
    
    dos:
    cmp dword[esp + 8],2
    jne tres
    mov eax,1
    mov edi,1
    jmp retornar
    
    tres:
    cmp dword[esp + 8],3
    jne calcula
    mov eax,2
    mov edi,1
    mov esi,1
    jmp retornar
    
    calcula:
    mov eax,dword[esp + 8]
    sub eax,3
    push eax
    call  Tribonacci
    add esp,4
    
    add esi,edi
    add esi,eax
    
    add edi,eax
    add edi,esi
    
    add eax,esi
    add eax,edi
    
    retornar:
    mov esp,ebp
    pop ebp
    ret