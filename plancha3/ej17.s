.data
format:	.asciz "%ld\n"
i:	.quad 0xDEADBEEF
temp1:	.asciz "a) %ld\nb) %ld\nc) %p\nd) %ld\n"
temp2:	.asciz "e) %ld\nf) %ld\ng) %p\n"

.text
.global main
main:
subq $8, %rsp

movq $format, %rdi
movq $1234, %rsi
xorl %eax, %eax
call printf

movq $temp1, %rdi
movq %rsp, %rsi
movq $format, %rdx
movq $format, %rcx
movq (%rsp), %r8
xorl %eax, %eax
call printf

movq $temp2, %rdi
movq 8(%rsp), %rsi
movq i, %rdx
movq $i, %rcx
call printf

addq $8, %rsp
ret
