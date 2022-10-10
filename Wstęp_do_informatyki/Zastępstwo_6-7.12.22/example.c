#include <stdio.h>
#define pi 3.14
#define ILOCZYN(x,y) (x)+(y)

double f(int a)
{
		printf("a:%d",a);
		return 3.;
}

int main()
{
		int a = 1;
		int rr[4] = {1,2,3,4};
		char string[] = "test";
		int b = 1;
		float t = pi;
		char e = "A";
		const unsigned short int c = 3;
		scanf("%d", &c);
		printf("Witam %d\n", c);
		printf("iloczyn 2*4 = %i",ILOCZYN(2,4));
		printf("f:%f",f(4));
		printf("instrukcje IF\n");
		if (c < 10 || c > 2)
		{
				printf("c<0\n");
		}
		else if (c > 15)
		{
				printf("c>0\n");
		}
		else
		{
				printf("c==0\n");
		}

		for (int i=0; i<10;i++)
		{
				printf("i=%d",i);
		}

		int r = 0;
		while (r<10)
		{
				r++;
				printf("\nr=%d",r);
		}
		printf("rr[1]=%d",rr[1]);
		printf("string=%s",string);

		return 0;
}


