#include "../Foundation/myprintf.h"

int main()
{
	int variable = 1;

	myprintf("Semihost my driver ",314159);

	while(1) {
	myprintf("Other variable ",variable);
	variable++;
	}

}
