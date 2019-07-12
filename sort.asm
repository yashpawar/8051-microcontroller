mov 30h,#06h
mov 31h,#0ah
mov 32h,#01h
mov 33h,#08h
mov 34h,#03h
mov r0,#30h
mov r1,#31h
mov 02h,#05h
dec 02h
l2:
mov 03h,02h
mov r0,#30h
mov r1,#31h
l3:
mov a,@r0
clr c
subb a,@r1
jc l1
mov a,@r0
xch a,@r1
mov @r0,a
l1:inc r0
inc r1
djnz 03,l3
djnz 02,l2