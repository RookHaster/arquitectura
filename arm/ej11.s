.data
a:	.float 1.0, 3.0, 6.0, 1.0
str:	.string "%f\n"

.text
det:
push {lr}

vmul.f32 s4, s0, s3
vmul.f32 s5, s1, s2
vsub.f32 s6, s4, s5
vcvt.f64.f32 d0, s6

pop {lr}
bx lr

.global main
main:
push {lr}

ldr r0, =a
vldr.f32 s0, [r0]
vldr.f32 s1, [r0, #4]
vldr.f32 s2, [r0, #8]
vldr.f32 s3, [r0, #12]

bl det
vmov r1, r2, d0
ldr r0, =str
bl printf

mov r0, #0
pop {lr}
bx lr
