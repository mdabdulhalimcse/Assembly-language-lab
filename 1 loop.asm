.Stack 100H
.MODEL small
.Data
.Code
   MAIN PROC 
      mov cx,10
 
    
        mov ah,2
        mov dl,'*'
        
        stop:
        int 21h
       loop stop
        
    
Main ENDP 
   NEWLINE PROC
   MOV AH,2
   MOV DL,0DH
   INT 21H
   MOV DL,0AH
   INT 21H
   
   RET
END MAIN   