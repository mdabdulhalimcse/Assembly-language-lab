.model small
.stack 100h
.data
   mas1 dw "Enter the  first value : $" 
   mas2 dw "Enter the  second value: $"
   mas3 dw "Print the greater value: $"

.code

main proc  
    mov ax,@data
    mov ds,ax
    
    
    ;print the first Meassage 
    lea dx,mas1
    mov ah,9
    int 21h
    
    ;Scan 1
    mov ah,1
    int 21h
    mov bl,al 
    
    ;NewLine print
    mov ah,2
    mov dl,0dh
    int 21h 
    mov dl,0ah
    int 21h        
      
    ;the second meassage print   
    lea dx,mas2
    mov ah,9
    int 21h
    
    ;Scan 2   
    mov ah,1
    int 21h 
    mov cl,al
            
    ;NewLine print
    mov ah,2
    mov dl,0dh
    int 21h 
    mov dl,0ah
    int 21h        
      
    ;the second meassage print   
    lea dx,mas3
    mov ah,9
    int 21h
    
       
    ;Compare code
    cmp bl,cl
    jg g 
    mov ah,2
    mov dl,cl
    int 21h
      
    jmp end_if
        
        
    g:
    mov ah,2
    mov dl,bl
    int 21h
    
    end_if:     
            
        
     
     

    main endp
end main













