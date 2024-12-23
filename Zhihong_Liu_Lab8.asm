;Lab Assignment 7
;Author:Zhihong  Liu(5088806)
;06/11/2024
;The Game---advanced version

INCLUDE Irvine32.inc 
INCLUDE Macros.inc

.data
smileFace BYTE 40h
boundCharacter BYTE 219
iterationTime=80
startPosition BYTE 39     ; start  in the middle of the console
direction BYTE 1          ; 1 for right, -1 for left
lowerBound BYTE 0
upperBound BYTE 79
currentPosition BYTE ?
paused DWORD 0            ; Paused state: 0 = playing, 1 = paused
bounceNumber DWORD 1
bounceNumberLiteral BYTE "Number of Bouncing : ",0
space BYTE " ",0

.code
main PROC


mov cl,startPosition
mov currentPosition,cl     ;Set the column number

OuterLoop:


;Print the number of bounce
mov dh,0
mov dl,0
call Gotoxy
mov edx,offset bounceNumberLiteral
call WriteString

mov eax,bounceNumber
call WriteDec
 


;Initial position
mov dh,5                       ;Display at row 5
mov dl,lowerBound
call Gotoxy

mov al,boundCharacter          ;Print the lower boundary
call WriteChar

mov dl,upperBound
call Gotoxy

mov al,boundCharacter          ;Print the upper boundary
call WriteChar


mov dl,currentPosition

;Print the smile face
call Gotoxy
mov al,smileFace          ;Print the smile face
call WriteChar

mov  eax,100 ;delay 1 sec
call Delay

;Go back to the original position to erase the smile face
mov dh,5
mov dl,currentPosition
call Gotoxy
mov edx,OFFSET space      ;Print the space to erase the former smile face
call WriteString


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
inc bounceNumber 
mov direction,-1
mov ah,currentPosition
mov upperBound,ah


;Refresh and display the new boundaries
mov dh,5                       ;Display at row 5
mov dl,upperBound
call Gotoxy

mov al,boundCharacter          ;Print the upper boundary
call WriteChar

jmp Continue

GoToRight:
inc bounceNumber 
mov direction,1
mov ah,currentPosition
mov lowerBound,ah

;Refresh and display the new boundaries
mov dh,5                       ;Display at row 5
mov dl,lowerBound
call Gotoxy

mov al,boundCharacter          ;Print the lower boundary
call WriteChar

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
jl EndProgram          ; If less than lower bound, end program

mov cl,upperBound
cmp currentPosition,cl
jg EndProgram          ; If greater than upper bound, end program


mov  eax,100 ;delay 1 sec
call Delay


SKIP:     
Jmp OuterLoop


EndProgram:
mov dh,5
mov dl,currentPosition
call Gotoxy

mov al,boundCharacter          ;Print the lower boundary
call WriteChar

call Crlf
exit 
main ENDP
END main