;Lab Assignment 5---Part1
;Author:Zhihong  Liu(5088806)
;16/10/2024
;Compute  Fibonacci numbers and store them in an array using index method 
INCLUDE Irvine32.inc  

.data
title1 BYTE "The Fibonacci sequence for the first 40 members is as follows: ",0
fibonacci_msg BYTE "Fibonacci number ",0
equal BYTE "=",0
lineNumber DWORD 0
count=41
array DWORD count DUP(0)   ;array for storing the Fibonacci numbers

.code
main PROC
mov edx,offset title1
call WriteString
call Crlf
call Crlf


mov esi,0          ;Initialize the register
mov array[esi],0   ;Store the 0th Fibonacci number into the array
add esi,TYPE array
mov array[esi],1   ;Store the 1st Fibonacci number into the array
add esi,TYPE array
mov array[esi],1   ;Store the 2nd Fibonacci number into the array
add esi,TYPE array ;Move to the next position


mov ecx,38         ;3~40=>  40-3+1=38

mov eax,1   ;1st Fibonacci
mov ebx,1   ;2nd Fibonacci

FibonacciLoop :   ;Calculate the Fibonacci Number from 3rd to 40th

;EDX=EAX+EBX
mov edx,eax
add edx,ebx

;EBX--->EAX
mov eax,ebx
;EDX--->EBX
mov ebx,edx ;Now the fibonacci result is in EBX

mov array[esi],ebx  ;Store the Fibonacci number to the array
add esi,TYPE array  ;Move to the next index

LOOP FibonacciLoop 

mov ecx,count     ;Printing loop counter  
mov esi,0         ;Rest to zero

Printing:
mov edx,offset fibonacci_msg
call WriteString

mov eax,lineNumber
call WriteDec      ;Print the line number
inc lineNumber

mov edx,offset equal
call WriteString   ;Print  =

mov eax,array[esi]
call WriteDec      ;Print the corresponding Fibonacci number

add esi,TYPE array ;Move to the next position

call Crlf

LOOP Printing



call Crlf
call WaitMsg
exit 
main ENDP
END main
