.data
matrix: .long 2, 5, 1, 4
str:	.string "%d\n"

.text

determinant:
push {lr}
ldr r1, [r0, #4]
ldr r2, [r0, #8]
ldr r3, [r0, #12]
ldr r4, [r0]

mul r0, r4, r3
mul r2, r1, r2
sub r0, r2
pop {lr}
bx lr

.global main
main:
push {lr}
ldr r0, =matrix
bl determinant
mov r1, r0
ldr r0, =str
bl printf
pop {lr}
bx lr
