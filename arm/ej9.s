.data
a:	.word 10
b:	.word 5
str:	.string "%u\n"

.text
campesino_ruso:
push {lr}
mov r2, #0

while:
tst r1, #1
lsleq r0, #1
lsreq r1, #1
addne r2, r0
subne r1, #1
cmp r1, #1
bgt while

add r2, r0
mov r0, r2
pop {lr}
bx lr

.global main
main:
push {lr}

ldr r2, =a
ldr r1, [r2]
ldr r2, =b
ldr r0, [r2]
bl campesino_ruso
mov r1, r0
ldr r0, =str
bl printf
pop {lr}
bx lr
