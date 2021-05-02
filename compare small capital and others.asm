.stack 100h
.model small
.data
    s db "small letter $"
    c db "capital letter $"
    n db "no alphabet $" 
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
    
     cmp bl,65
     jge x
     
     lea dx,n
     mov ah,9
     int 21h
     
     jmp exit
     
     cmp bl,122
     jle x
     
     lea dx,n
     mov ah,9
     int 21h
     
     jmp exit
     
     x:
     
     cmp bl,90
     jle capital
     
     cmp bl,97
     jge small
     
     lea dx,n
     mov ah,9
     int 21h
     
     jmp exit
     
    
     small:
    lea dx,s
    mov ah,9
    int 21h
    jmp exit 
    
    capital:
    lea dx,c
    mov ah,9
    int 21h
    jmp exit
    
    
    exit:
    
    main endp
end main
        