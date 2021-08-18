%include "io.inc"

;%1 fila
;%2 columna
;deja en eax la direccion
%macro CalculaDireccion 2.nolist
mov eax, dword [n]
mov ebx,%1
mul ebx
add eax,%2
mov ebx, dword 4
mul ebx
add eax,matriz
%endmacro

;%1 direccion 
%macro ImprimeFila 1.nolist
mov esi, %1
mov ecx, 0
cicloI:
cmp ecx, dword [n]
je %%ya
lodsd 
PRINT_DEC 4,eax
inc ecx
jmp cicloI
%%ya:
%endmacro

%macro Imprimir 0
mov ecx, 0
bucleI:
cmp ecx, dword [n]
je %%finalizo
CalculaDireccion ecx,0
push ecx
ImprimeFila eax
NEWLINE
pop ecx
inc ecx
jmp bucleI
%%finalizo:
%endmacro

section .data
n dd 0
q dd 0

section .bss
matriz resd 1000000*1000000

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4,n
    call inicializar
    Imprimir
    xor eax, eax
    ret
 
 problema:
 GET_DEC 4,n
 GET_DEC 4,q
 
 call inicializar
 mov ecx, 0
 
 responder:
 cmp ecx, dword [q]
 je FF
 push ecx
 GET_CHAR eax
 GET_CHAR eax
 GET_CHAR eax
 cmp eax, dword 'R'
 je fila
 jmp columna
 
 fila:
 GET_DEC 4,eax
 dec eax
 push eax
 call SumarFila
 add esp,4
 jmp imprimo
 
 columna:
 GET_DEC 4,eax
 dec eax
 push eax
 call SumarColumna
 add esp,4
 jmp imprimo
 
 imprimo:
 PRINT_DEC 4,eax
 NEWLINE
 
 pop ecx
 inc ecx
 jmp responder
 
 FF:
 ret
 
 ;(fila)
 ;deja en eax la suma
 SumarFila:
 push ebp
 mov ebp,esp

 CalculaDireccion dword [esp + 8],0
 mov esi, eax
 mov edi,eax
 mov ebx,0   ;aqui estara provisionalmente la suma
 mov ecx, dword [n]
 
 repetir:
 lodsd 
 add ebx,eax
 xor eax,eax
 stosd
 loop repetir
 
 mov eax,ebx
 mov esp,ebp
 pop ebp
 ret
 
 ;(columna)
 ;deja en eax la suma
 SumarColumna:
 push ebp
 mov ebp,esp
 
 mov ecx,0;la fila
 CalculaDireccion 0,dword [esp + 8]
 mov esi,eax
 xor ebx, ebx
 BucleC:
 cmp ecx, dword [n]
 je  cambia
 add ebx, dword [esi]
 mov dword [esi],dword 0
 
 inc ecx
 mov eax, dword 4
 mov edx, dword [n]
 mul edx
 add esi, eax
 jmp BucleC
 
 cambia:
 mov eax, ebx
 
 mov esp,ebp
 pop ebp
 ret
 
    inicializar:
    mov ecx,dword [n]
    mov ebx,0
    bucle:
    push ebx
    CalculaDireccion ebx,0
    pop ebx

    push ecx
    push eax
    inc ebx
    push ebx
    ;(fila,direccion)
    call EscribirFila
    add esp,8
    pop ecx
    loop bucle
    ret
       
             
    ;(fila,direccion)
    ;usa ecx,edi,eax
    EscribirFila:
    push ebp
    mov ebp,esp
    
    mov ecx,dword [n]
    mov edi,[esp + 12]
    mov eax,dword[esp + 8]
    inc eax
    ciclo:
    stosd ;escribe en la direccion apuntada por edi lo que hay en eax
    inc eax
    loop ciclo
    
    mov esp, ebp
    pop ebp
    ret