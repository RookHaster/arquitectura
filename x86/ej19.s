.data
str1:	.asciz "ejecutando foo1...\n"
str2:	.asciz "ejecutando foo2...\n"

str3:	.asciz "0x%x\n"
str4:	.asciz "0x%x 0x%x\n"

a:	.long 0x7fffffff
b:	.long 1

.text
foo1:
pushq %rbp
movq %rsp, %rbp

movq $str1, %rdi
xorl %eax, %eax
call printf

shll $31, b
movl a, %eax
addl b, %eax
movl %eax, a

movq $str3, %rdi
movl a, %esi
xorl %eax, %eax
call printf

movl a, %eax

movq %rbp, %rsp
popq %rbp
ret

foo2:
pushq %rbp
movq %rsp, %rbp

movq $str2, %rdi
xorl %eax, %eax
call printf

movl a, %eax
addl b, %eax
movl %eax, a

movq $str3, %rdi
movl a, %esi
xorl %eax, %eax
call printf

movl a, %eax

movq %rbp, %rsp
popq %rbp
ret

.global main
main:
pushq %rbp
movq %rsp, %rbp

call foo2
pushq %rax

call foo1
pushq %rax

movq $str4, %rdi
movq -8(%rbp), %rsi
movq -16(%rbp), %rdx
xorl %eax, %eax
call printf

xorl %eax, %eax
leave
ret
