.data
array:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

.text
.global main
main:
ldr r2, =array
mov r1, #10
ldr r0, [r2, #28]
add r0, r0, r1


bx lr
