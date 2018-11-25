.Stack 100H
.MODEL small
.Data
.Code
   MAIN PROC 
    
    xor cx,cx
    
    mov ah,1
    int 21h 
    
    while_loop:
    cmp al,0dh
    je pop_
    push ax
    inc cx
    int 21h
    jmp while_loop 
    
    pop_:
    pop dx
    mov ah,2 
    int 21h
    loop pop_
    
        
    
Main ENDP 
   NEWLINE PROC
   MOV AH,2
   MOV DL,0DH
   INT 21H
   MOV DL,0AH
   INT 21H
   
   RET
END MAIN   