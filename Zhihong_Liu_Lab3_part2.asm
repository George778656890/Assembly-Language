;Lab Assignment 3---Part2
;Author:Zhihong  Liu(5088806)
;27/09/2024
INCLUDE Irvine32.inc  

.data  
title1 BYTE "Math Drill - Enter three values and get the following results:",0
addition_msg  BYTE "+ Addition",0
EAX_value_msg BYTE "Enter Value for EAX :",0
EBX_value_msg BYTE "Enter Value for EBX :",0
ECX_value_msg BYTE "Enter Value for ECX :",0
EAX_final_msg BYTE "EAX         = ",0
EBX_final_msg BYTE "EBX         = ",0
ECX_final_msg BYTE "ECX         = ",0
EAX_plus_EBX_plus_ECX  BYTE     "EAX+EBX+ECX = ",0
Hex_msg BYTE "Hex value = ",0
EAX_value SDWORD 0
EBX_value SDWORD 0
ECX_value SDWORD 0
sum SDWORD 0


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
call Crlf  

;Input for EAX
mov edx,OFFSET EAX_value_msg
call WriteString 
call ReadDec                 ; Read decimal input  
mov EAX_value,eax            ; save EAX value


;Input for EBX
mov edx,OFFSET EBX_value_msg
call WriteString 
call ReadDec                 ; Read decimal input  
mov EBX_value,eax            ; save EBX value

;Input for ECX
mov edx,OFFSET ECX_value_msg
call WriteString 
call ReadDec                 ; Read decimal input  
mov ECX_value,eax            ; save ECX  value
call Crlf

;Addition
mov eax,EAX_value
mov ebx,EBX_value
mov ecx,ECX_value
add eax,ebx
add eax,ecx
mov sum,eax


;Display EAX
mov edx,OFFSET EAX_final_msg
call WriteString

mov eax,EAX_value      ;display the EAX
call WriteDec


mov dh,8
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString

mov eax,EAX_value    ;display the Hexadecimal value
call WriteHex
call Crlf

;Display EBX
mov edx,OFFSET EBX_final_msg
call WriteString

mov eax,EBX_value      ;display the EBX
call WriteDec


mov dh,9
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString

mov eax,EBX_value    ;display the Hexadecimal value
call WriteHex
call Crlf

;Display ECX
mov edx,OFFSET ECX_final_msg
call WriteString

mov eax,ECX_value      ;display the ECX
call WriteDec


mov dh,10
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString

mov eax,ECX_value    ;display the Hexadecimal value
call WriteHex
call Crlf

;Display EAX+EBX+ECX
mov edx,OFFSET EAX_plus_EBX_plus_ECX 
call WriteString

mov eax,sum            ;display the sum
call WriteDec

mov dh,11
mov dl,28
call Gotoxy

mov edx,OFFSET Hex_msg
call WriteString

mov eax,sum    ;display the Hexadecimal value
call WriteHex
call Crlf
call Crlf



call WaitMsg
exit 
main ENDP
END main

