.data
d:	.long 4
f:	.long 0
str:	.string "La suma es %d\n"

.text
suma:
add r0, r1
add r0, r2
add r0, r3
ldr r1, [sp]
add r0, r1
ldr r1, =f
str r0, [r1]
ldr r1, =999
cmp r0, #20
movgt r0, r1
bx lr

.global main
main:
push {lr}
mov r0, #1
mov r1, #2
mov r2, #3
mov r3, #5
push {r3}
ldr r3, =d
ldr r3, [r3]
bl suma
mov r1, r0
ldr r0, =str
bl printf
pop {r3}	@ dummy
pop {lr}
bx lr


