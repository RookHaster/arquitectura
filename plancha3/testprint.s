.data
str:	.asciz "ALINEADO\n"

.text
.global main
main:
subq $8, %rsp

movq $str, %rdi
xorl %eax, %eax
call printf

addq $8, %rsp

xorl %eax, %eax
ret
