.data
cadenalarga:	.asciz "123456"
cadenacorta:	.asciz "123"

str:		.asciz "%d\n"

.text
.global main
main:
pushq %rbp
movq %rsp, %rbp

movq $cadenalarga, %rdi
movq $cadenacorta, %rsi
movl $3, %edx
call compara

movl %eax, %esi
movq $str, %rdi
xorl %eax, %eax
call printf

leave
ret

.global compara
compara:
pushq %rbp
movq %rsp, %rbp

xorq %r12, %r12
aux:
cmp %r12, %rdx
jle fin
movb (%rdi, %r12, 1), %r8b
movb (%rsi, %r12, 1), %r9b
cmp %r8b, %r9b
jnz break
incq %r12
jmp aux

fin:
movq $1, %rax
leave
ret

break:
xorq %rax, %rax
leave
ret
