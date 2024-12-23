;Lab Assignment 8
;Author:Zhihong  Liu(5088806)
;18/11/2024

INCLUDE Irvine32.inc 
INCLUDE Macros.inc

.data
smileFace BYTE 40h
iterationTime=80
startPosition BYTE 39     ; start  in the middle of the console
direction BYTE 1          ; 1 for right, -1 for left
lowerBound BYTE 0
upperBound BYTE 79
currentPosition BYTE ?
paused DWORD 0            ; Paused state: 0 = playing, 1 = paused

.code
main PROC
mov cl,startPosition
mov currentPosition,cl     ;Set the column number

OuterLoop:


;Initial position
mov dh,5                   ;Display at row 5
mov dl,currentPosition

;Print the smile face
call Gotoxy
mov al,smileFace          ;Print the smile face
call WriteChar

mov  eax,50               ; sleep, to allow OS to time slice
call Delay                ; (otherwise, some key presses are lost)

call ReadKey              ; look for keyboard input

; Check if key is 'A' or 'L' 
cmp dx, 0041h    ;A
je GoToRight
cmp dx, 004Ch    ;L
je GoToLeft  
cmp dx,0020h         ; Space   
je togglePause

jmp Continue

GoToLeft:
mov direction,-1
jmp Continue

GoToRight:
mov direction,1
jmp Continue

togglePause:
xor paused, 1            ; Toggle paused state 


Continue:

;Check whether the program should pause or resume
mov ecx,paused
cmp ecx,0
Jnz SKIP

mov bl,currentPosition  ;Update the position
add bl,direction
mov currentPosition,bl

; Check boundaries
mov cl,lowerBound
cmp currentPosition,cl
jl EndProgram          ; If less than 0, end program
mov cl,upperBound
cmp currentPosition,cl
jg EndProgram          ; If greater than 79, end program

mov  eax,100 ;delay 1 sec
call Delay

call Clrscr

SKIP:     
Jmp OuterLoop



EndProgram:
call Crlf
call WaitMsg
exit 
main ENDP
END main