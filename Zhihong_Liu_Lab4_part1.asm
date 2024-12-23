;Lab Assignment 4---Part1
;Author:Zhihong  Liu(5088806)
;03/10/2024
;Create a simple animation
INCLUDE Irvine32.inc  

.data  
smileFace BYTE 40h
space BYTE " ",0
iterationTime=80
initialColumn BYTE 0

.code
main PROC
call Clrscr ;clear the screen

mov ecx,iterationTime  ;Loop iteration time

;Initial position
mov dh,5    ;Display at row 5
mov dl,0    ;start at column 0


Version1:
call Gotoxy
mov al,smileFace   ;Print the smile face
call WriteChar
inc dl       ;Move to the next column
mov  eax,100 ;delay 
call Delay
LOOP Version1


call Crlf
call Crlf

mov ecx,iterationTime  ;Loop iteration time

Version2:
call Clrscr ;Clearing the screen will destroy all the values of DH and DL!!!
mov dh,8    ;Display at row 8
mov dl,initialColumn 
call Gotoxy
mov al,smileFace   ;Print the smile face
call WriteChar
inc initialColumn       ;Move to the next column
mov  eax,100 ;delay 1 sec
call Delay
LOOP Version2

call Clrscr

call Crlf
call Crlf

mov ecx,iterationTime  ;Loop iteration time
mov initialColumn ,0   ;Reset the initialColumn to 0

Version3:
mov dh,12    ;Display at row 12
mov dl,initialColumn 
call Gotoxy

mov al,smileFace   ;Print the smile face
call WriteChar

mov  eax,100 ;delay 1 sec
call Delay

;Go back to the original position to erase the smile face
mov dh,12    ;Display at row 12
mov dl,initialColumn 
call Gotoxy
mov edx,OFFSET space      ;Print the space to erase the former smile face
call WriteString

inc initialColumn       ;Move to the next column
LOOP Version3

call Crlf
call Crlf
call WaitMsg
exit 
main ENDP
END main