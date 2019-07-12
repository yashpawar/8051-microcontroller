#include <reg51.h>
void delay(int d)
{
unsigned int i;
for(;d>0;d--)
{
for(i=1000;i>0;i--);
}
}
void main(void)
{
P1=0xFF;
while(1)
p1=0xFF;
p2=P1;

delay(100);
}
}