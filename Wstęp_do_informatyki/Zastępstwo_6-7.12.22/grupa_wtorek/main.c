#include <stdio.h>
#include "func.h"


int main()
{
		int a = 1;
		int b = 1; // kompilator rzuci warning o nieużywanej zmiennej
		printf("a= %d\n", a); //wypisuje a na ekranie, %d-int, %c-char, %f-double
		f(99); //definicja funkcji w func.c
		return 0;
}


