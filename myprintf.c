extern	void SemiHost(char* a); // use this for semihost write
#include <string.h>

void myprintf(char* text, int value) {

	int k;

    int negative = 0;
    char strnum [10];
    char digits [] = {'0','1','2','3','4','5','6','7','8','9'};
    char *ptr = &strnum[9];
    *ptr = '\0';

    if (value <0) {
        value=-value;
        negative = 1;
    }

    if (value == 0) {
        ptr--;
        *ptr='0';
    }

    while (value!=0)
    {
        ptr--;
        *ptr = digits[value % 10];
        value=value/10;
    }

    strnum = &ptr;

    if (negative) {
        ptr--;
        *ptr = '-';
    }

	for (k=0;k<strlen(text);k++) {
		SemiHost(&(text[k]));
	}

	for (k=0;k<5;k++) {
			SemiHost(&(strnum[k]));
		}

}



void myprintf2(char* text, int value) {

	int k;

    char strnum [10];
    char digits [] = {'0','1','2','3','4','5','6','7','8','9'};
    char *sptr = &strnum;

    if (value <0) {
    	*dptr++ = '-';
    }

    if (value == 0) {
        ptr--;
        *sptr='0';
    }

    while (value!=0)
    {
        ptr--;
        *ptr = digits[value % 10];
        value=value/10;
    }

    strnum = &ptr;

    if (negative) {
        ptr--;
        *ptr = '-';
    }

	for (k=0;k<strlen(text);k++) {
		SemiHost(&(text[k]));
	}

	for (k=0;k<5;k++) {
			SemiHost(&(strnum[k]));
		}

}
