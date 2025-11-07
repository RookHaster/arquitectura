#include <stdio.h>

unsigned long fact1(unsigned long x){
	if(x<=1){
		return x;
	}
	return x * fact1(x-1);
}

int main(void){
	unsigned long x;
	scanf("%lu", &x);
	printf("fact: %lu\n", fact1(x));
	return 0;
}
