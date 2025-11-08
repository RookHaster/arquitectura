int fuerza_bruta(const char *S, const char *s, unsigned lS, unsigned ls){
	unsigned i, j;
	for (i=0; i < lS-ls+1; i++){
		if (S[i] == s[0]){
			for (j = 0; j<ls && S[i+j] == s[j]; j++);
			if (j == ls){
				return i;
			}
		}
	}
	return -1;
}
