mov 00,#5h
mov 01,#7h
mov 02,00
mov 03,01
l4:mov a,02
cjne a,03,l1
sjmp l5
l1:
jc l2
mov a,03
add a,01
mov 03,a
sjmp l3
l2:mov a,02
add a,00
mov 02,a
l3:sjmp l4
l5:nop
end