ORG 00H
MOV DPTR,#LUT // moves starting address of LUT to DPTR
MOV A,#11111111B // loads A with all 1's
MOV P0,#00000000B // initializes P0 as output port

BACK:MOV P1,#11111111B // loads P1 with all 1's
     CLR P1.0  // makes row 1 low
     JB P1.4,NEXT1  // checks whether column 1 is low and jumps to NEXT1 if not low
     MOV A,#0D   // loads a with 0D if column is low (that means key 1 is pressed)
     ACALL DISPLAY  // calls DISPLAY subroutine
NEXT1:JB P1.5,NEXT2 // checks whether column 2 is low and so on...
      MOV A,#1D
      ACALL DISPLAY
NEXT2:JB P1.6,NEXT3
      MOV A,#2D
      ACALL DISPLAY
NEXT3:JB P1.7,NEXT4
      MOV A,#3D
      ACALL DISPLAY
NEXT4:SETB P1.0
      CLR P1.1
      JB P1.4,NEXT5
      MOV A,#4D
      ACALL DISPLAY
NEXT5:JB P1.5,NEXT6
      MOV A,#5D
      ACALL DISPLAY
NEXT6:JB P1.6,NEXT7
      MOV A,#6D
      ACALL DISPLAY
NEXT7:JB P1.7,NEXT8
      MOV A,#7D
      ACALL DISPLAY
NEXT8:SETB P1.1
      CLR P1.2
      JB P1.4,NEXT9
      MOV A,#8D
      ACALL DISPLAY
NEXT9:JB P1.5,NEXT10
      MOV A,#9D
      ACALL DISPLAY
NEXT10:JB P1.6,NEXT11
       MOV A,#10D
       ACALL DISPLAY
NEXT11:JB P1.7,NEXT12
       MOV A,#11D
       ACALL DISPLAY
NEXT12:SETB P1.2
       CLR P1.3
       JB P1.4,NEXT13
       MOV A,#12D
       ACALL DISPLAY
NEXT13:JB P1.5,NEXT14
       MOV A,#13D
       ACALL DISPLAY
NEXT14:JB P1.6,NEXT15
       MOV A,#14D
       ACALL DISPLAY
NEXT15:JB P1.7,BACK
       MOV A,#15D
       ACALL DISPLAY
       LJMP BACK

DISPLAY:MOVC A,@A+DPTR // gets digit drive pattern for the current key from LUT
        MOV P0,A       // puts corresponding digit drive pattern into P0
        RET

LUT: DB 01100000B // Look up table starts here
     DB 11011010B
     DB 11110010B
     DB 11101110B
     DB 01100110B
     DB 10110110B
     DB 10111110B
     DB 00111110B
     DB 11100000B
     DB 11111110B
     DB 11110110B
     DB 10011100B
     DB 10011110B
     DB 11111100B
     DB 10001110B
     DB 01111010B
     END