.data
b:	.double 2.3
str:	.asciz "El valor escalado es %lf\n"

.text
.global main
main:
subq $8, %rsp
pushq %rbp
movq %rsp, %rbp
subq $8, %rsp

movq 8(%rsi), %rdi
call atoi
movq %rax, -8(%rbp)

movq -8(%rbp), %rdi
movsd b, %xmm0
call scale

xorq %rax, %rax
leave
addq $8, %rsp
ret

scale:
pushq %rbp
movq %rsp, %rbp

subq $16, %rsp
movq $8, -8(%rbp) #8

cvtsi2sd %rdi, %xmm1
mulsd %xmm1, %xmm0
cvtsi2sd -8(%rbp), %xmm1
addsd %xmm1, %xmm0

movsd %xmm0, -16(%rbp)

movq $1, %rax
leaq str, %rdi
call printf

movsd -16(%rbp), %xmm0
addq $16, %rsp
leave
ret
