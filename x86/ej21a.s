.data
cadena:	.asciz "123456"
str:	.asciz "0x%x\n"

.text

.global main
main:
pushq %rbp
movq %rsp, %rbp

movq $cadena, %rdi
movb $'6', %sil
call busca

movq $str, %rdi
movq %rax, %rsi
xorl %eax, %eax
call printf

leave
ret

.global busca
busca:
pushq %rbp
movq %rsp, %rbp

movl $0, %ecx

aux:
movb (%rdi, %rcx, 1), %al
cmp $'\0', %al
jz finneg
cmp %sil, %al
jz finpos
incq %rcx
jmp aux

finneg:
movq $-1, %rax
leave
ret

finpos:
addq %rcx, %rdi
movq %rdi, %rax
leave
ret
