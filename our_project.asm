.stack 100h
.model small
.data 
      
       I DW "Here is our student ID$"
      
       s dw "                !!!!!!!!WELCOME TO OUR STUDENT DATABASE!!!!!!!!$"
      
       T DW "THANK YOU.$"

       m1 dw "Please Enter the ID You Want to Find : $" 
    
       i1 dw "1.171-15-1151  2.171-15-1181  3.171-15-1408  4.171-15-1478$"
     
       N DW "SORRY ! YOUR ID IS NOT FOUND $"
       NA DW "DO YOU WANT TO CONTINUE??  PRESS Y OR PRESS ANY KEY TO EXIT. $"
    
       m2 dw "Name : Khadiza Khanom Meem $" 
       m3 dw "Mobile : 01736355306$" 
       m4 dw "Dept : Computer Science and Engineering $" 
        
       m5 dw "Name : Farzana Hasnat Mou $" 
       m6 dw "Mobile : 01736355306$" 
      
      
       m8 dw "Name : Md. Abdul Halim $" 
       m9 dw "Mobile : 01736355306$" 
     
      
       m11 dw "Name : Sadia Afrin Tisha $" 
       m12 dw "Mobile : 01736355306$" 
    
.code
        main proc
        
        mov ax,@data
        mov ds,ax
        
        
        lea dx,S
        mov ah,9
        int 21h  
        CALL NEWLINE
        
        
        FIRST:
       
        CALL NEWLINE
        
        lea dx,i
        mov ah,9
        int 21h
        
        call newline 
        call newline
          
        ;msg
        lea dx,I1
        mov ah,9
        int 21h 
        
        CALL NEWLINE 
        CALL NEWLINE 
        
        ;msg
        lea dx,m1
        mov ah,9
        int 21h  
        
        ;scan
        mov ah,1
        int 21h
        
        mov bl,al 
        
        cmp bl,'1'
        je meem
        
        cmp bl,'2'
        je mou
        
        cmp bl,'3'
        je abdulhalim
        
        
        cmp bl,'4'
        je tisha 
        CALL NEWLINE
        CALL NEWLINE
          
        lea dx,N
        mov ah,9
        int 21h
          
        CALL NEWLINE
        CALL NEWLINE 

        lea dx,na
        mov ah,9
        int 21h 
         
        ;scan
        mov ah,1
        int 21h 
          
        MOV CL,AL
             
        cmp Cl,'Y'
        je EXIT
              
        JMP END
             
        CALL NEWLINE

        meem:
        call newline
        call newline
        
        lea dx,m2
        mov ah,9
        int 21h
        
        call newline
        
        lea dx,m3
        mov ah,9
        int 21h 
        
        call newline
        
        lea dx,m4
        mov ah,9
        int 21h
        
        call newline 
        call newline
        call newline
           
        jmp m 
            
               
        mou:
        call newline
        call newline
        call newline
        
        lea dx,m5
        mov ah,9
        int 21h
        
        call newline
        
        lea dx,m6
        mov ah,9
        int 21h 
        
        call newline
        
        lea dx,m4
        mov ah,9
        int 21h 
        
        call newline
        call newline
        call newline
       
        jmp m 
       
        abdulhalim:
        call newline
        call newline
        call newline
        
        lea dx,m8
        mov ah,9
        int 21h
        
        call newline
        
        lea dx,m9
        mov ah,9
        int 21h
         
        call newline
        
        lea dx,m4
        mov ah,9
        int 21h 
        
        call newline
        call newline
        call newline
       
        jmp m 
       
       
       
       
        tisha:
        call newline
        call newline
        call newline
        
        lea dx,m11
        mov ah,9
        int 21h
        
        call newline
        
        lea dx,m12
        mov ah,9
        int 21h
         
        call newline
        
        lea dx,m4
        mov ah,9
        int 21h 
        
        call newline 
        call newline
        call newline
         
        jmp m   
           
        m:  
             
        lea dx,Na
        mov ah,9
        int 21h
          
        mov ah,1
        int 21h
        mov bh,al
        
        CALL NEWLINE
        CALL NEWLINE 
      
        cmp bh,'Y'
        je exit
      
        CALL NEWLINE
        CALL NEWLINE
             
        jmp end  
             
        exit: 
        call newline   
        call newline    
        jmp FIRST 
           
           
        END:
        lea dx,T
        mov ah,9
        int 21h
           
        main endp
    
        newline proc 
            
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h
           
        ret

    end main
    
    
