%include "io.inc"

section .data
string times 101 db 0
     
section .text

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax,eax
    GET_STRING string,102
    xor ecx,ecx
    xor edx,edx
    xor ebx,ebx
 while:
       cmp dword[string+ecx],0
       je next
       inc ecx
       jmp while
       
      
 next:
     cmp ecx,1
     je yes
     sub ecx,2
      
      xor esi,esi
   while2:   
           mov bl,[string+ecx]
           mov al,[string+esi]
           cmp eax,ebx
           jne no
           cmp ecx,0
           je   yes
          dec ecx
          inc esi
          jmp while2
              
              
  no:
     PRINT_STRING 'NO'              
      xor eax, eax
    ret 
  
  yes:   
     PRINT_STRING 'YES'                           
    xor eax, eax
    ret