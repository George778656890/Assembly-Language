;Lab Assignment 4---Part2
;Author:Zhihong  Liu(5088806)
;03/10/2024
;Compute a Fibonacci number requested by the user
INCLUDE Irvine32.inc  

.data  
ask_message BYTE "Which Fibonacci number do you wish: ",0
answer BYTE "Fibonacci value = ",0

.code
main PROC
call Clrscr ;clear the screen
mov edx,OFFSET ask_message
call WriteString

call ReadDec
dec eax
dec eax
mov ecx,eax  ;"Userinput-2" to store in ECX used for loop control

mov eax,1   ;1st Fibonacci
mov ebx,1   ;2nd Fibonacci

FibonacciLoop :

;EDX=EAX+EBX
mov edx,eax
add edx,ebx

;EBX--->EAX
mov eax,ebx
;EDX--->EBX
mov ebx,edx ;Now the fibonacci result is in EBX
LOOP FibonacciLoop

;Print the final result 
mov edx,OFFSET answer
call WriteString

mov eax,ebx     ;Move the "final result in EBX" to EAX for printing
call WriteDec


call Crlf
call Crlf
call WaitMsg
exit 
main ENDP
END main