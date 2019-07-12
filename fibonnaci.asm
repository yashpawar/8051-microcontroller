mov 30h,#1h
mov 31h,#1h
mov r0,#32h
mov r1,#08h
mov 02,#01h
mov 03,#01h
l1:mov a,03h
add a,02h
mov 02,03
mov 03,a
mov @r0,03
inc r0
djnz r1,l1
end
