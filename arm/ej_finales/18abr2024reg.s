.data
a:	.double 4095.0, 80.0, 50.0, 1020.0, 540.0
str1:	.string "Calculando el promedio...\n"
str2:	.string "El resultado es: %f\n"

.text
promedio:
push {lr}
push {r0-r1}

ldr r0, =str1
bl printf

pop {r0-r1}
mov r2, #0		@ i
vmov.f64 d1, r2, r2	@ suma

for:
vldr.f64 d2, [r0]
vadd.f64 d1, d1, d2
add r2, r2, #1
add r0, r0, #8
cmp r2, r1
blt for

vmov s15, r2
vcvt.f64.u32 d2, s15

vdiv.f64 d0, d1, d2
pop {lr}
bx lr

.global main
main:
push {lr}

mov r1, #5
ldr r0, =a
bl promedio
ldr r0, =str2
vmov r1, r2, d0
bl printf
mov r0, #0
pop {lr}
bx lr
