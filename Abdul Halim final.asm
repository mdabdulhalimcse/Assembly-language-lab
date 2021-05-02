.model small     ;Md. Abdul Halim
.stack 100h      ;ID: 171-15-1408
.data

    m0 dw "         !!!!!!Welcome to our restaurant management system!!!!!!$"
    m1 dw 10,13,10,13, "Which menu do you want ??please select:$"
    m2 dw 10,13,10,13, "1.Rice 10/- 2.Chiken 50/- 3.Egg 20/- $"
    m3 dw 10,13,10,13, "Select the menu number:$"       
    m4 dw 10,13,10,13, "SORRY!!!There is no more than 3 item,so select the item$"
    m5 dw 10,13,10,13, "Enter quantity:$" 
    m6 dw 10,13,10,13, "Total price: $"  
    m7 dw 10,13,10,13, " Re-odrer : Press <1>$",
    m8 dw 10,13,10,13, " Exit : Press Any key$"
    rice_price dw 10
    chiken_price dw 50
    egg_price dw 20
m9 dw 10,13,10,13, "      *****THANK YOU*****$"       
.code
    main proc
        
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        Lea dx,m0
        int 21h  
        
        start:
        
        mov ah,9
        Lea dx,m1
        int 21h
        
        menu:
        
        mov ah,9
        Lea dx,m2
        int 21h
        
        mov ah,9
        Lea dx,m3
        int 21h
        
        mov ah,1
        int 21h        
        
        cmp al,'1'
        je rice
        cmp al,'2'
        je chiken
        cmp al,'3'
        je egg
       
        menuadd:
   
        mov ah,9
        lea dx,m4
        int 21h 
   
        mov ah,9
        Lea dx,m2
        int 21h 
        
        mov ah,9
        lea dx,m3
        int 21h
        
        mov ah,1
        int 21h        
        
        cmp al,'1'
        je rice
        cmp al,'2'
        je chiken
        cmp al,'3'
        je egg
        
       
        
        chiken:
        
            mov ah,9
            Lea dx,m5
            int 21h
            
            xor ax,ax             
            call input
            mul chiken_price  
            mov bx,ax
            jmp totalprice
        
        rice:
        
            mov ah,9
            Lea dx,m5
            int 21h 
            
            xor ax,ax            
            call input    
            mul rice_price          
            mov bx,ax 
            jmp totalprice 
            
        egg:    
            mov ah,9
            Lea dx,m5
            int 21h 
            
            xor ax,ax    
            call input   
            mul egg_price 
            mov bx,ax
            jmp totalprice 
                    
        totalprice:
         
            mov ah,9
            Lea dx,m6
            int 21h 
            
            xor ax,ax          
            mov ax,bx
            call output
            
            mov ah,9
            Lea dx,m7
            int 21h
            
            mov ah,9
            Lea dx,m8
            int 21h
            
            mov ah,1
            int 21h
            
            cmp al,'1'
            je start                
            
            mov ah,9
            Lea dx,m9
            int 21h
            jmp exit
        
            exit:
        main endp 

        OUTPUT PROC    ;Khadija Khanom meem

    PUSH  AX
    PUSH  BX
    PUSH  CX
    PUSH  DX

OR AX, AX
JGE END_IF1

PUSH AX 
MOV AH, 2
MOV DL, ' '

INT 21H
POP AX
NEG AX

END_IF1:

    XOR CX, CX
    MOV  BX, 10D

REPEAT1: 

    XOR DX, DX
    DIV BX
    PUSH DX
    INC CX


    OR  AX, AX
    JNE   REPEAT1
    
    MOV   AH, 2

PRINT_LOOP:

   POP  DX
   OR DL, 30H
   INT 21H
   LOOP  PRINT_LOOP

   POP DX
   POP CX
   POP BX
   POP AX

RET
OUTPUT ENDP
             
         INPUT PROC 

PUSH BX
PUSH CX
PUSH DX
BEGIN:

MOV AH, 2
MOV DL, ' '
INT 21H

XOR BX, BX
XOR CX, CX

MOV AH, 1
INT 21H

CMP AL, '-'
JE MINUS

CMP AL, '+'
JE PLUS
JMP REPEAT2

MINUS:
MOV CX, 1
PLUS:
INT 21H

REPEAT2:

CMP AL, '0'     
JNGE NOT_DIGIT 

CMP AL, '9'   

JNLE NOT_DIGIT

AND AX, 000FH
PUSH AX

MOV AX,10
MUL BX
POP BX
ADD BX, AX

MOV AH, 1
INT 21H
CMP AL, 0DH
JNE REPEAT2

MOV AX, BX
OR CX, CX
       
JE EXIT1
NEG AX

EXIT1:

POP DX
POP CX
POP BX
RET

NOT_DIGIT:

MOV AH, 2
MOV DL, 0DH
INT 21H
MOV DL, 0AH
INT 21H
JMP BEGIN
INPUT ENDP 
  
    end main