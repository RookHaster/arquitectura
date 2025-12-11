.data
a:	.float 1.0, 2.0, 3.0, 4.0, 5.0
b:	.float 2.0, 4.0, 6.0, 8.0, 10.0
c:	.float 0.0, 0.0, 0.0, 0.0, 0.0
str1:	.string "%f\n"
str2:	.string "La suma es: %f\n"

.text
.global main
main:
push {lr}

mov r4, #0		@ i
vmov.f32 s16, r4	@ suma
ldr r5, =a		@ a
ldr r6, =b		@ b
ldr r7, =c		@ c

for:
vldr.f32 s18, [r5]
vldr.f32 s19, [r6]
vadd.f32 s20, s18, s19
vstr.f32 s20, [r7]

vadd.f32 s21, s20, s16
vmov s16, s21

vcvt.f64.f32 d31, s20
ldr r0, =str1
vmov r1, r2, d31
bl printf
add r5, r5, #4
add r6, r6, #4
add r4, r4, #1
cmp r4, #5
blt for

ldr r0, =str2
vcvt.f64.f32 d31, s16
vmov r1, r2, d31
bl printf

mov r0, #0
pop {lr}
bx lr
