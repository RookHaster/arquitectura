.data

.text
calculo:
pushq %rbp
movq %rsp, %rbp

xorq %rbx, %rbx

movb %dil, %bl
addb %dl, %bl
addb %cl, %bl

movl 16(%rbp), %eax
addl 24(%rbp), %eax

imulq %rbx

movq %rbp, %rsp
popq %rbp
ret

.global main
main:

# .rdi rsi .rdx .rcx r8 r9

pushq %rbp
movq %rsp, %rbp

pushq $8
pushq $7

movl $1, %edi
movl $2, %esi
movl $3, %edx
movl $4, %ecx
xorq %rax, %rax
call calculo

movq %rbp, %rsp
popq %rbp

ret
