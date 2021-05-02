.stack 100h
.model small
.data
    k db "kid $"
    t db "tinage $"
    a db "adult $" 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,1
    int 21h
    mov bl,al
    mov ah,1
    int 21h
    mov cl,al  
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
            
    cmp bl,'1'
    jl kid
    je x
    jg adt
    
    x:
    
    cmp cl,'2'
    jle kid
    jg tin
    
    kid:
    
    lea dx,k
    mov ah,9
    int 21h
    
    jmp exit
    
    tin:
    lea dx,t
    mov ah,9
    int 21h
    
    jmp exit
    
    
    adt:
    
    lea dx,a
    mov ah,9
    int 21h
    
    jmp exit
            
  
     exit:
    main endp
end main
        