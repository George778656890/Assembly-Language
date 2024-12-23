;Lab Assignment 3---Part1
;Author:Zhihong  Liu(5088806)
;26/09/2024
INCLUDE Irvine32.inc  

.data  
title1 BYTE "Math Drill - Enter two values and get the following results:",0
addition_msg  BYTE "+ Addition",0
subtraction_msg BYTE "- Subtraction",0
X_value_msg BYTE "Enter Value for X :",0
Y_value_msg BYTE "Enter Value for Y :",0
X_final_msg BYTE "X     =   ",0
Y_final_msg BYTE "Y     =   ",0
X_Plus_Y  BYTE   "X + Y =   ",0
X_minus_Y BYTE   "X - Y =   ",0
NegativeSign BYTE "-",0
Hex_msg BYTE "Hex value = ",0
x_value SDWORD 0
y_value SDWORD 0
sum SDWORD 0
difference SDWORD 0

.code
main PROC
call Clrscr 

mov edx,OFFSET title1
call WriteString               
call Crlf 
call Crlf                 

mov edx,OFFSET addition_msg
call WriteString               
call Crlf 

mov edx,OFFSET subtraction_msg
call WriteString               
call Crlf 
call Crlf

mov edx,OFFSET X_value_msg
call WriteString 
call ReadDec                 ; Read decimal input  
mov x_value, eax             ; Store input in x_value

mov edx,OFFSET Y_value_msg
call WriteString 
call ReadDec                 ; Read decimal input  
mov y_value, eax             ; Store input in y_value
call Crlf

mov eax,x_value     ;Addition
add eax,y_value
mov sum,eax

mov eax,x_value     ;Subtraction
sub eax,y_value
mov difference,eax



;Display X
mov edx,OFFSET X_final_msg
call WriteString

mov eax,x_value        ;display the x
call WriteDec


mov dh,8
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString

mov eax,x_value    ;display the Hexadecimal value
call WriteHex
call Crlf

;Display Y
mov edx,OFFSET Y_final_msg
call WriteString

mov eax,y_value        ;display the y
call WriteDec


mov dh,9
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString

mov eax,y_value    ;display the Hexadecimal value
call WriteHex
call Crlf

;Display X+Y
mov edx,OFFSET X_Plus_Y 
call WriteString

mov eax,sum            ;display the sum
call WriteDec



mov dh,10
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString

mov eax,sum    ;display the Hexadecimal value
call WriteHex
call Crlf

;Display X-Y
mov edx,OFFSET X_minus_Y 
call WriteString

mov eax,difference            ;display the difference

;Check whether the number is negative
test eax, eax                 ; Check if EAX is zero  
jns positive            ; If not negative (positive or zero), jump to output number

;Condition that number is negative
mov edx,OFFSET NegativeSign   ;display the negative sign
call WriteString
neg eax          ;convert the negative number to the absolute value
call WriteDec

mov dh,11
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString
mov edx,OFFSET NegativeSign   ;display the negative sign
call WriteString
call WriteHex

call Crlf
call WaitMsg
exit 

;Condition that number is positive
positive :
call WriteDec

mov dh,11
mov dl,28
call Gotoxy


mov edx,OFFSET Hex_msg
call WriteString

mov eax,difference    ;display the Hexadecimal value
call WriteHex
call Crlf


call WaitMsg
exit 
main ENDP
END main

