org 0000h
up1:mov r5,#0ah
mov dptr,#1000h
up:clr a
movc a,@a+dptr
mov p1,a
acall delay
inc dptr
djnz r5,up
sjmp up1
delay:mov r0,#0ffh
here1:mov r1,#0ffh
here:djnz r1,here
djnz r0,here1
ret
org 1000h
db 0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x98
end