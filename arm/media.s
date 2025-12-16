.data
a:	.float 4.5, 6.5, 8.0, 3.0
str:	.string "%f\n"

.text
media:
mov r2, #0
vmov.f32 s0, r2

.L1:
vldr.f32 s1, [r0]
vadd.f32 s0, s0, s1
add r2, r2, #1
add r0, r0, #4
cmp r2, r1
blt .L1

vmov.f32 s1, r1
vcvt.f32.u32 s1, s1
vdiv.f32 s0, s0, s1
bx lr

.global main
main:
push {lr}
mov r1, #4
ldr r0, =a
bl media

vcvt.f64.f32 d0, s0
vmov r1, r2, d0
ldr r0, =str
bl printf

mov r0, #0
pop {lr}
bx lr
