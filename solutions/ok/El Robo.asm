%include "io.inc"
section .data
	cant dw  0
	ntmp dw  0
	dir dw 0	
	nformat dw "%d", 0
        printformat dw "%d ",0
	gmaxima dw 0


section .text
    extern _scanf
    extern _printf
    extern _malloc
    extern _free

global  _main
_main:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    push dword cant
    push dword nformat
    call _scanf
    add esp, 8
    
    xor edx, edx
    mov eax, [cant]
    mov ecx, 4
    mul ecx 
    
    push eax
    call _malloc
    add esp, 4
    mov [dir], eax

    mov ecx, [cant]
    cmp ecx, 0
    je terrorexit

    xor esi,esi

    ciclo:
    pusha 
    push dword ntmp
    push dword nformat
    call _scanf   
    add esp,8    
    popa
    mov ebx, [ntmp]
    mov dword [eax + esi*4], ebx

    inc esi
    cmp esi, ecx
    jne ciclo

    push dword [dir]
    push dword nformat
    call _printf
    add esp, 8

    
    ret

    terrorexit:
    mov eax, 0
    ret