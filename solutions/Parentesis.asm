%include "io.inc"

;deja 1 en eax si est balanceado
%macro EStaBalanceado 0
mov ecx,[N]
mov ebx,0
mov esi,parentesis
cld
%%balance:
lodsb
cmp al,byte '('
jne %%nosumo
inc ebx
%%nosumo:
cmp al,byte ')'
jne %%noresto
cmp ebx,0
je %%desbalanceado
dec ebx
%%noresto
loop %%balance

cmp ebx,0
jne %%desbalanceado
mov eax,1
%%desbalanceado:
%endmacro

%macro Leer 0
mov ecx,dword[N]
mov ebx,parentesis
%%lee:
GET_CHAR [ebx]
inc ebx
loop %%lee
%endmacro

%macro ImprimirParentesis 0
mov ecx,dword[N]
mov ebx,parentesis
%%imprime:
cmp [ebx],dword 0
jne %%char
PRINT_UDEC 1,[ebx]
%%char:
PRINT_CHAR [ebx]
inc ebx
dec ecx
cmp ecx,dword 0
je %%termino
jmp %%imprime
%%termino:
NEWLINE
%endmacro

section .data
parentesis times 20 db 0
N dd 0


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4,N
    GET_CHAR eax
    Leer
    push dword 0
    push dword 0
    call Parentesis
    add esp,8
    xor eax, eax
    ret
    
    
    Problema:
    GET_DEC 4,N
    GET_CHAR eax
    Leer
    push 0
    push 0
    call Parentesis
    add esp,8
    ret
    
    Parentesis:
    push ebp
    mov ebp,esp
    
    mov eax,[N]
    cmp dword[esp + 8],eax
    je comprobar
    
    mov ebx,dword[esp + 8]
    mov al,[parentesis + ebx]
    cbw
    cwd
    push eax
    
    mov[parentesis + ebx],byte 0
    mov ebx,dword[esp + 8]
    inc ebx
    mov edx,dword[esp + 12]
    inc edx
    push edx
    push ebx
    call Parentesis
    add esp, 8
    
    pop eax
    
    mov ebx,dword[esp + 8]
    mov [parentesis + ebx],al ;desmarque
    inc ebx
    push dword[esp + 12]
    push ebx
    call Parentesis
    add esp, 8
    jmp nadamas
    
     comprobar:
    mov eax,dword[esp + 12]
    mov ebx,2
    div ebx
    cmp edx,dword 0
    jne nadamas
    
    EStaBalanceado
    cmp eax,1
    jne nadamas
    ImprimirParentesis
    
    nadamas:
    mov esp,ebp
    pop ebp    
    ret