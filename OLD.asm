.STACK 100
.MODEL SAMLL 
.DATA
     A DW "ADULT $"
     B DW "CHILD $" 
     C DW "OLD $"
     
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
        JL CHILD 
        
 
        CHILD:
        
        LEA DX,B
        MOV AH,9
        INT 21H 
        
        JMP EXIT
        
        EQN:
        
        CMP CL, '8'
        JL CHILD
        JE ADULT
        JG ADULT
        
        JMP EXIT
        
        ADULT_1:
         
        CMP BL, '6' 
        JL ADULT
        JE OLD
        JG OLD
        
        ADULT:
        
        LEA DX, A
        MOV AH, 9
        INT 21H 
        
        JMP EXIT
        
        OLD:
        LEA DX, C
        MOV AH, 9
        INT 21H
         
        
         EXIT: 
        
        MAIN ENDP
        END MAIN  