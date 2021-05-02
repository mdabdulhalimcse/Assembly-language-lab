.STACK 100
.MODEL SAMLL 
.DATA
     A DW "kids $"
     B DW "tenage $" 
     C DW "adult $"
     
.CODE
    MAIN PROC 
        MOV AX, @DATA
        MOV DS, AX
        
        ;SCAN_1
        MOV AH, 1
        INT 21H
        MOV BL, AL
        
        ;SCAN_2
        MOV AH, 1
        INT 21H
        MOV CL, AL
        
        ;NEW LINE 
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;COMPARE
        CMP BL, '1'
        JG ADULT_1 
        JE EQN 
        JL kid 
        
 
       
        
        EQN:
        
        CMP CL, '2'
        JL kid
        JE kid
        JG tin
        
        
        JMP EXIT
        
        ADULT_1:
         
        CMP BL, '2' 
        JL tin
        JE ad
        JG ad 
        
         kid:
        
        LEA DX,a
        MOV AH,9
        INT 21H 
        
        JMP EXIT
        
        tin:
        
        LEA DX, b
        MOV AH, 9
        INT 21H 
        
        JMP EXIT
        
        ad:
        LEA DX, C
        MOV AH, 9
        INT 21H
         
        
         EXIT: 
        
        MAIN ENDP
        END MAIN  