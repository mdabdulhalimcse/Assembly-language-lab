.model small
.stack 100h
.data
   mas dw "Scan Value: $"
   mass dw "Print Value: $"

.code

main proc  
    mov ax,@data
    mov ds,ax
    
    
    ;Meassage print code
    lea dx,mas
    mov ah,9
    int 21h
    
    ;Scan code
   mov ah,1
   int 21h
   mov bl,al
            
   
    ;NewLine code
    mov ah,2
    mov dl,0dh
    int 21h 
    
    mov dl,0ah
    int 21h        
            
      
    ;Meassage print code
    lea dx,mas
    mov ah,9
    int 21h  
     
     ;Print code
    mov ah,2
    mov dl,bl
    int 21h
    
    
    main endp
end main




