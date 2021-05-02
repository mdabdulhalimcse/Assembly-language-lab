.model small
.stack 100h
.data


.code

main proc
    
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
            
     
     
     ;PRINT code
    mov ah,2
    mov dl,bl
    int 21h
    
    
    main endp
end main



