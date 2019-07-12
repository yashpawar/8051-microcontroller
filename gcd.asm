mov 00,#010h
mov 01,#00ch
mov a,00h
cjne a,01h,l1
l1:jc l2
mov 02,01
sjmp l3
l2:mov 02,00
l3:
mov a,00
mov b,02
div ab
mov a,b
cjne a,#00h,l4
mov a,01
mov b,02
div ab
mov a,b
cjne a,#00h,l4
sjmp l5
l4:djnz 02,l3
l5:nop
