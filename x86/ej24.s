.data
arr1:	.float 1.0, 2.0, 3.5, 1.5, 2.0
arr2:	.float 2.0, 2.8, 4.7, 6.7, 9.3
len:	.long 5
.text
f:
pushq %rbp
movq %rsp, %rbp

decl %edx

bucle:
cmp $0, %edx
jl fin
movss (%rdi, %rdx, 4), %xmm0
movss (%rsi, %rdx, 4), %xmm1
addss %xmm1, %xmm0
movss %xmm0, (%rdi, %rdx, 4)

decl %edx
jmp bucle

fin:
xorl %eax, %eax
leave
ret

.global main
main:

pushq %rbp
movq %rsp, %rbp

leaq arr1, %rdi
leaq arr2, %rsi
movl len, %edx
call f

xorl %eax, %eax
leave
ret
