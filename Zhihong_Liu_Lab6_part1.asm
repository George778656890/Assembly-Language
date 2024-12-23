;Lab Assignment 6---Part1
;Author:Zhihong  Liu(5088806)
;31/10/2024
;Shift an array to the right side by user specified position using the index method
;The core : manipulate from the right side of the array

INCLUDE Irvine32.inc 

.data
sorted BYTE 2,5,9,11,23,41,57,68,71,82,85
title1 BYTE "The array is as follows : ",0
arrayLiteral BYTE "array",0
locationLiteral BYTE "location ",0
equalLiteral BYTE " = ",0
askLiteral BYTE "Which location do you wish to change : ",0
userDesiredLocation DWORD ?

.code

display PROC
;Goal:  Print the content of an array using index method
;Parameters: the input should be sorted array
;Post-Conditions: The content of each index of array will be printed line by line
;Pre-Conditions:the element of the array must be number
mov edx,offset title1
call WriteString
call Crlf
call Crlf

mov edx,offset arrayLiteral
call WriteString
call Crlf


mov ebx,0                 ; Used as the location number
mov esi,0                 ; Index for array access
mov ecx,LENGTHOF sorted   ; Loop iteration numbers
L1:
mov edx,offset locationLiteral
call WriteString          ; Print "Location"

mov eax,ebx
call WriteDec             ; Print the location number
inc ebx                   ; Increment the location number for next use

mov edx,offset equalLiteral
call WriteString          ; Print the "="

movzx eax,sorted[esi]
call WriteDec             ; Print the content of the array
add esi,TYPE sorted       ; Move to the next index of the array
call Crlf
LOOP L1

ret
display ENDP

;*****************************************************************************************
shiftArrayRoutine PROC
;Goal: Shift an array based on the user-specified position
;Parameters: the input should be sorted array
;Post-Conditions: The user-specified position of array will be filled with 0,and the remaining will be shifed to the right
;Pre-Conditions: the array couldn't be empty

;ECX=arrayLength-userDesiredLocation-1
mov ebx,LENGTHOF sorted
sub ebx,userDesiredLocation
sub ebx,1
mov ecx,ebx    ;Loop iteration number

;Calculate the sub-right-most index address
mov ebx,LENGTHOF sorted
sub ebx,2
mov esi,ebx  ;Now the ESI holds the sub-right-most index address

L2:
push esi
add esi,1
mov edi,esi ;EDI is on the right side of ESI
pop esi 

mov eax,DWORD PTR sorted[esi]  ;Shift routine
mov sorted[edi],al

sub esi,TYPE sorted  ;Move to the left position

LOOP L2

mov esi,userDesiredLocation  ;Fill the user-specified position with 0
mov sorted[esi],0

ret
shiftArrayRoutine ENDP

;*****************************************************************************************

main PROC
call display               ;Display the array content
call Crlf
call Crlf

mov edx,offset askLiteral
call WriteString          ; Ask user that which location  to change

call ReadDec
mov userDesiredLocation,eax ; Save the userDesiredLocation
call Crlf
call Crlf

call shiftArrayRoutine    ;Shift the array based on the user-specified position

call display              ;Display the array content

call Crlf
call WaitMsg
exit 
main ENDP


END main