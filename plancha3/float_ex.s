.data
.align 16
a:	.float 1.0, 2.0, 3.0, 4.0
b:	.float 1.0, 2.0, 3.0, 4.0
c:	.float

.text
.global main
main:
movss a, %xmm0	# carga a
addss b, %xmm0	# suma b + a
movss %xmm0, c	# guarda la suma en c

movaps a, %xmm0	# carga 4 floats desde a
addps b, %xmm0	# suma a[0]+b[0], a[1]+b[1], a[2]+b[2], a[3]+b[3]
movaps %xmm0, c	# guarda las dos sumas en c
ret
