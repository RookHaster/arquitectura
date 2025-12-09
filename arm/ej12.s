.data
a:	.word 1, 2, 3, 4
b:	.word 2, 3, 4, 5
len:	.word 4
str:	.string "La suma es: %d\n"

.text
suma:
push {lr}
push {r4}
push {r5}
push {r6}
push {r7}

mov r4, #0	@ result
mov r3, #0	@ i

for:
mov r6, r3, lsl #2
ldr r7, [r0, r6]
ldr r5, [r1, r6]
add r4, r7
add r4, r5
add r3, #1
cmp r3, r2
blt for

mov r0, r4

pop {r7}
pop {r6}
pop {r5}
pop {r4}
pop {lr}
bx lr

.global main
main:
push {lr}
ldr r0, =a
ldr r1, =b
ldr r3, =len
ldr r2, [r3]
bl suma
mov r1, r0
ldr r0, =str
bl printf
pop {lr}
bx lr
