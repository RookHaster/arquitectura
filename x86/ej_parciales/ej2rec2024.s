.data
str:	.asciz "Promiedo: %lf\n"

.text
.global main
main:
subq $8, %rsp

pushq %rbp
movq %rsp, %rbp

movq %rsi, %r12
movq %rdi, %r13

xorq %rbx, %rbx
pushq $0
incq %rbx

bucle:
cmp %rbx, %r13
jz fin
movq (%r12, %rbx, 8), %rdi
call atoi
addq %rax, -8(%rbp)
incq %rbx
jmp bucle

fin:
movq -8(%rbp), %rax
cvtsi2sd %rax, %xmm0
decq %r13
cvtsi2sd %r13, %xmm1
divsd %xmm1, %xmm0

movq $1, %rax
leaq str, %rdi
call printf

xorq %rax, %rax
addq $8, %rsp
leave

addq $8, %rsp
ret
