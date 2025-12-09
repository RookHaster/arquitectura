.data
a:	.long 31
str:	.string "%u\n"

.text
function:
push {lr}
mov r1, r0
mov r0, #1

while:
cmp r1, #0
beq fin
lsl r0, #1
sub r1, #1
b while

fin:
pop {lr}
bx lr


.global main
main:
push {lr}
ldr r1, =a
ldr r0, [r1]
bl function
mov r1, r0
ldr r0, =str
bl printf
pop {lr}
bx lr
