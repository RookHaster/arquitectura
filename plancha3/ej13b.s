.data
x:	.long 10
str:	.asciz "INGRESADO: %d\nFACTORIAL: %d\n"

.text
fact:
pushq %rbp
movq %rsp, %rbp
movq %rdi, %rcx
movq $1, %rax

fact1:
imul %rcx
loop fact1
xorq %rdx, %rdx

movq %rbp, %rsp
popq %rbp
ret

.global main
main:
pushq %rbp

movl x, %edi
call fact
movl x, %esi
movq $str, %rdi
movl %eax, %edx
xorq %rax, %rax
call printf

popq %rbp
ret
