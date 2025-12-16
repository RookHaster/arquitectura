.data
str:	.string "%d\n"

.text
suma:
add r0, r0, r1
add r0, r0, r2
add r0, r0, r3
ldr r1, [sp, #4]
add r0, r0, r1
ldr r1, [sp, #8]
add r0, r0, r1
ldr r1, [sp, #12]
add r0, r0, r1
ldr r1, [sp, #16]
add r0, r0, r1
bx lr

.global main
main:
push {lr}
sub sp, sp, #20
mov r0, #8
str r0, [sp, #16]
mov r0, #7
str r0, [sp, #12]
mov r0, #6
str r0, [sp, #8]
mov r0, #5
str r0, [sp, #4]
mov r0, #1
mov r1, #2
mov r2, #3
mov r3, #4
bl suma
add sp, sp, #20
mov r1, r0
ldr r0, =str
bl printf
pop {lr}
bx lr
