.data
str:	.asciz "SUMA DE CUADRADOS: %d\n"

.text
.global main
main:
pushq %rbp
movq %rsp, %rbp

movq %rdi, %r12		# cantidad arg
movq %rsi, %rbx		# base del arreglo
xorq %r13, %r13		# contador suma
movq $1, %r14		# indice

bucle:
cmp %r12, %r14
jge fin
movq (%rbx,%r14,8), %rdi		# paso argv[i] al rdi, que es el primer arg
call atoi
imulq %rax
addq %rax, %r13
addq $1, %r14
jmp bucle

fin:
movq %r13, %rsi
movq $str, %rdi
xorl %eax, %eax
call printf

movq %rbp, %rsp
popq %rbp
xorl %eax, %eax
ret
