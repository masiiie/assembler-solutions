%include "io.inc"

section .data
cantidad dd 0
suma dd 0
lista times 100 dd 0
total dd 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    call leer
    GET_DEC 4,suma
    GET_DEC 4,cantidad
    
    push 0
    push 0
    push 0
    call subconjuntos
    add esp,12
    xor eax, eax
    ret
    
    leer:
    mov edi,lista
    ciclo:
    GET_DEC 4,eax
    mov dword[edi],eax
    inc dword[total]
    add edi,4
    GET_CHAR eax
    cmp eax,10
    jne ciclo
    ret
    
    ;(suma,elementos,indice)
    subconjuntos:
    push ebp
    mov ebp,esp
    
    mov ebx,dword[esp + 12]
    cmp dword[cantidad],ebx
    jne continua
    mov ebx,dword[esp + 8]
    cmp ebx,dword[suma]
    jl final
    mov eax,-1
    PRINT_STRING "SI EXISTE"
    NEWLINE 
    PRINT_DEC 4,ebx
    NEWLINE
    jmp final
    
    continua:
    mov ebx,dword[esp + 16]
    cmp dword[total],ebx
    je final1
     
    mov eax,dword[esp + 16]
    mov edi,4
    xor edx,edx
    mul edi
    mov edi,eax
    mov eax,dword[lista + edi]
    add eax,dword[esp + 8]
    
    mov ebx,dword[esp + 16]
    inc ebx
    mov ecx,dword[esp + 12]
    inc ecx
    push ebx
    push ecx
    push eax
    call subconjuntos
    add esp,12
    cmp eax,-1
    je final
    
    mov eax,dword[esp + 16]
    inc eax
    mov ebx,dword[esp + 12]
    mov ecx,dword[esp + 8]
    push eax
    push ebx
    push ecx
    call subconjuntos
    add esp,12
    jmp final
    
    final1:
    PRINT_STRING "Llegue al final" 
    NEWLINE 
        
    final:
    mov esp,ebp
    pop ebp
    ret