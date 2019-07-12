keyport equ p2
lcdport equ p0
rs equ p0.0
rw equ p0.1
e equ p0.2
un equ 40h
ln equ 41h
;output equ p2.3
;registers r0,r2,r3,r4,r5,r6 are used





org 0000h
;intialize lcd
mov tmod,#01h
acall lcd_init
start:
;setb output
acall clrscr
acall line1
mov dptr,#text1
acall lcd_out
lcall line2
lcall askpass
acall checkpassword
mov r6,#46h
lcall delay1
sjmp start


;checking password
checkpassword:
mov r0,#30h
mov r5,#04h
mov dptr,#pass
checknxt:
clr a
movc a,@a+dptr
clr c
subb a,@r0
jnz pre
inc r0
inc dptr
djnz r5,checknxt
;call subroutine that displays password accepted
acall pa
ret
pre:;call subroutine that displays password rejected
acall pr
ret

lcd_init:
mov a,#20h;
acall cmd_write
mov a,#28h;
acall cmd_write
mov a,#0Ch;
acall cmd_write
acall clrscr
mov a,#06h;
acall cmd_write
acall line1
ret

lcd_out:
clr a
movc a,@a+dptr
jz exit
inc dptr
acall data_write
sjmp lcd_out
exit:ret

line2:
mov a,#0c0h;force cursor to second line
acall cmd_write
ret

line1:
mov a,#80h;force cursor to first line
acall cmd_write
ret

clrscr:
mov a,#01h;clear display
acall cmd_write
ret

cmd_write:
acall sep
clr rs
clr rw
mov a,un
acall move
setb e
acall delay
clr e
acall delay
mov a,ln
acall move
setb e
acall delay
clr e
acall delay
ret

data_write:
acall sep
setb rs
clr rw
mov a,un
acall move
setb e
acall delay
clr e
acall delay
mov a,ln
acall move
setb e
acall delay
clr e
acall delay
ret
sep:
MOV un,A        
ANL un,#0F0H 
SWAP A
ANL A,#0F0H   
MOV ln,A        
RET            

move:
anl lcdport,#0Fh
orl lcdport,A
ret
   
delay:
mov th0,#0edh
mov tl0,#00h
setb tr0
jnb tf0,$
clr tr0
clr tf0
ret

delay1:
mov th0,#00h
mov tl0,#00h
setb tr0
jnb tf0,$
clr tr0
clr tf0
djnz r6,delay1
ret

pa:
;clr output
acall clrscr
acall line1
mov dptr,#text2
acall lcd_out
ret

pr:
acall clrscr
acall line1
mov dptr,#text3
acall lcd_out
ret

askpass:
mov r0,#30h;store passwords from location 30h onwards
mov r5,#04h;length of password

detectpress:;wait until keypress is detected
mov keyport,#0f0h;set all columns as input and all rows as 0
mov a,keyport
cjne a,#0f0h,pressconf
sjmp detectpress
pressconf:
mov r2,#0feh;check row(enter 0 in one row) first row is checked first
mov r3,#04h;no of rows

nextrow:
mov r4,#04h;no of columns
mov keyport,r2;check each row
mov a,keyport

nextcol:;check each column for each row
setb c
rlc a
jnc keyfound;check for 0 in all columns
djnz r4,nextcol

;rotate 0 in r2 to check next row
mov a,r2
rl a
mov r2,a

djnz r3,nextrow
keyfound:
acall keyidentify;key identified and hex value stored in A
mov @r0,a;store pressed key
inc r0

;lcd
mov a,#'*'
lcall data_write

;button press delay
mov r6,#07h
lcall delay1



djnz r5,detectpress;check next key
ret

keyidentify:
mov a,#04h
clr c
subb a,r3
mov b,#04h
mul ab
add a,r4
dec a
mov dptr,#keypad
movc a,@a+dptr
ret


pass:db 1h,2h,3h,4h

text1: db 'Password',0
text2: db 'Correct!',0
text3: db 'Error X',0
keypad:db 01h,02h,03h,0ah,04h,05h,06h,0bh,07h,08h,09h,0ch,0eh,00h,0fh,0dh

end
