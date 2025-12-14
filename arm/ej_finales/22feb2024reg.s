.data
str:	.string "Todos los argumentos deben ser positivos\n"
str1:	.string "Suma: %d\n"

.text
calculo:
push {lr}
push {r4}
ldr r4, [sp, #8]
cmp r0, #0
blt break
cmp r1, #0
blt break
cmp r2, #0
blt break
cmp r3, #0
blt break
cmp r4, #0
blt break
add r0, r0, r1
add r0, r0, r2
add r0, r0, r3
add r0, r0, r4
pop {r4}
pop {lr}
bx lr
break:
bl foo
pop {r4}
pop {lr}
bx lr

foo:
push {lr}
ldr r0, =str
bl printf
mov r0, #-1
pop {lr}
bx lr

.global main
main:
push {lr}
mov r0, #1
mov r1, #2
mov r2, #3
mov r3, #4
mov r4, #5
push {r4}
bl calculo
cmp r0, #-1
beq error
mov r1, r0
ldr r0, =str1
bl printf
pop {r0}	@ dummy
mov r0, #0
pop {lr}
bx lr
error:
pop {r0}	@ dummy
mov r0, #0
pop {lr}
bx lr

