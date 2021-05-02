.model small
.stack 100h
.data
   mas1 dw "please input a character : $" 
   ;mas2 dw "please input a character : $"
   mas3 dw "Congratulation! Your input match with integreted input! $" 
   mas4 dw "Sorry! Your input does not match! $"

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
      
        
      
   
    
       
    ;Compare code
    cmp bl,"Y"
    je g 
    
    lea dx,mas4
    mov ah,9
    int 21h
    jmp end_if
        
        
    g:
    lea dx,mas3
    mov ah,9
    int 21h
    
    end_if:     
            
        
     
     

    main endp
end main

















