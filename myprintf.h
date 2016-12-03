extern	void SemiHost(char* a); // use this for semihost write

// myprintf is a much simplied printf for embedded for use with semihosting
// It is limited to printing a text message and then an integer over the semihost channel

void myprintf(char* text, int value) {

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

    if (negative) {
        ptr--;
        *ptr = '-';
    }

    // First print the text message
    while (*text != '\0')
    {
    	SemiHost(text);
    	text++;
    }

    // Now print the integer
    while (*ptr != '\0')
    {
    	SemiHost(ptr);
    	ptr++;
    }

    SemiHost("\n");

}



