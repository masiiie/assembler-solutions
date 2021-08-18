%include "io.inc"

%macro Array 0
mov ebx, 0
cicloP:
cmp ebx,[count]
je finP
mov eax, 4
mul ebx
GET_DEC 4, ecx
mov dword [numeros + eax], ecx
inc ebx
jmp cicloP
finP:
%endmacro

section .data
numeros times 80 dd 0,0,0,0,0,0
solucion dd 0
count dd 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    call problema
    xor eax, eax
    ret
  
    problema:
    GET_DEC 4, [count]
    
mov ebx, 0
cicloP:
cmp ebx,[count]
je finP
mov eax, 4
mul ebx
GET_DEC 4, ecx
mov dword [numeros + eax], ecx
inc ebx
jmp cicloP
finP:
    
    mov [solucion],dword 0
    push 0
    push -1
    push 0
    call subsecuencia
    add esp, 12
    PRINT_DEC 4,[solucion]
    ret
        
    subsecuencia:
    push ebp
    mov ebp, esp
    
    mov eax, [count]
    cmp eax,dword[esp + 8]
    je final1
    
    cmp dword [esp + 12], -1
    je nocompares
    
    mov eax, 4
    mov ebx, [esp + 8]
    mul ebx
    mov ecx, dword[numeros + eax]
    cmp dword [esp + 12], ecx
    ja nomepongo
    
    nocompares:
    ;en eax esta el desplazamiento
    mov ebx,dword [esp + 16]
    inc ebx
    ;en ebx esta el lengh de la cadena si me incluyo
    cmp ebx, [solucion]
    jb sigue
    mov [solucion], ebx
    
    sigue:
    mov ecx, dword [esp + 8]
    inc ecx
    push ebx
    push dword [numeros + eax]
    push ecx
    call subsecuencia
    add esp, 12
            
    nomepongo:
    mov eax, [esp +16]
    mov ebx, [esp + 12]
    mov ecx, [esp + 8]
    push eax
    push eax
    push eax
    call subsecuencia
    add esp, 12
    
    final1:
    mov esp, ebp
    pop ebp
    ret