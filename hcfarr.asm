mov 30h,#010h
mov 31h,#00ch
mov 32h,#014h
mov 33h,#020h
mov 34h,#034h


mov r0,#30h
mov r1,#04h
mov 02h,@r0
l6:inc r0
mov a,@r0
cjne a,02h,l1
l1:jnc l2
mov 02h,@r0
l2:djnz r1,l6


l3:
mov r0,#30h
mov r1,#05h
l7:
mov a,@r0
mov b,02h
div ab
mov a,b
inc r0
cjne a,#00h,l4
djnz r1,l7
sjmp l5
l4:djnz 02h,l3
l5:nop
end