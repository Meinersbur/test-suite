	.text
	.file	"pr9971.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI0_0:
	.long	15                      # 0xf
	.long	15                      # 0xf
	.long	15                      # 0xf
	.long	15                      # 0xf
.LCPI0_1:
	.long	1065353216              # 0x3f800000
	.long	1065353216              # 0x3f800000
	.long	1065353216              # 0x3f800000
	.long	1065353216              # 0x3f800000
.LCPI0_2:
	.long	16                      # 0x10
	.long	16                      # 0x10
	.long	16                      # 0x10
	.long	16                      # 0x10
	.text
	.globl	vrlh
	.align	16, 0x90
	.type	vrlh,@function
vrlh:                                   # @vrlh
	.cfi_startproc
# BB#0:
	movdqu	(%rsi), %xmm3
	pxor	%xmm8, %xmm8
	movdqa	%xmm3, %xmm4
	punpckhwd	%xmm8, %xmm4    # xmm4 = xmm4[4],xmm8[4],xmm4[5],xmm8[5],xmm4[6],xmm8[6],xmm4[7],xmm8[7]
	punpcklwd	%xmm8, %xmm3    # xmm3 = xmm3[0],xmm8[0],xmm3[1],xmm8[1],xmm3[2],xmm8[2],xmm3[3],xmm8[3]
	movdqa	.LCPI0_0(%rip), %xmm1   # xmm1 = [15,15,15,15]
	pand	%xmm1, %xmm3
	pand	%xmm1, %xmm4
	movdqu	(%rdi), %xmm1
	movdqa	%xmm1, %xmm10
	punpcklwd	%xmm8, %xmm10   # xmm10 = xmm10[0],xmm8[0],xmm10[1],xmm8[1],xmm10[2],xmm8[2],xmm10[3],xmm8[3]
	punpckhwd	%xmm8, %xmm1    # xmm1 = xmm1[4],xmm8[4],xmm1[5],xmm8[5],xmm1[6],xmm8[6],xmm1[7],xmm8[7]
	movdqa	.LCPI0_2(%rip), %xmm6   # xmm6 = [16,16,16,16]
	movdqa	%xmm6, %xmm5
	psubd	%xmm4, %xmm6
	pslld	$23, %xmm4
	movdqa	.LCPI0_1(%rip), %xmm9   # xmm9 = [1065353216,1065353216,1065353216,1065353216]
	paddd	%xmm9, %xmm4
	cvttps2dq	%xmm4, %xmm4
	pshufd	$245, %xmm4, %xmm0      # xmm0 = xmm4[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	pshufd	$245, %xmm1, %xmm7      # xmm7 = xmm1[1,1,3,3]
	pmuludq	%xmm0, %xmm7
	pshufd	$232, %xmm7, %xmm0      # xmm0 = xmm7[0,2,2,3]
	punpckldq	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
	psubd	%xmm3, %xmm5
	pslld	$23, %xmm3
	paddd	%xmm9, %xmm3
	cvttps2dq	%xmm3, %xmm0
	pshufd	$245, %xmm0, %xmm7      # xmm7 = xmm0[1,1,3,3]
	pmuludq	%xmm10, %xmm0
	pshufd	$232, %xmm0, %xmm3      # xmm3 = xmm0[0,2,2,3]
	pshufd	$245, %xmm10, %xmm0     # xmm0 = xmm10[1,1,3,3]
	pmuludq	%xmm7, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm3    # xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
	movdqa	%xmm6, %xmm0
	psrldq	$12, %xmm0              # xmm0 = xmm0[12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero
	movdqa	%xmm1, %xmm7
	psrld	%xmm0, %xmm7
	movdqa	%xmm6, %xmm0
	psrlq	$32, %xmm0
	movdqa	%xmm1, %xmm2
	psrld	%xmm0, %xmm2
	movsd	%xmm2, %xmm7            # xmm7 = xmm2[0],xmm7[1]
	pshufd	$237, %xmm7, %xmm0      # xmm0 = xmm7[1,3,2,3]
	movdqa	%xmm6, %xmm2
	punpckhdq	%xmm8, %xmm2    # xmm2 = xmm2[2],xmm8[2],xmm2[3],xmm8[3]
	movdqa	%xmm1, %xmm7
	psrld	%xmm2, %xmm7
	punpckldq	%xmm8, %xmm6    # xmm6 = xmm6[0],xmm8[0],xmm6[1],xmm8[1]
	psrld	%xmm6, %xmm1
	movsd	%xmm1, %xmm7            # xmm7 = xmm1[0],xmm7[1]
	pshufd	$232, %xmm7, %xmm2      # xmm2 = xmm7[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	movdqa	%xmm5, %xmm0
	psrldq	$12, %xmm0              # xmm0 = xmm0[12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero,zero
	movdqa	%xmm10, %xmm1
	psrld	%xmm0, %xmm1
	movdqa	%xmm5, %xmm0
	psrlq	$32, %xmm0
	movdqa	%xmm10, %xmm6
	psrld	%xmm0, %xmm6
	movsd	%xmm6, %xmm1            # xmm1 = xmm6[0],xmm1[1]
	pshufd	$237, %xmm1, %xmm0      # xmm0 = xmm1[1,3,2,3]
	movdqa	%xmm5, %xmm1
	punpckhdq	%xmm8, %xmm1    # xmm1 = xmm1[2],xmm8[2],xmm1[3],xmm8[3]
	movdqa	%xmm10, %xmm6
	psrld	%xmm1, %xmm6
	punpckldq	%xmm8, %xmm5    # xmm5 = xmm5[0],xmm8[0],xmm5[1],xmm8[1]
	psrld	%xmm5, %xmm10
	movsd	%xmm10, %xmm6           # xmm6 = xmm10[0],xmm6[1]
	pshufd	$232, %xmm6, %xmm1      # xmm1 = xmm6[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	por	%xmm3, %xmm1
	por	%xmm4, %xmm2
	pslld	$16, %xmm2
	psrad	$16, %xmm2
	pslld	$16, %xmm1
	psrad	$16, %xmm1
	packssdw	%xmm2, %xmm1
	movdqu	%xmm1, (%rdx)
	retq
.Lfunc_end0:
	.size	vrlh, .Lfunc_end0-vrlh
	.cfi_endproc


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
