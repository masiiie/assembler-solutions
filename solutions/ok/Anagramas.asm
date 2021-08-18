%include "io.inc"

;%1 la direccion que apunta al caracter del original que quiero buscar en el patron
%macro Cabe 1.nolist
    mov eax,0
    mov esi,%1 ;aqui es donde esta el caracter del original que quiero buscar en el patron
    mov edi,bool
    mov ecx, dword[n]
    cld
    
    %%busca:
    cmpsb
    jne %%next
    
    sub edi,1
    mov byte[edi],byte '1'
    mov eax,1
    jmp %%encontrado
    
    %%next:
    sub esi,1
    loop %%busca 
    %%encontrado:
%endmacro


%macro ImprimeSolucion 0
mov esi,solucion
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

section .data
original times 1000000 db 0
patron times 1000000 db 0
bool times 1000000 db 0 ;1 si machea, 0 si no
n dd 0
m dd 0
solucion times 1000000 dd -1


section .text
global CMAIN
CMAIN:
    call problema
    mov ebp, esp; for correct debugging
    xor eax, eax
    ret
    
    problema:
    GET_STRING original,1000000
    GET_STRING patron,1000000
    call ContarOriginal
    call ContarPatron
    call Indices
    ImprimeSolucion
    ret
        
            
                    
   Indices:
    ;calculo la diferencia
    mov ecx,dword[m]
    sub ecx,dword [n]
    cmp ecx,0
    jl acabe
    mov edi,solucion
    
    inc ecx
    mov ebx,0;y en ebx el indice
    
    BUCLE:
    cmp ebx, ecx
    je acabe

    push edi
    push ecx    
    push ebx
    call Machea
    pop ebx
    pop ecx
    pop edi
    cmp eax, 1
    jne nolopongo

    mov eax, ebx
    stosd
    
    nolopongo:
    inc ebx
    jmp BUCLE
    acabe:
    ret
    
    ;(index)
    ;deja 1 en eax si a partir de la posicion index del original se puede encontrar un anagrama del patron
    Machea:
    mov eax,0
    call Limpia ;escribe el patron en bool
    mov ecx,dword [n]
    mov ebx,original  ;va a tener la direccion que le voy a pasar a Cabe 
    add ebx,dword [esp + 4]
    
    recorrer:
    push ecx
    push ebx
    Cabe ebx
    pop ebx
    pop ecx
    
    cmp eax,1
    jne nomacheo
    
    inc ebx
    loop recorrer
    mov eax,1
    nomacheo:
    ret
    
    ;deja en n la cantidad de letras del patron
    ContarPatron:
    xor ebx, ebx
    mov esi, patron
    cld
    siguiente:
    lodsb
    cmp al, byte 0
    je resultado
    inc ebx
    jmp siguiente
    resultado:
    mov dword[n],ebx
    ret
    
     ContarOriginal:
    xor ebx, ebx
    mov esi, original
    cld
    siguiente2:
    lodsb
    cmp al, byte 0
    je resultado2
    inc ebx
    jmp siguiente2
    resultado2:
    dec ebx  ;porque el me pone tambien el espacio del cambio de linea
    mov dword[m],ebx
    ret
    
    Limpia:
    cld
    mov esi,patron
    mov edi,bool
    mov ecx,dword[n]
    rep movsb
    ret
    
