.data
a:	.double 9.0, 4.5, 6.0, 2.0, 7.0, 1.0, 9.8, 5.9, 7.7, 8.2
len:	.long 10
str:	.asciz "Suma: %lf\nPromedio: %lf\n"

.text
f:
pushq %rbp
movq %rsp, %rbp

xorps %xmm1, %xmm1
cvtsi2sd %esi, %xmm1

decl %esi
xorps %xmm0, %xmm0

bucle:
cmp $0, %esi
jl fin
addsd (%rdi, %rsi, 8), %xmm0
decl %esi
jmp bucle

fin:
xorps %xmm2, %xmm2
movsd %xmm0, %xmm2
divsd %xmm1, %xmm0

movsd %xmm0, %xmm1
movsd %xmm2, %xmm0

movq $2, %rax
leaq str, %rdi
call printf

xorl %eax, %eax
leave
ret

.global main
main:
pushq %rbp
movq %rsp, %rbp

leaq a, %rdi
movl len, %esi
call f
leave
ret
