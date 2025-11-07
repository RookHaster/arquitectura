.data
str1:	.asciz "cantidad de argumentos: %d\nsuma de argumentos: %d\n"
str2:	.asciz "cantidad de argumentos insuficientes\n"

.text
.global main
main:
subq $8, %rsp

push %rbp
movq %rsp, %rbp

pushq %rdi
pushq %rsi
pushq $0

cmp $1, %rdi
jz insuf

movq $1, %r12

for:
movq -16(%rbp), %rdi
movq (%rdi, %r12, 8), %rdi
call atoi
addq %rax, -24(%rbp)
incq %r12
cmp -8(%rbp), %r12
jnz for

movq $str1, %rdi
movq -8(%rbp), %rsi
decq  %rsi
movq -24(%rbp), %rdx
xorl %eax, %eax
call printf

movq %rbp, %rsp
popq %rbp

addq $8, %rsp

ret

insuf:
movq $str2, %rdi
xorl %eax, %eax
call printf

movq %rbp, %rsp
popq %rbp

addq $8, %rsp

ret
