#include <stdio.h>
int main()
{
	for (int i = 0; i < 11000; ++i)
		printf("%d %d", i, i^131);
}
