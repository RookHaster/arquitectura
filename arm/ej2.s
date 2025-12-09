.global main
main:
mov r3, #0x8000
str r6, [r3, #12] 	@ r6 --> 0x800C
strb r7, [r3], #4	@ r7 (un byte) --> 0x8000 && r3 += 4 = 0x8004
ldrh r5, [r3], #8	@ r3 = 0x8004 --> r5 && r3 += 8 = 0x800A
ldr r12, [r3, #12]!	@ (r3+12) = 0x8017 --> r12 && r3 += 12 = 0x8017
bx lr
