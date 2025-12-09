.data
a:	.long 0

.text
.global main
main:
ldr r6, =0xBEEFFACE
ldr r3, =a

str r6, [r3]
ldrb r4, [r3]

bx lr
