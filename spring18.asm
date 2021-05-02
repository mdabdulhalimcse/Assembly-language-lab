.stack 100h
.model small
.data

ms1 db "Numeric $"
ms2 db "not numeric $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al 
    
    mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah
     int 21h
     
    
    cmp bl,'0' 
    
    
    jl nn
    cmp bl,'9'
    jg nn 
    
   
    
    
    lea dx,ms1
    mov ah,9
    int 21h
    
    jmp exit
    
    nn:
    lea dx,ms2
    mov ah,9
    int 21h 
    jmp exit
    
    
    exit: 
    
    mov ah,4ch
    int 21h
    
    main endp
end main

