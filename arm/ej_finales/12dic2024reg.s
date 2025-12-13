.data
numbers:	.word 3, 6, 9, 12, 15
str:		.string "Valor maximo: %d\n"

.text
.global main
main:
push {lr}

ldr r0, =numbers
mov r1, #5
mov r2, #0
mov r3, #0

loop:
ldr r4, [r0, r3, lsl #2]
cmp r4, r2
movgt r2, r4
add r3, r3, #1
cmp r3, r1
bne loop

ldr r0, =str
mov  r1, r2
bl printf

pop {lr}
bx lr
