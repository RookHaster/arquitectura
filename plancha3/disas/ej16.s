	.file	"ej16.c"
	.text
	.section	.rodata
.LC0:
	.string	"a:  %p\n"
.LC1:
	.string	"b:  %p\n"
.LC2:
	.string	"c:  %p\n"
.LC3:
	.string	"d:  %p\n"
.LC4:
	.string	"e:  %p\n"
.LC5:
	.string	"f:  %p\n"
.LC6:
	.string	"g:  %p\n"
.LC7:
	.string	"h:  %p\n"
	.text
	.globl	f
	.type	f, @function
f:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%esi, -8(%rbp)
	movl	%edx, %eax
	movq	%rcx, -24(%rbp)
	movl	%r8d, %esi
	movl	%r9d, %ecx
	movl	%edi, %edx
	movb	%dl, -4(%rbp)
	movb	%al, -12(%rbp)
	movl	%esi, %eax
	movb	%al, -16(%rbp)
	movl	%ecx, %eax
	movw	%ax, -28(%rbp)
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-28(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	16(%rbp), %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	f, .-f
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	$8
	pushq	$7
	movl	$6, %r9d
	movl	$53, %r8d
	movl	$4, %ecx
	movl	$51, %edx
	movl	$2, %esi
	movl	$49, %edi
	call	f
	addq	$16, %rsp
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Debian 14.2.0-19) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
