#include <stdio.h>
#include <string.h>

int fuerza_bruta(const char *S, const char *s, unsigned lS, unsigned ls);

int main(void){
	char* strlong = "josejuanvillalagos";
	char* strshort = "villa";
	int i = fuerza_bruta(strlong, strshort, 18, 5);
	if (i == -1){
		printf("NO\n");
		return 0;
	}
	printf("%s\n", strshort);
	return 0;
}
