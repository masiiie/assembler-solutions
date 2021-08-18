%include "io.inc"


%macro ImprimeNumeros 0
mov esi,numeros
cld
%%imprimo:
lodsd 
cmp eax,dword -1
je %%finalice
PRINT_DEC 4,eax
NEWLINE
jmp %%imprimo
%%finalice:
%endmacro

%macro MinimosSucesivos 0
mov eax,numeros
%%proximo:
cmp dword [eax],-1
je %%termine
push eax
ProximoMenor eax
pop eax
add eax,dword 4
jmp %%proximo
%%termine:
%endmacro

;%1 la direccion donde va el proximo menor
%macro ProximoMenor 1.nolist
mov edi, %1
mov esi,edi
add esi,dword 4
cld
%%buscar:
cmp dword[esi],-1
je %%finalizo
cmpsd
ja %%noswap
sub edi,dword 4
sub esi,dword 4

mov eax,dword [edi]
movsd
sub esi,dword 4
mov dword [esi],eax
add esi,dword 4
%%noswap:
sub edi,dword 4
jmp %%buscar
%%finalizo:
%endmacro

%macro Leer 0
mov ecx,dword [N]
mov ebx,numeros
%%lee:
GET_DEC 4,[ebx]
add ebx,4
loop %%lee
%endmacro

section .data
N dd 0
numeros times 1000000 dd -1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    call problema
    xor eax, eax
    ret
    
    problema:
    GET_DEC 4,N
    Leer
    MinimosSucesivos
    ImprimeNumeros
    ret