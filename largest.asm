mov 30h,#2h
mov 31h,#1h
mov 32h,#4h
mov 33h,#5h
mov 34h,#3h
mov r0,#30h
mov r1,#04h
mov 03h,@r0
l1:inc r0
mov a,@r0
cjne a,03h,l2
l2:jc l3
mov 03h,a
l3:djnz r1,l1
end