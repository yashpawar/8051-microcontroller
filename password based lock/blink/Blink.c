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
P1=0x00;
while(1)
{
P1=0x01;
delay(1000);
P1=0x00;
delay(1000);
}
}