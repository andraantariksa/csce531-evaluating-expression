#include <stdio.h>

int i;

int main()
{
	printf("int = %d\nlong = %d\nchar* = %d\n",
            (int)sizeof(int), (int)sizeof(long), (int)sizeof(char *));
	i = 0x80000000;
	printf("i = %d\n", i);
	return 0;
}
