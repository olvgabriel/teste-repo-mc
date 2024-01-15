	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	.file	"lab03.c"
	.globl	read
	.p2align	2
	.type	read,@function
read:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a3, -12(s0)
	lw	a4, -16(s0)
	lw	a5, -20(s0)
	#APP
	mv	a0, a3	# file descriptor
	mv	a1, a4	# buffer 
	mv	a2, a5	# size 
	addi	a7, zero, 63	# syscall read (63) 
	ecall	

	mv	a3, a0
	#NO_APP
	sw	a3, -28(s0)
	lw	a0, -28(s0)
	sw	a0, -24(s0)
	lw	a0, -24(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	read, .Lfunc_end0-read

	.globl	write
	.p2align	2
	.type	write,@function
write:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a3, -12(s0)
	lw	a4, -16(s0)
	lw	a5, -20(s0)
	#APP
	mv	a0, a3	# file descriptor
	mv	a1, a4	# buffer 
	mv	a2, a5	# size 
	addi	a7, zero, 64	# syscall write (64) 
	ecall	

	#NO_APP
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	write, .Lfunc_end1-write

	.globl	pot
	.p2align	2
	.type	pot,@function
pot:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	addi	a0, zero, 1
	sw	a0, -20(s0)
	mv	a0, zero
	sw	a0, -24(s0)
	j	.LBB2_1
.LBB2_1:
	lw	a0, -24(s0)
	lw	a1, -16(s0)
	bge	a0, a1, .LBB2_4
	j	.LBB2_2
.LBB2_2:
	lw	a1, -16(s0)
	lw	a0, -20(s0)
	mul	a0, a0, a1
	sw	a0, -20(s0)
	j	.LBB2_3
.LBB2_3:
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB2_1
.LBB2_4:
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end2:
	.size	pot, .Lfunc_end2-pot

	.globl	hexToInt
	.p2align	2
	.type	hexToInt,@function
hexToInt:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a0, zero
	sw	a0, -20(s0)
	lw	a0, -16(s0)
	addi	a0, a0, -1
	sw	a0, -24(s0)
	j	.LBB3_1
.LBB3_1:
	lw	a0, -24(s0)
	addi	a1, zero, 2
	blt	a0, a1, .LBB3_4
	j	.LBB3_2
.LBB3_2:
	lw	a1, -12(s0)
	lw	a0, -24(s0)
	add	a1, a1, a0
	lbu	a1, 0(a1)
	sw	a1, -28(s0)
	lw	a1, -16(s0)
	not	a0, a0
	add	a1, a0, a1
	addi	a0, zero, 16
	call	pot
	mv	a1, a0
	lw	a0, -28(s0)
	mul	a1, a0, a1
	lw	a0, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	j	.LBB3_3
.LBB3_3:
	lw	a0, -24(s0)
	addi	a0, a0, -1
	sw	a0, -24(s0)
	j	.LBB3_1
.LBB3_4:
	lw	a0, -20(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end3:
	.size	hexToInt, .Lfunc_end3-hexToInt

	.globl	main
	.p2align	2
	.type	main,@function
main:
	addi	sp, sp, -64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	addi	s0, sp, 64
	mv	a0, zero
	sw	a0, -12(s0)
	addi	a1, s0, -32
	addi	a2, zero, 20
	call	read
	sw	a0, -56(s0)
	lbu	a0, -32(s0)
	addi	a1, zero, 48
	bne	a0, a1, .LBB4_3
	j	.LBB4_1
.LBB4_1:
	lbu	a0, -31(s0)
	addi	a1, zero, 120
	bne	a0, a1, .LBB4_3
	j	.LBB4_2
.LBB4_2:
	lw	a1, -56(s0)
	addi	a0, s0, -32
	call	hexToInt
	sw	a0, -60(s0)
	j	.LBB4_3
.LBB4_3:
	lw	a2, -56(s0)
	addi	a0, zero, 1
	addi	a1, s0, -32
	call	write
	mv	a0, zero
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Lfunc_end4:
	.size	main, .Lfunc_end4-main

	.globl	_start
	.p2align	2
	.type	_start,@function
_start:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	call	main
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end5:
	.size	_start, .Lfunc_end5-_start

	.ident	"Ubuntu clang version 12.0.0-3ubuntu1~20.04.5"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read
	.addrsig_sym write
	.addrsig_sym pot
	.addrsig_sym hexToInt
	.addrsig_sym main
