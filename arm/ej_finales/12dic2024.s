.data
array:	.long 0xff00000f, 0x00001f80, 0xe0000000, 0x00f00000, 0x00000111
str1:	.string "El determinante es positivo, su valor es %d\n"
str2:	.string "El determinante es negativo, su valor es %d\n"
str3: 	.string "El deteminante es nulo\n"

.text
determinante:
push {lr}
push {r4-r5}
mul r4, r0, r3
mul r5, r1, r2
sub r0, r4, r5
pop {r4-r5}
pop {lr}
bx lr

.global main
main:
push {lr}
push {r4}

ldr r4, =array
ldr r0, [r4]
ldr r1, [r4, #4]!
ldr r2, [r4, #4]!
ldr r3, [r4, #4]!
bl determinante
cmp r0, #0
bgt mayor
blt menor
b zero

mayor:
mov r1, r0
ldr r0, =str1
bl printf
pop {r4}
pop {lr}
bx lr

menor:
mov r1, r0
ldr r0, =str2
bl printf
pop {r4}
pop {lr}
bx lr

zero:
ldr r0, =str3
bl printf
pop {r4}
pop {lr}
bx lr


