INCLUDE 'emu8086.inc'
org 100h
; clear the screen
mov ax,0600h ;scroll the screen
mov bh,07 ;normal attribute
mov cx,0000 ;from row=00,column=00
mov dx,184fh ;to row=18h, column=4fh
int 10h ;invoke the interrupt to clear screen
mov ah,00 ;set mode
mov al,13h ;mode=13(CGA High resolution)
int 10h ;invoke the interrupt to change 
 

PRINT 'Introduceti-va numele: '
CALL get_string
PUTC 13
PUTC 10
PRINT 'Salut, '
MOV AX, CX
CALL print_string
PRINTN '. Acum iti voi desena '
PRINTN 'o casuta si un brad.'

DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_GET_STRING


; start house draw

; top horizontal line
mov cx,130  ; start: column:130
mov dx,75   ; row=75
hseT: 
    mov ah,0ch  ; ah=0ch to draw a line
    mov al,09h  ; colo:=blue
    int 10h     ; invoke the interrupt to draw the
    inc cx      ; increment the horizontal position
    cmp cx,216  ; draw line until column=216
    jnz hseT
; bottom horizontal line
mov cx,130
mov dx,125
hseB: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,216
    jnz hseB
; left vertical line
mov cx,130
mov dx,75
hseL: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,125
    jnz hseL
; right vertical line
mov cx,216
mov dx,75
hseR: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,126
    jnz hseR
; left roof line
mov cx,130
mov dx,75
hseLR: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    dec dx
    cmp cx,173
    cmp dx,32
    jnz hseLR
; right roof line
mov cx,173
mov dx,32
hseRR: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    inc dx
    cmp cx,216
    cmp dx,75
    jnz hseRR    
    
    ; finished house outside
    ;__________________________________________________
 
    ; draw the door
    ; left door line
mov cx,164
mov dx,125
hseLD: 
    mov ah,0ch
    mov al,09h
    int 10h
    dec dx
    cmp dx,100
    jnz hseLD ; right door line
mov cx,182
mov dx,125
hseRD: 
    mov ah,0ch
    mov al,09h
    int 10h
    dec dx
    cmp dx,100
    jnz hseRD ; top door line
mov cx,164
mov dx,100
hseTD: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,183
    jnz hseTD
    ;door finished
    ;______________________________________________________
    
    ; draw two windows 3x3 matrix

; left window vertical line1
mov cx,136
mov dx,85
hseLWV1: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,105
    jnz hseLWV1
; left window vertical line2
mov cx,146
mov dx,85
hseLWV2: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,105
    jnz hseLWV2
;left window vertical line3
mov cx,156
mov dx,85
hseLWV3:
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,105
    jnz hseLWV3
; right window vertical line1
mov cx,190
mov dx,85
hseRWV1: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,105
    jnz hseRWV1
; right window vertical line2
mov cx,200
mov dx,85
hseRWV2: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,105
    jnz hseRWV2
; left window vertical line3
mov cx,210
mov dx,85
hseRWV3: 
    mov ah,0ch
    mov al,09h
    int 10h
    inc dx
    cmp dx,105
    jnz hseRWV3
; window horizontal line1
mov cx,136
mov dx,85
hseWH1:     ;left
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,156
    jnz hseWH1
mov cx,190  ;this line continues for the second
            ;window at column=190
mov dx,85 

hseWH1b:    ;right
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,210
    jnz hseWH1b 
; window horizontal line2
mov cx,136
mov dx,95
hseWH2:     ;left
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,156
    jnz hseWH2
mov cx,190
mov dx,95
hseWH2b:    ;right 
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,210
    jnz hseWH2b
; window horizontal line3
mov cx,136
mov dx,105
hseWH3:     ;left 
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,157
    jnz hseWH3
mov cx,190
mov dx,105
hseWH3b:    ;right 
    mov ah,0ch
    mov al,09h
    int 10h
    inc cx
    cmp cx,211
    jnz hseWH3b
    
    ; windows finished
    ; house is finished
    ;______________________________________________

    ; draw tree

; lower tree trunk
mov cx, 40 
mov dx, 135
treLTT:
    mov ah, 0ch
    mov al,06h
    int 10h
    inc cx
    cmp cx, 86
    jnz treLTT
; left trunk base
mov cx,40
mov dx,135
treLTB: 
    mov ah,0ch
    mov al,06h ; color:brown
    int 10h
    inc cx
    dec dx
    cmp cx,55
    cmp dx,120
    jnz treLTB
; right trunk base 
mov cx,86
mov dx,135
treRTB: 
    mov ah,0ch
    mov al,06h
    int 10h
    dec cx
    dec dx
    cmp cx,71
    cmp dx,120
    jnz treRTB
; left trunk vert 
mov cx,55
mov dx,120
treLTV: 
    mov ah,0ch
    mov al,06h
    int 10h
    dec dx
    cmp dx,80
    jnz treLTV
; right trunk vert 
mov cx,71
mov dx,120
treRTV: 
    mov ah,0ch
    mov al,06h
    int 10h
    dec dx
    cmp dx,80
    jnz treRTV
; here begins the real hassle
mov dx,80
mov bx,101

DrwTree:    ;draws a green pine tree with a 3
            ;nested jump commands
mov cx,126
sub cx,bx ;keeps green part of tree symmetrical

GrTree: 
    mov ah,0ch
    mov al,02h ;pixels=green
    int 10h
    inc cx
    cmp cx,bx
    jnz GrTree
    cmp bx,65 ;when bx reaches a
    jle break ;loop exits

sub dx,3 ;moves green line up
sub bx,2 ;makes tree narrow on each pass
            ;too low value: out of memory/space to draw
            ;too big value: too little green :(

jmp DrwTree

break:
   ;tree finished
   ;________________________________________________