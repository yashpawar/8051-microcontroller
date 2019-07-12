
lcd_init:
mov a,#0ch
acall cmd_write
acall clrscr
acall inc_cursor
acall line1
mov a,#3ch
acall cmd_write
ret

lcd_out:
clr a
movc a,@a+dptr
jz exit
inc dptr
acall data_write
exit:ret

line2:
mov a,#0c0h
acall cmd_write
ret

line1:
mov a,#80h
acall cmd_write
ret

clrscr:
mov a,#01h
acall cmd_write
ret

inc_cursor:
mov a,#06h
acall cmd_write
ret

dec_cursor:
mov a,#04h
acall cmd_write
ret

cmd_write:
mov p0,a
clr rs
clr rw
setb e
clr e
acall delay
ret

data_write:
mov p0,a
setb rs
clr rw
setb e
clr e
acall delay
ret
