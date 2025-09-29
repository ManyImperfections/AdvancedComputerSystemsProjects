	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 26, 0
	.globl	__Z6timeitNSt3__18functionIFvvEEEi ; -- Begin function _Z6timeitNSt3__18functionIFvvEEEi
	.p2align	2
__Z6timeitNSt3__18functionIFvvEEEi:     ; @_Z6timeitNSt3__18functionIFvvEEEi
	.cfi_startproc
; %bb.0:
	stp	d9, d8, [sp, #-64]!             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	cmp	w1, #1
	b.lt	LBB0_4
; %bb.1:
	mov	x19, x1
	mov	x20, x0
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d8, x8
	mov	x22, #145685290680320           ; =0x848000000000
	movk	x22, #16686, lsl #48
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x21, x0
	ldr	x0, [x20, #24]
	cbz	x0, LBB0_6
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	ldr	x8, [x0]
	ldr	x8, [x8, #48]
	blr	x8
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x21
	scvtf	d0, x8
	fmov	d1, x22
	fdiv	d0, d0, d1
	fcmp	d0, d8
	fcsel	d8, d0, d8, mi
	subs	w19, w19, #1
	b.ne	LBB0_2
	b	LBB0_5
LBB0_4:
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d8, x8
LBB0_5:
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fdiv	d0, d8, d0
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #64               ; 16-byte Folded Reload
	ret
LBB0_6:
	bl	__ZNSt3__125__throw_bad_function_callB8ne200100Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__Z12saxpy_scalarfPKfPfm        ; -- Begin function _Z12saxpy_scalarfPKfPfm
	.p2align	2
__Z12saxpy_scalarfPKfPfm:               ; @_Z12saxpy_scalarfPKfPfm
	.cfi_startproc
; %bb.0:
                                        ; kill: def $s0 killed $s0 def $q0
	cbz	x2, LBB1_7
; %bb.1:
	cmp	x2, #4
	b.lo	LBB1_4
; %bb.2:
	lsl	x8, x2, #2
	add	x9, x0, x8
	cmp	x9, x1
	b.ls	LBB1_8
; %bb.3:
	add	x8, x1, x8
	cmp	x8, x0
	b.ls	LBB1_8
LBB1_4:
	mov	x8, #0                          ; =0x0
LBB1_5:
	sub	x9, x2, x8
	lsl	x10, x8, #2
	add	x8, x1, x10
	add	x10, x0, x10
LBB1_6:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x10], #4
	ldr	s2, [x8]
	fmadd	s1, s0, s1, s2
	str	s1, [x8], #4
	subs	x9, x9, #1
	b.ne	LBB1_6
LBB1_7:
	ret
LBB1_8:
	cmp	x2, #16
	b.hs	LBB1_10
; %bb.9:
	mov	x8, #0                          ; =0x0
	b	LBB1_14
LBB1_10:
	and	x8, x2, #0xfffffffffffffff0
	dup.4s	v1, v0[0]
	add	x9, x1, #32
	add	x10, x0, #32
	mov	x11, x8
LBB1_11:                                ; =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x10, #-32]
	ldp	q4, q5, [x10], #64
	ldp	q6, q7, [x9, #-32]
	ldp	q16, q17, [x9]
	fmla.4s	v6, v2, v1
	fmla.4s	v7, v3, v1
	fmla.4s	v16, v4, v1
	fmla.4s	v17, v5, v1
	stp	q6, q7, [x9, #-32]
	stp	q16, q17, [x9], #64
	subs	x11, x11, #16
	b.ne	LBB1_11
; %bb.12:
	cmp	x8, x2
	b.eq	LBB1_7
; %bb.13:
	tst	x2, #0xc
	b.eq	LBB1_5
LBB1_14:
	mov	x11, x8
	and	x8, x2, #0xfffffffffffffffc
	dup.4s	v1, v0[0]
	lsl	x10, x11, #2
	add	x9, x0, x10
	add	x10, x1, x10
	sub	x11, x11, x8
LBB1_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	q2, [x9], #16
	ldr	q3, [x10]
	fmla.4s	v3, v2, v1
	str	q3, [x10], #16
	adds	x11, x11, #4
	b.ne	LBB1_15
; %bb.16:
	cmp	x8, x2
	b.eq	LBB1_7
	b	LBB1_5
	.cfi_endproc
                                        ; -- End function
	.globl	__Z16saxpy_vectorizedfPKfPfm    ; -- Begin function _Z16saxpy_vectorizedfPKfPfm
	.p2align	2
__Z16saxpy_vectorizedfPKfPfm:           ; @_Z16saxpy_vectorizedfPKfPfm
	.cfi_startproc
; %bb.0:
                                        ; kill: def $s0 killed $s0 def $q0
	cbz	x2, LBB2_7
; %bb.1:
	cmp	x2, #4
	b.lo	LBB2_4
; %bb.2:
	lsl	x8, x2, #2
	add	x9, x0, x8
	cmp	x9, x1
	b.ls	LBB2_8
; %bb.3:
	add	x8, x1, x8
	cmp	x8, x0
	b.ls	LBB2_8
LBB2_4:
	mov	x8, #0                          ; =0x0
LBB2_5:
	sub	x9, x2, x8
	lsl	x10, x8, #2
	add	x8, x1, x10
	add	x10, x0, x10
LBB2_6:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x10], #4
	ldr	s2, [x8]
	fmadd	s1, s0, s1, s2
	str	s1, [x8], #4
	subs	x9, x9, #1
	b.ne	LBB2_6
LBB2_7:
	ret
LBB2_8:
	cmp	x2, #16
	b.hs	LBB2_10
; %bb.9:
	mov	x8, #0                          ; =0x0
	b	LBB2_14
LBB2_10:
	and	x8, x2, #0xfffffffffffffff0
	dup.4s	v1, v0[0]
	add	x9, x1, #32
	add	x10, x0, #32
	mov	x11, x8
LBB2_11:                                ; =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x10, #-32]
	ldp	q4, q5, [x10], #64
	ldp	q6, q7, [x9, #-32]
	ldp	q16, q17, [x9]
	fmla.4s	v6, v2, v1
	fmla.4s	v7, v3, v1
	fmla.4s	v16, v4, v1
	fmla.4s	v17, v5, v1
	stp	q6, q7, [x9, #-32]
	stp	q16, q17, [x9], #64
	subs	x11, x11, #16
	b.ne	LBB2_11
; %bb.12:
	cmp	x8, x2
	b.eq	LBB2_7
; %bb.13:
	tst	x2, #0xc
	b.eq	LBB2_5
LBB2_14:
	mov	x11, x8
	and	x8, x2, #0xfffffffffffffffc
	dup.4s	v1, v0[0]
	lsl	x10, x11, #2
	add	x9, x0, x10
	add	x10, x1, x10
	sub	x11, x11, x8
LBB2_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	q2, [x9], #16
	ldr	q3, [x10]
	fmla.4s	v3, v2, v1
	str	q3, [x10], #16
	adds	x11, x11, #4
	b.ne	LBB2_15
; %bb.16:
	cmp	x8, x2
	b.eq	LBB2_7
	b	LBB2_5
	.cfi_endproc
                                        ; -- End function
	.globl	__Z14element_scalarPKfS0_Pfm    ; -- Begin function _Z14element_scalarPKfS0_Pfm
	.p2align	2
__Z14element_scalarPKfS0_Pfm:           ; @_Z14element_scalarPKfS0_Pfm
	.cfi_startproc
; %bb.0:
	cbz	x3, LBB3_5
; %bb.1:
	cmp	x3, #4
	b.hs	LBB3_6
; %bb.2:
	mov	x8, #0                          ; =0x0
LBB3_3:
	sub	x9, x3, x8
	lsl	x11, x8, #2
	add	x8, x2, x11
	add	x10, x1, x11
	add	x11, x0, x11
LBB3_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x11], #4
	ldr	s1, [x10], #4
	fmul	s0, s0, s1
	str	s0, [x8], #4
	subs	x9, x9, #1
	b.ne	LBB3_4
LBB3_5:
	ret
LBB3_6:
	mov	x8, #0                          ; =0x0
	sub	x9, x2, x0
	cmp	x9, #64
	b.lo	LBB3_3
; %bb.7:
	sub	x9, x2, x1
	cmp	x9, #64
	b.lo	LBB3_3
; %bb.8:
	cmp	x3, #16
	b.hs	LBB3_10
; %bb.9:
	mov	x8, #0                          ; =0x0
	b	LBB3_14
LBB3_10:
	and	x8, x3, #0xfffffffffffffff0
	add	x9, x2, #32
	add	x10, x0, #32
	add	x11, x1, #32
	mov	x12, x8
LBB3_11:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x10, #-32]
	ldp	q2, q3, [x10], #64
	ldp	q4, q5, [x11, #-32]
	ldp	q6, q7, [x11], #64
	fmul.4s	v0, v0, v4
	fmul.4s	v1, v1, v5
	fmul.4s	v2, v2, v6
	fmul.4s	v3, v3, v7
	stp	q0, q1, [x9, #-32]
	stp	q2, q3, [x9], #64
	subs	x12, x12, #16
	b.ne	LBB3_11
; %bb.12:
	cmp	x8, x3
	b.eq	LBB3_5
; %bb.13:
	tst	x3, #0xc
	b.eq	LBB3_3
LBB3_14:
	mov	x12, x8
	and	x8, x3, #0xfffffffffffffffc
	lsl	x11, x12, #2
	add	x9, x0, x11
	add	x10, x1, x11
	add	x11, x2, x11
	sub	x12, x12, x8
LBB3_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x9], #16
	ldr	q1, [x10], #16
	fmul.4s	v0, v0, v1
	str	q0, [x11], #16
	adds	x12, x12, #4
	b.ne	LBB3_15
; %bb.16:
	cmp	x8, x3
	b.ne	LBB3_3
	b	LBB3_5
	.cfi_endproc
                                        ; -- End function
	.globl	__Z18element_vectorizedPKfS0_Pfm ; -- Begin function _Z18element_vectorizedPKfS0_Pfm
	.p2align	2
__Z18element_vectorizedPKfS0_Pfm:       ; @_Z18element_vectorizedPKfS0_Pfm
	.cfi_startproc
; %bb.0:
	cbz	x3, LBB4_5
; %bb.1:
	cmp	x3, #4
	b.hs	LBB4_6
; %bb.2:
	mov	x8, #0                          ; =0x0
LBB4_3:
	sub	x9, x3, x8
	lsl	x11, x8, #2
	add	x8, x2, x11
	add	x10, x1, x11
	add	x11, x0, x11
LBB4_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x11], #4
	ldr	s1, [x10], #4
	fmul	s0, s0, s1
	str	s0, [x8], #4
	subs	x9, x9, #1
	b.ne	LBB4_4
LBB4_5:
	ret
LBB4_6:
	mov	x8, #0                          ; =0x0
	sub	x9, x2, x0
	cmp	x9, #64
	b.lo	LBB4_3
; %bb.7:
	sub	x9, x2, x1
	cmp	x9, #64
	b.lo	LBB4_3
; %bb.8:
	cmp	x3, #16
	b.hs	LBB4_10
; %bb.9:
	mov	x8, #0                          ; =0x0
	b	LBB4_14
LBB4_10:
	and	x8, x3, #0xfffffffffffffff0
	add	x9, x2, #32
	add	x10, x0, #32
	add	x11, x1, #32
	mov	x12, x8
LBB4_11:                                ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x10, #-32]
	ldp	q2, q3, [x10], #64
	ldp	q4, q5, [x11, #-32]
	ldp	q6, q7, [x11], #64
	fmul.4s	v0, v0, v4
	fmul.4s	v1, v1, v5
	fmul.4s	v2, v2, v6
	fmul.4s	v3, v3, v7
	stp	q0, q1, [x9, #-32]
	stp	q2, q3, [x9], #64
	subs	x12, x12, #16
	b.ne	LBB4_11
; %bb.12:
	cmp	x8, x3
	b.eq	LBB4_5
; %bb.13:
	tst	x3, #0xc
	b.eq	LBB4_3
LBB4_14:
	mov	x12, x8
	and	x8, x3, #0xfffffffffffffffc
	lsl	x11, x12, #2
	add	x9, x0, x11
	add	x10, x1, x11
	add	x11, x2, x11
	sub	x12, x12, x8
LBB4_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x9], #16
	ldr	q1, [x10], #16
	fmul.4s	v0, v0, v1
	str	q0, [x11], #16
	adds	x12, x12, #4
	b.ne	LBB4_15
; %bb.16:
	cmp	x8, x3
	b.ne	LBB4_3
	b	LBB4_5
	.cfi_endproc
                                        ; -- End function
	.globl	__Z10dot_scalarPKfS0_m          ; -- Begin function _Z10dot_scalarPKfS0_m
	.p2align	2
__Z10dot_scalarPKfS0_m:                 ; @_Z10dot_scalarPKfS0_m
	.cfi_startproc
; %bb.0:
	cbz	x2, LBB5_3
; %bb.1:
	cmp	x2, #4
	b.hs	LBB5_4
; %bb.2:
	mov	x8, #0                          ; =0x0
	movi	d0, #0000000000000000
	b	LBB5_13
LBB5_3:
	movi	d0, #0000000000000000
	ret
LBB5_4:
	cmp	x2, #16
	b.hs	LBB5_6
; %bb.5:
	mov	x8, #0                          ; =0x0
	movi	d0, #0000000000000000
	b	LBB5_10
LBB5_6:
	and	x8, x2, #0xfffffffffffffff0
	add	x9, x1, #32
	add	x10, x0, #32
	movi	d0, #0000000000000000
	mov	x11, x8
LBB5_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x10, #-32]
	ldp	q3, q4, [x10], #64
	ldp	q5, q6, [x9, #-32]
	ldp	q7, q16, [x9], #64
	fmul.4s	v1, v1, v5
	mov	s5, v1[3]
	mov	s17, v1[2]
	mov	s18, v1[1]
	fmul.4s	v2, v2, v6
	mov	s6, v2[3]
	mov	s19, v2[2]
	mov	s20, v2[1]
	fmul.4s	v3, v3, v7
	mov	s7, v3[3]
	mov	s21, v3[2]
	mov	s22, v3[1]
	fmul.4s	v4, v4, v16
	mov	s16, v4[3]
	mov	s23, v4[2]
	mov	s24, v4[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s18
	fadd	s0, s0, s17
	fadd	s0, s0, s5
	fadd	s0, s0, s2
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s6
	fadd	s0, s0, s3
	fadd	s0, s0, s22
	fadd	s0, s0, s21
	fadd	s0, s0, s7
	fadd	s0, s0, s4
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s0, s0, s16
	subs	x11, x11, #16
	b.ne	LBB5_7
; %bb.8:
	cmp	x8, x2
	b.eq	LBB5_15
; %bb.9:
	tst	x2, #0xc
	b.eq	LBB5_13
LBB5_10:
	mov	x11, x8
	and	x8, x2, #0xfffffffffffffffc
	lsl	x10, x11, #2
	add	x9, x0, x10
	add	x10, x1, x10
	sub	x11, x11, x8
LBB5_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x9], #16
	ldr	q2, [x10], #16
	fmul.4s	v1, v1, v2
	mov	s2, v1[3]
	mov	s3, v1[2]
	mov	s4, v1[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	adds	x11, x11, #4
	b.ne	LBB5_11
; %bb.12:
	cmp	x8, x2
	b.eq	LBB5_15
LBB5_13:
	sub	x9, x2, x8
	lsl	x10, x8, #2
	add	x8, x1, x10
	add	x10, x0, x10
LBB5_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x10], #4
	ldr	s2, [x8], #4
	fmadd	s0, s1, s2, s0
	subs	x9, x9, #1
	b.ne	LBB5_14
LBB5_15:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z14dot_vectorizedPKfS0_m      ; -- Begin function _Z14dot_vectorizedPKfS0_m
	.p2align	2
__Z14dot_vectorizedPKfS0_m:             ; @_Z14dot_vectorizedPKfS0_m
	.cfi_startproc
; %bb.0:
	cbz	x2, LBB6_3
; %bb.1:
	cmp	x2, #4
	b.hs	LBB6_4
; %bb.2:
	mov	x8, #0                          ; =0x0
	movi	d0, #0000000000000000
	b	LBB6_13
LBB6_3:
	movi	d0, #0000000000000000
	ret
LBB6_4:
	cmp	x2, #16
	b.hs	LBB6_6
; %bb.5:
	mov	x8, #0                          ; =0x0
	movi	d0, #0000000000000000
	b	LBB6_10
LBB6_6:
	and	x8, x2, #0xfffffffffffffff0
	add	x9, x1, #32
	add	x10, x0, #32
	movi	d0, #0000000000000000
	mov	x11, x8
LBB6_7:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x10, #-32]
	ldp	q3, q4, [x10], #64
	ldp	q5, q6, [x9, #-32]
	ldp	q7, q16, [x9], #64
	fmul.4s	v1, v1, v5
	mov	s5, v1[3]
	mov	s17, v1[2]
	mov	s18, v1[1]
	fmul.4s	v2, v2, v6
	mov	s6, v2[3]
	mov	s19, v2[2]
	mov	s20, v2[1]
	fmul.4s	v3, v3, v7
	mov	s7, v3[3]
	mov	s21, v3[2]
	mov	s22, v3[1]
	fmul.4s	v4, v4, v16
	mov	s16, v4[3]
	mov	s23, v4[2]
	mov	s24, v4[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s18
	fadd	s0, s0, s17
	fadd	s0, s0, s5
	fadd	s0, s0, s2
	fadd	s0, s0, s20
	fadd	s0, s0, s19
	fadd	s0, s0, s6
	fadd	s0, s0, s3
	fadd	s0, s0, s22
	fadd	s0, s0, s21
	fadd	s0, s0, s7
	fadd	s0, s0, s4
	fadd	s0, s0, s24
	fadd	s0, s0, s23
	fadd	s0, s0, s16
	subs	x11, x11, #16
	b.ne	LBB6_7
; %bb.8:
	cmp	x8, x2
	b.eq	LBB6_15
; %bb.9:
	tst	x2, #0xc
	b.eq	LBB6_13
LBB6_10:
	mov	x11, x8
	and	x8, x2, #0xfffffffffffffffc
	lsl	x10, x11, #2
	add	x9, x0, x10
	add	x10, x1, x10
	sub	x11, x11, x8
LBB6_11:                                ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x9], #16
	ldr	q2, [x10], #16
	fmul.4s	v1, v1, v2
	mov	s2, v1[3]
	mov	s3, v1[2]
	mov	s4, v1[1]
	fadd	s0, s0, s1
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	adds	x11, x11, #4
	b.ne	LBB6_11
; %bb.12:
	cmp	x8, x2
	b.eq	LBB6_15
LBB6_13:
	sub	x9, x2, x8
	lsl	x10, x8, #2
	add	x8, x1, x10
	add	x10, x0, x10
LBB6_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x10], #4
	ldr	s2, [x8], #4
	fmadd	s0, s1, s2, s0
	subs	x9, x9, #1
	b.ne	LBB6_14
LBB6_15:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #288
	stp	d11, d10, [sp, #160]            ; 16-byte Folded Spill
	stp	d9, d8, [sp, #176]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #192]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #208]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #224]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #240]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #256]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	mov	w8, #1048576                    ; =0x100000
	str	x8, [sp, #136]
	mov	w0, #4194304                    ; =0x400000
	bl	__Znwm
	mov	x19, x0
	add	x20, x0, #1024, lsl #12         ; =4194304
	str	x0, [sp, #112]
	str	x20, [sp, #128]
	mov	w1, #4194304                    ; =0x400000
	bl	_bzero
	str	x20, [sp, #120]
Ltmp0:
	mov	w0, #4194304                    ; =0x400000
	bl	__Znwm
Ltmp1:
; %bb.1:
	mov	x20, x0
	add	x21, x0, #1024, lsl #12         ; =4194304
	str	x0, [sp, #88]
	str	x21, [sp, #104]
	mov	w1, #4194304                    ; =0x400000
	bl	_bzero
	str	x21, [sp, #96]
Ltmp3:
	mov	w0, #4194304                    ; =0x400000
	bl	__Znwm
Ltmp4:
; %bb.2:
	add	x21, x0, #1024, lsl #12         ; =4194304
	str	x0, [sp, #64]
	str	x21, [sp, #80]
	mov	w1, #4194304                    ; =0x400000
	bl	_bzero
	mov	x8, #0                          ; =0x0
	str	x21, [sp, #72]
	mov	w21, #42                        ; =0x2a
	mov	w9, #5009                       ; =0x1391
	movk	w9, #48271, lsl #16
	mov	w10, #44488                     ; =0xadc8
	mov	w11, #48271                     ; =0xbc8f
	mov	w12, #3399                      ; =0xd47
	movi	d0, #0000000000000000
	mov	w13, #2147483647                ; =0x7fffffff
LBB7_3:                                 ; =>This Inner Loop Header: Depth=1
	umull	x14, w21, w9
	lsr	x14, x14, #47
	msub	w15, w14, w10, w21
	mul	w15, w15, w11
	mul	w14, w14, w12
	subs	w14, w15, w14
	csel	w15, w13, wzr, lo
	add	w14, w15, w14
	sub	w15, w14, #1
	ucvtf	s1, w15, #31
	fadd	s1, s1, s0
	str	s1, [x19, x8]
	umull	x15, w14, w9
	lsr	x15, x15, #47
	msub	w14, w15, w10, w14
	mul	w14, w14, w11
	mul	w15, w15, w12
	subs	w14, w14, w15
	csel	w15, w13, wzr, lo
	add	w21, w15, w14
	sub	w14, w21, #1
	ucvtf	s1, w14, #31
	fadd	s1, s1, s0
	str	s1, [x20, x8]
	add	x8, x8, #4
	cmp	x8, #1024, lsl #12              ; =4194304
	b.ne	LBB7_3
; %bb.4:
Ltmp6:
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Ltmp7:
; %bb.5:
	mov	x19, x0
Lloh0:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh1:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	add	x9, sp, #112
	stp	x8, x9, [x0]
	add	x8, sp, #88
	add	x9, sp, #136
	stp	x8, x9, [x0, #16]
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp9:
	mov	x0, x19
	blr	x8
Ltmp10:
; %bb.6:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x20, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x22, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp11:
	mov	x0, x19
	blr	x8
Ltmp12:
; %bb.7:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x23, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x24, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp13:
	mov	x0, x19
	blr	x8
Ltmp14:
; %bb.8:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x25, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x27, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp15:
	mov	x0, x19
	blr	x8
Ltmp16:
; %bb.9:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x28, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x26, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp17:
	mov	x0, x19
	blr	x8
Ltmp18:
; %bb.10:
	sub	x8, x28, x27
	scvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d8, x8
	fdiv	d0, d0, d8
	sub	x8, x25, x24
	scvtf	d1, x8
	fdiv	d1, d1, d8
	sub	x8, x23, x22
	scvtf	d2, x8
	fdiv	d2, d2, d8
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	sub	x8, x20, x8
	scvtf	d3, x8
	fdiv	d3, d3, d8
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d4, x8
	fminnm	d3, d3, d4
	fcmp	d2, d3
	fcsel	d2, d2, d3, mi
	fcmp	d1, d2
	fcsel	d1, d1, d2, mi
	fcmp	d0, d1
	fcsel	d9, d0, d1, mi
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x26
	scvtf	d0, x8
	fdiv	d0, d0, d8
	fcmp	d0, d9
	fcsel	d8, d0, d9, mi
	ldr	x8, [x19]
	ldr	x8, [x8, #40]
	mov	x0, x19
	blr	x8
Ltmp20:
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Ltmp21:
; %bb.11:
	mov	x19, x0
Lloh2:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh3:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	add	x9, sp, #112
	stp	x8, x9, [x0]
	add	x8, sp, #88
	add	x9, sp, #136
	stp	x8, x9, [x0, #16]
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp23:
	mov	x0, x19
	blr	x8
Ltmp24:
; %bb.12:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x20, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x22, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp25:
	mov	x0, x19
	blr	x8
Ltmp26:
; %bb.13:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x23, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x24, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp27:
	mov	x0, x19
	blr	x8
Ltmp28:
; %bb.14:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x25, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x27, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp29:
	mov	x0, x19
	blr	x8
Ltmp30:
; %bb.15:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x28, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x26, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp31:
	mov	x0, x19
	blr	x8
Ltmp32:
; %bb.16:
	sub	x8, x28, x27
	scvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d10, x8
	fdiv	d0, d0, d10
	sub	x8, x25, x24
	scvtf	d1, x8
	fdiv	d1, d1, d10
	sub	x8, x23, x22
	scvtf	d2, x8
	fdiv	d2, d2, d10
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	sub	x8, x20, x8
	scvtf	d3, x8
	fdiv	d3, d3, d10
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d9, x8
	fminnm	d3, d3, d9
	fcmp	d2, d3
	fcsel	d2, d2, d3, mi
	fcmp	d1, d2
	fcsel	d1, d1, d2, mi
	fcmp	d0, d1
	fcsel	d11, d0, d1, mi
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x26
	scvtf	d0, x8
	fdiv	d0, d0, d10
	fcmp	d0, d11
	fcsel	d10, d0, d11, mi
	ldr	x8, [x19]
	ldr	x8, [x8, #40]
	mov	x0, x19
	blr	x8
	ldr	d11, [sp, #136]
Ltmp34:
Lloh4:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh5:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh6:
	adrp	x1, l_.str@PAGE
Lloh7:
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #19                         ; =0x13
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp35:
; %bb.17:
	mov	x19, x0
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fdiv	d8, d8, d0
	fmul	d0, d8, d0
Ltmp36:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp37:
; %bb.18:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp39:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp40:
; %bb.19:
Ltmp41:
Lloh8:
	adrp	x1, l_.str.1@PAGE
Lloh9:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w2, #5                          ; =0x5
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp42:
; %bb.20:
Ltmp44:
	mov	x19, x0
	ucvtf	d0, d11
	fadd	d11, d0, d0
	fmul	d0, d8, d9
	fdiv	d0, d11, d0
	add	x20, sp, #16
	add	x8, sp, #16
	bl	__ZNSt3__19to_stringEd
Ltmp45:
; %bb.21:
	ldrb	w8, [sp, #39]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #16]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp47:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp48:
; %bb.22:
Ltmp49:
Lloh10:
	adrp	x1, l_.str.2@PAGE
Lloh11:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w2, #8                          ; =0x8
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp50:
; %bb.23:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp51:
	sub	x8, x29, #128
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp52:
; %bb.24:
Ltmp53:
Lloh12:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh13:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	sub	x0, x29, #128
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp54:
; %bb.25:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp55:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp56:
; %bb.26:
	mov	x20, x0
	sub	x0, x29, #128
	bl	__ZNSt3__16localeD1Ev
Ltmp58:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp59:
; %bb.27:
Ltmp60:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp61:
; %bb.28:
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB7_170
; %bb.29:
	ldrsb	w8, [sp, #63]
	tbnz	w8, #31, LBB7_171
LBB7_30:
Ltmp63:
Lloh14:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh15:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh16:
	adrp	x1, l_.str.3@PAGE
Lloh17:
	add	x1, x1, l_.str.3@PAGEOFF
	mov	w2, #23                         ; =0x17
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp64:
; %bb.31:
	mov	x19, x0
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fdiv	d10, d10, d0
	fmul	d0, d10, d0
Ltmp65:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp66:
; %bb.32:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp68:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp69:
; %bb.33:
Ltmp70:
Lloh18:
	adrp	x1, l_.str.1@PAGE
Lloh19:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w2, #5                          ; =0x5
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp71:
; %bb.34:
Ltmp73:
	mov	x19, x0
	fmul	d0, d10, d9
	fdiv	d0, d11, d0
	add	x20, sp, #16
	add	x8, sp, #16
	bl	__ZNSt3__19to_stringEd
Ltmp74:
; %bb.35:
	ldrb	w8, [sp, #39]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #16]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp76:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp77:
; %bb.36:
Ltmp78:
Lloh20:
	adrp	x1, l_.str.2@PAGE
Lloh21:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w2, #8                          ; =0x8
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp79:
; %bb.37:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp80:
	sub	x8, x29, #128
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp81:
; %bb.38:
Ltmp82:
Lloh22:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh23:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	sub	x0, x29, #128
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp83:
; %bb.39:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp84:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp85:
; %bb.40:
	mov	x20, x0
	sub	x0, x29, #128
	bl	__ZNSt3__16localeD1Ev
Ltmp87:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp88:
; %bb.41:
Ltmp89:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp90:
; %bb.42:
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB7_172
; %bb.43:
	ldrsb	w8, [sp, #63]
	tbnz	w8, #31, LBB7_173
LBB7_44:
Ltmp92:
Lloh24:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh25:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh26:
	adrp	x1, l_.str.4@PAGE
Lloh27:
	add	x1, x1, l_.str.4@PAGEOFF
	mov	w2, #15                         ; =0xf
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp93:
; %bb.45:
	mov	x19, x0
	fdiv	d0, d8, d10
Ltmp95:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp96:
; %bb.46:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp98:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp99:
; %bb.47:
Ltmp100:
Lloh28:
	adrp	x1, l_.str.5@PAGE
Lloh29:
	add	x1, x1, l_.str.5@PAGEOFF
	mov	w2, #2                          ; =0x2
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp101:
; %bb.48:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp102:
	add	x8, sp, #16
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp103:
; %bb.49:
Ltmp104:
Lloh30:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh31:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #16
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp105:
; %bb.50:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp106:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp107:
; %bb.51:
	mov	x20, x0
	add	x0, sp, #16
	bl	__ZNSt3__16localeD1Ev
Ltmp109:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp110:
; %bb.52:
Ltmp111:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp112:
; %bb.53:
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_55
; %bb.54:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
LBB7_55:
	ldr	x8, [sp, #136]
	cbz	x8, LBB7_58
; %bb.56:
	ldr	x9, [sp, #112]
	ldr	x10, [sp, #88]
	mov	w11, #5009                      ; =0x1391
	movk	w11, #48271, lsl #16
	mov	w12, #44488                     ; =0xadc8
	mov	w13, #48271                     ; =0xbc8f
	mov	w14, #3399                      ; =0xd47
	mov	w15, #2147483647                ; =0x7fffffff
	movi	d0, #0000000000000000
LBB7_57:                                ; =>This Inner Loop Header: Depth=1
	umull	x16, w21, w11
	lsr	x16, x16, #47
	msub	w17, w16, w12, w21
	mul	w17, w17, w13
	mul	w16, w16, w14
	subs	w16, w17, w16
	csel	w17, w15, wzr, lo
	add	w16, w17, w16
	sub	w17, w16, #1
	ucvtf	s1, w17, #31
	fadd	s1, s1, s0
	str	s1, [x9], #4
	umull	x17, w16, w11
	lsr	x17, x17, #47
	msub	w16, w17, w12, w16
	mul	w16, w16, w13
	mul	w17, w17, w14
	subs	w16, w16, w17
	csel	w17, w15, wzr, lo
	add	w21, w17, w16
	sub	w16, w21, #1
	ucvtf	s1, w16, #31
	fadd	s1, s1, s0
	str	s1, [x10], #4
	subs	x8, x8, #1
	b.ne	LBB7_57
LBB7_58:
Ltmp114:
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Ltmp115:
; %bb.59:
	mov	x19, x0
Lloh32:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh33:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	add	x9, sp, #112
	stp	x8, x9, [x0]
	add	x8, sp, #88
	add	x9, sp, #136
	stp	x8, x9, [x0, #16]
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp117:
	mov	x0, x19
	blr	x8
Ltmp118:
; %bb.60:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x20, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x22, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp119:
	mov	x0, x19
	blr	x8
Ltmp120:
; %bb.61:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x23, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x24, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp121:
	mov	x0, x19
	blr	x8
Ltmp122:
; %bb.62:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x25, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x27, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp123:
	mov	x0, x19
	blr	x8
Ltmp124:
; %bb.63:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x28, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x26, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp125:
	mov	x0, x19
	blr	x8
Ltmp126:
; %bb.64:
	sub	x8, x28, x27
	scvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d8, x8
	fdiv	d0, d0, d8
	sub	x8, x25, x24
	scvtf	d1, x8
	fdiv	d1, d1, d8
	sub	x8, x23, x22
	scvtf	d2, x8
	fdiv	d2, d2, d8
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	sub	x8, x20, x8
	scvtf	d3, x8
	fdiv	d3, d3, d8
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d4, x8
	fminnm	d3, d3, d4
	fcmp	d2, d3
	fcsel	d2, d2, d3, mi
	fcmp	d1, d2
	fcsel	d1, d1, d2, mi
	fcmp	d0, d1
	fcsel	d9, d0, d1, mi
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x26
	scvtf	d0, x8
	fdiv	d0, d0, d8
	fcmp	d0, d9
	fcsel	d8, d0, d9, mi
	ldr	x8, [x19]
	ldr	x8, [x8, #40]
	mov	x0, x19
	blr	x8
Ltmp128:
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Ltmp129:
; %bb.65:
	mov	x19, x0
Lloh34:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh35:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	add	x9, sp, #112
	stp	x8, x9, [x0]
	add	x8, sp, #88
	add	x9, sp, #136
	stp	x8, x9, [x0, #16]
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp131:
	mov	x0, x19
	blr	x8
Ltmp132:
; %bb.66:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x20, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x22, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp133:
	mov	x0, x19
	blr	x8
Ltmp134:
; %bb.67:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x23, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x24, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp135:
	mov	x0, x19
	blr	x8
Ltmp136:
; %bb.68:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x25, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x27, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp137:
	mov	x0, x19
	blr	x8
Ltmp138:
; %bb.69:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x28, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x26, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp139:
	mov	x0, x19
	blr	x8
Ltmp140:
; %bb.70:
	sub	x8, x28, x27
	scvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d10, x8
	fdiv	d0, d0, d10
	sub	x8, x25, x24
	scvtf	d1, x8
	fdiv	d1, d1, d10
	sub	x8, x23, x22
	scvtf	d2, x8
	fdiv	d2, d2, d10
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	sub	x8, x20, x8
	scvtf	d3, x8
	fdiv	d3, d3, d10
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d9, x8
	fminnm	d3, d3, d9
	fcmp	d2, d3
	fcsel	d2, d2, d3, mi
	fcmp	d1, d2
	fcsel	d1, d1, d2, mi
	fcmp	d0, d1
	fcsel	d11, d0, d1, mi
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x26
	scvtf	d0, x8
	fdiv	d0, d0, d10
	fcmp	d0, d11
	fcsel	d10, d0, d11, mi
	ldr	x8, [x19]
	ldr	x8, [x8, #40]
	mov	x0, x19
	blr	x8
	ldr	d11, [sp, #136]
Ltmp142:
Lloh36:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh37:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh38:
	adrp	x1, l_.str.6@PAGE
Lloh39:
	add	x1, x1, l_.str.6@PAGEOFF
	mov	w2, #17                         ; =0x11
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp143:
; %bb.71:
	mov	x19, x0
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fdiv	d8, d8, d0
	fmul	d0, d8, d0
Ltmp144:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp145:
; %bb.72:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp147:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp148:
; %bb.73:
Ltmp149:
Lloh40:
	adrp	x1, l_.str.1@PAGE
Lloh41:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w2, #5                          ; =0x5
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp150:
; %bb.74:
Ltmp152:
	mov	x19, x0
	ucvtf	d0, d11
	fadd	d11, d0, d0
	fmul	d0, d8, d9
	fdiv	d0, d11, d0
	add	x20, sp, #16
	add	x8, sp, #16
	bl	__ZNSt3__19to_stringEd
Ltmp153:
; %bb.75:
	ldrb	w8, [sp, #39]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #16]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp155:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp156:
; %bb.76:
Ltmp157:
Lloh42:
	adrp	x1, l_.str.2@PAGE
Lloh43:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w2, #8                          ; =0x8
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp158:
; %bb.77:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp159:
	sub	x8, x29, #128
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp160:
; %bb.78:
Ltmp161:
Lloh44:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh45:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	sub	x0, x29, #128
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp162:
; %bb.79:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp163:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp164:
; %bb.80:
	mov	x20, x0
	sub	x0, x29, #128
	bl	__ZNSt3__16localeD1Ev
Ltmp166:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp167:
; %bb.81:
Ltmp168:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp169:
; %bb.82:
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB7_174
; %bb.83:
	ldrsb	w8, [sp, #63]
	tbnz	w8, #31, LBB7_175
LBB7_84:
Ltmp171:
Lloh46:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh47:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh48:
	adrp	x1, l_.str.7@PAGE
Lloh49:
	add	x1, x1, l_.str.7@PAGEOFF
	mov	w2, #21                         ; =0x15
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp172:
; %bb.85:
	mov	x19, x0
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fdiv	d10, d10, d0
	fmul	d0, d10, d0
Ltmp173:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp174:
; %bb.86:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp176:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp177:
; %bb.87:
Ltmp178:
Lloh50:
	adrp	x1, l_.str.1@PAGE
Lloh51:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w2, #5                          ; =0x5
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp179:
; %bb.88:
Ltmp181:
	mov	x19, x0
	fmul	d0, d10, d9
	fdiv	d0, d11, d0
	add	x20, sp, #16
	add	x8, sp, #16
	bl	__ZNSt3__19to_stringEd
Ltmp182:
; %bb.89:
	ldrb	w8, [sp, #39]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #16]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp184:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp185:
; %bb.90:
Ltmp186:
Lloh52:
	adrp	x1, l_.str.2@PAGE
Lloh53:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w2, #8                          ; =0x8
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp187:
; %bb.91:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp188:
	sub	x8, x29, #128
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp189:
; %bb.92:
Ltmp190:
Lloh54:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh55:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	sub	x0, x29, #128
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp191:
; %bb.93:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp192:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp193:
; %bb.94:
	mov	x20, x0
	sub	x0, x29, #128
	bl	__ZNSt3__16localeD1Ev
Ltmp195:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp196:
; %bb.95:
Ltmp197:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp198:
; %bb.96:
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB7_176
; %bb.97:
	ldrsb	w8, [sp, #63]
	tbnz	w8, #31, LBB7_177
LBB7_98:
Ltmp200:
Lloh56:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh57:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh58:
	adrp	x1, l_.str.8@PAGE
Lloh59:
	add	x1, x1, l_.str.8@PAGEOFF
	mov	w2, #13                         ; =0xd
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp201:
; %bb.99:
	mov	x19, x0
	fdiv	d0, d8, d10
Ltmp203:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp204:
; %bb.100:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp206:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp207:
; %bb.101:
Ltmp208:
Lloh60:
	adrp	x1, l_.str.5@PAGE
Lloh61:
	add	x1, x1, l_.str.5@PAGEOFF
	mov	w2, #2                          ; =0x2
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp209:
; %bb.102:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp210:
	add	x8, sp, #16
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp211:
; %bb.103:
Ltmp212:
Lloh62:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh63:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #16
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp213:
; %bb.104:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp214:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp215:
; %bb.105:
	mov	x20, x0
	add	x0, sp, #16
	bl	__ZNSt3__16localeD1Ev
Ltmp217:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp218:
; %bb.106:
Ltmp219:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp220:
; %bb.107:
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_109
; %bb.108:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
LBB7_109:
	ldr	x8, [sp, #136]
	cbz	x8, LBB7_112
; %bb.110:
	ldr	x9, [sp, #112]
	ldr	x10, [sp, #88]
	mov	w11, #5009                      ; =0x1391
	movk	w11, #48271, lsl #16
	mov	w12, #44488                     ; =0xadc8
	mov	w13, #48271                     ; =0xbc8f
	mov	w14, #3399                      ; =0xd47
	mov	w15, #2147483647                ; =0x7fffffff
	movi	d0, #0000000000000000
LBB7_111:                               ; =>This Inner Loop Header: Depth=1
	umull	x16, w21, w11
	lsr	x16, x16, #47
	msub	w17, w16, w12, w21
	mul	w17, w17, w13
	mul	w16, w16, w14
	subs	w16, w17, w16
	csel	w17, w15, wzr, lo
	add	w16, w17, w16
	sub	w17, w16, #1
	ucvtf	s1, w17, #31
	fadd	s1, s1, s0
	str	s1, [x9], #4
	umull	x17, w16, w11
	lsr	x17, x17, #47
	msub	w16, w17, w12, w16
	mul	w16, w16, w13
	mul	w17, w17, w14
	subs	w16, w16, w17
	csel	w17, w15, wzr, lo
	add	w21, w17, w16
	sub	w16, w21, #1
	ucvtf	s1, w16, #31
	fadd	s1, s1, s0
	str	s1, [x10], #4
	subs	x8, x8, #1
	b.ne	LBB7_111
LBB7_112:
Ltmp222:
	mov	w0, #40                         ; =0x28
	bl	__Znwm
Ltmp223:
; %bb.113:
	mov	x19, x0
Lloh64:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh65:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	add	x9, sp, #112
	stp	x8, x9, [x0]
	add	x8, sp, #88
	add	x9, sp, #64
	stp	x8, x9, [x0, #16]
	add	x8, sp, #136
	str	x8, [x0, #32]
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x20, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp225:
	mov	x0, x19
	blr	x8
Ltmp226:
; %bb.114:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x21, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x22, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp227:
	mov	x0, x19
	blr	x8
Ltmp228:
; %bb.115:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x23, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x24, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp229:
	mov	x0, x19
	blr	x8
Ltmp230:
; %bb.116:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x25, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x27, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp231:
	mov	x0, x19
	blr	x8
Ltmp232:
; %bb.117:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x28, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x26, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp233:
	mov	x0, x19
	blr	x8
Ltmp234:
; %bb.118:
	sub	x8, x28, x27
	scvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d8, x8
	fdiv	d0, d0, d8
	sub	x8, x25, x24
	scvtf	d1, x8
	fdiv	d1, d1, d8
	sub	x8, x23, x22
	scvtf	d2, x8
	fdiv	d2, d2, d8
	sub	x8, x21, x20
	scvtf	d3, x8
	fdiv	d3, d3, d8
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d4, x8
	fminnm	d3, d3, d4
	fcmp	d2, d3
	fcsel	d2, d2, d3, mi
	fcmp	d1, d2
	fcsel	d1, d1, d2, mi
	fcmp	d0, d1
	fcsel	d9, d0, d1, mi
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x26
	scvtf	d0, x8
	fdiv	d0, d0, d8
	fcmp	d0, d9
	fcsel	d8, d0, d9, mi
	ldr	x8, [x19]
	ldr	x8, [x8, #40]
	mov	x0, x19
	blr	x8
Ltmp236:
	mov	w0, #40                         ; =0x28
	bl	__Znwm
Ltmp237:
; %bb.119:
	mov	x19, x0
Lloh66:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh67:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	add	x9, sp, #112
	stp	x8, x9, [x0]
	add	x8, sp, #88
	add	x9, sp, #64
	stp	x8, x9, [x0, #16]
	add	x8, sp, #136
	str	x8, [x0, #32]
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x20, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp239:
	mov	x0, x19
	blr	x8
Ltmp240:
; %bb.120:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x21, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x22, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp241:
	mov	x0, x19
	blr	x8
Ltmp242:
; %bb.121:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x23, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x24, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp243:
	mov	x0, x19
	blr	x8
Ltmp244:
; %bb.122:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x25, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x27, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp245:
	mov	x0, x19
	blr	x8
Ltmp246:
; %bb.123:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x28, x0
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	mov	x26, x0
	ldr	x8, [x19]
	ldr	x8, [x8, #48]
Ltmp247:
	mov	x0, x19
	blr	x8
Ltmp248:
; %bb.124:
	sub	x8, x28, x27
	scvtf	d0, x8
	mov	x8, #145685290680320            ; =0x848000000000
	movk	x8, #16686, lsl #48
	fmov	d10, x8
	fdiv	d0, d0, d10
	sub	x8, x25, x24
	scvtf	d1, x8
	fdiv	d1, d1, d10
	sub	x8, x23, x22
	scvtf	d2, x8
	fdiv	d2, d2, d10
	sub	x8, x21, x20
	scvtf	d3, x8
	fdiv	d3, d3, d10
	mov	x8, #225833675390976            ; =0xcd6500000000
	movk	x8, #16845, lsl #48
	fmov	d9, x8
	fminnm	d3, d3, d9
	fcmp	d2, d3
	fcsel	d2, d2, d3, mi
	fcmp	d1, d2
	fcsel	d1, d1, d2, mi
	fcmp	d0, d1
	fcsel	d11, d0, d1, mi
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	sub	x8, x0, x26
	scvtf	d0, x8
	fdiv	d0, d0, d10
	fcmp	d0, d11
	fcsel	d10, d0, d11, mi
	ldr	x8, [x19]
	ldr	x8, [x8, #40]
	mov	x0, x19
	blr	x8
	ldr	d11, [sp, #136]
Ltmp250:
Lloh68:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh69:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh70:
	adrp	x1, l_.str.9@PAGE
Lloh71:
	add	x1, x1, l_.str.9@PAGEOFF
	mov	w2, #25                         ; =0x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp251:
; %bb.125:
	mov	x19, x0
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fdiv	d8, d8, d0
	fmul	d0, d8, d0
Ltmp252:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp253:
; %bb.126:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp255:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp256:
; %bb.127:
Ltmp257:
Lloh72:
	adrp	x1, l_.str.1@PAGE
Lloh73:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w2, #5                          ; =0x5
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp258:
; %bb.128:
Ltmp260:
	mov	x19, x0
	ucvtf	d11, d11
	fmul	d0, d8, d9
	fdiv	d0, d11, d0
	add	x20, sp, #16
	add	x8, sp, #16
	bl	__ZNSt3__19to_stringEd
Ltmp261:
; %bb.129:
	ldrb	w8, [sp, #39]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #16]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp263:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp264:
; %bb.130:
Ltmp265:
Lloh74:
	adrp	x1, l_.str.2@PAGE
Lloh75:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w2, #8                          ; =0x8
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp266:
; %bb.131:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp267:
	sub	x8, x29, #128
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp268:
; %bb.132:
Ltmp269:
Lloh76:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh77:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	sub	x0, x29, #128
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp270:
; %bb.133:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp271:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp272:
; %bb.134:
	mov	x20, x0
	sub	x0, x29, #128
	bl	__ZNSt3__16localeD1Ev
Ltmp274:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp275:
; %bb.135:
Ltmp276:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp277:
; %bb.136:
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB7_178
; %bb.137:
	ldrsb	w8, [sp, #63]
	tbnz	w8, #31, LBB7_179
LBB7_138:
Ltmp279:
Lloh78:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh79:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh80:
	adrp	x1, l_.str.10@PAGE
Lloh81:
	add	x1, x1, l_.str.10@PAGEOFF
	mov	w2, #29                         ; =0x1d
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp280:
; %bb.139:
	mov	x19, x0
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16527, lsl #48
	fmov	d0, x8
	fdiv	d10, d10, d0
	fmul	d0, d10, d0
Ltmp281:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp282:
; %bb.140:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp284:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp285:
; %bb.141:
Ltmp286:
Lloh82:
	adrp	x1, l_.str.1@PAGE
Lloh83:
	add	x1, x1, l_.str.1@PAGEOFF
	mov	w2, #5                          ; =0x5
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp287:
; %bb.142:
Ltmp289:
	mov	x19, x0
	fmul	d0, d10, d9
	fdiv	d0, d11, d0
	add	x20, sp, #16
	add	x8, sp, #16
	bl	__ZNSt3__19to_stringEd
Ltmp290:
; %bb.143:
	ldrb	w8, [sp, #39]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #16]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp292:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp293:
; %bb.144:
Ltmp294:
Lloh84:
	adrp	x1, l_.str.2@PAGE
Lloh85:
	add	x1, x1, l_.str.2@PAGEOFF
	mov	w2, #8                          ; =0x8
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp295:
; %bb.145:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp296:
	sub	x8, x29, #128
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp297:
; %bb.146:
Ltmp298:
Lloh86:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh87:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	sub	x0, x29, #128
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp299:
; %bb.147:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp300:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp301:
; %bb.148:
	mov	x20, x0
	sub	x0, x29, #128
	bl	__ZNSt3__16localeD1Ev
Ltmp303:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp304:
; %bb.149:
Ltmp305:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp306:
; %bb.150:
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB7_180
; %bb.151:
	ldrsb	w8, [sp, #63]
	tbnz	w8, #31, LBB7_181
LBB7_152:
Ltmp308:
Lloh88:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh89:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh90:
	adrp	x1, l_.str.11@PAGE
Lloh91:
	add	x1, x1, l_.str.11@PAGEOFF
	mov	w2, #21                         ; =0x15
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp309:
; %bb.153:
	mov	x19, x0
	fdiv	d0, d8, d10
Ltmp311:
	add	x20, sp, #40
	add	x8, sp, #40
	bl	__ZNSt3__19to_stringEd
Ltmp312:
; %bb.154:
	ldrb	w8, [sp, #63]
	sxtb	w9, w8
	ldp	x10, x11, [sp, #40]
	cmp	w9, #0
	csel	x1, x10, x20, lt
	csel	x2, x11, x8, lt
Ltmp314:
	mov	x0, x19
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp315:
; %bb.155:
Ltmp316:
Lloh92:
	adrp	x1, l_.str.5@PAGE
Lloh93:
	add	x1, x1, l_.str.5@PAGEOFF
	mov	w2, #2                          ; =0x2
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp317:
; %bb.156:
	mov	x19, x0
	ldr	x8, [x0]
	ldur	x9, [x8, #-24]
Ltmp318:
	add	x8, sp, #16
	add	x0, x0, x9
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp319:
; %bb.157:
Ltmp320:
Lloh94:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh95:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #16
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp321:
; %bb.158:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp322:
	mov	w1, #10                         ; =0xa
	blr	x8
Ltmp323:
; %bb.159:
	mov	x20, x0
	add	x0, sp, #16
	bl	__ZNSt3__16localeD1Ev
Ltmp325:
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp326:
; %bb.160:
Ltmp327:
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp328:
; %bb.161:
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_163
; %bb.162:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
LBB7_163:
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_165
; %bb.164:
	str	x0, [sp, #72]
	bl	__ZdlPv
LBB7_165:
	ldr	x0, [sp, #88]
	cbz	x0, LBB7_167
; %bb.166:
	str	x0, [sp, #96]
	bl	__ZdlPv
LBB7_167:
	ldr	x0, [sp, #112]
	cbz	x0, LBB7_169
; %bb.168:
	str	x0, [sp, #120]
	bl	__ZdlPv
LBB7_169:
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #256]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #240]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #224]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #208]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #192]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #176]              ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #160]            ; 16-byte Folded Reload
	add	sp, sp, #288
	ret
LBB7_170:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_30
LBB7_171:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	b	LBB7_30
LBB7_172:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_44
LBB7_173:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	b	LBB7_44
LBB7_174:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_84
LBB7_175:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	b	LBB7_84
LBB7_176:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_98
LBB7_177:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	b	LBB7_98
LBB7_178:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_138
LBB7_179:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	b	LBB7_138
LBB7_180:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_152
LBB7_181:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	b	LBB7_152
LBB7_182:
Ltmp313:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_183:
Ltmp291:
	b	LBB7_236
LBB7_184:
Ltmp283:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_185:
Ltmp262:
	b	LBB7_236
LBB7_186:
Ltmp254:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_187:
Ltmp238:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_188:
Ltmp224:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_189:
Ltmp205:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_190:
Ltmp183:
	b	LBB7_236
LBB7_191:
Ltmp175:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_192:
Ltmp154:
	b	LBB7_236
LBB7_193:
Ltmp146:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_194:
Ltmp130:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_195:
Ltmp116:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_196:
Ltmp97:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_197:
Ltmp75:
	b	LBB7_236
LBB7_198:
Ltmp67:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_199:
Ltmp46:
	b	LBB7_236
LBB7_200:
Ltmp38:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_201:
Ltmp22:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_202:
Ltmp8:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_203:
Ltmp5:
	mov	x19, x0
	ldr	x0, [sp, #88]
	cbz	x0, LBB7_244
	b	LBB7_252
LBB7_204:
Ltmp2:
	mov	x19, x0
	ldr	x0, [sp, #112]
	cbz	x0, LBB7_245
	b	LBB7_253
LBB7_205:
Ltmp324:
	b	LBB7_216
LBB7_206:
Ltmp302:
	b	LBB7_220
LBB7_207:
Ltmp288:
	b	LBB7_236
LBB7_208:
Ltmp273:
	b	LBB7_220
LBB7_209:
Ltmp259:
	b	LBB7_236
LBB7_210:
Ltmp216:
	b	LBB7_216
LBB7_211:
Ltmp194:
	b	LBB7_220
LBB7_212:
Ltmp180:
	b	LBB7_236
LBB7_213:
Ltmp165:
	b	LBB7_220
LBB7_214:
Ltmp151:
	b	LBB7_236
LBB7_215:
Ltmp108:
LBB7_216:
	mov	x19, x0
	add	x0, sp, #16
	bl	__ZNSt3__16localeD1Ev
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_242
	b	LBB7_247
LBB7_217:
Ltmp86:
	b	LBB7_220
LBB7_218:
Ltmp72:
	b	LBB7_236
LBB7_219:
Ltmp57:
LBB7_220:
	mov	x19, x0
	sub	x0, x29, #128
	bl	__ZNSt3__16localeD1Ev
	b	LBB7_240
LBB7_221:
Ltmp43:
	b	LBB7_236
LBB7_222:
Ltmp310:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_223:
Ltmp202:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_224:
Ltmp94:
	mov	x19, x0
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_225:
Ltmp329:
	b	LBB7_236
LBB7_226:
Ltmp307:
	b	LBB7_239
LBB7_227:
Ltmp278:
	b	LBB7_239
LBB7_228:
Ltmp249:
	b	LBB7_250
LBB7_229:
Ltmp235:
	b	LBB7_250
LBB7_230:
Ltmp221:
	b	LBB7_236
LBB7_231:
Ltmp199:
	b	LBB7_239
LBB7_232:
Ltmp170:
	b	LBB7_239
LBB7_233:
Ltmp141:
	b	LBB7_250
LBB7_234:
Ltmp127:
	b	LBB7_250
LBB7_235:
Ltmp113:
LBB7_236:
	mov	x19, x0
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_242
	b	LBB7_247
LBB7_237:
Ltmp91:
	b	LBB7_239
LBB7_238:
Ltmp62:
LBB7_239:
	mov	x19, x0
LBB7_240:
	ldrsb	w8, [sp, #39]
	tbnz	w8, #31, LBB7_246
; %bb.241:
	ldrsb	w8, [sp, #63]
	tbnz	w8, #31, LBB7_247
LBB7_242:
	ldr	x0, [sp, #64]
	cbnz	x0, LBB7_251
LBB7_243:
	ldr	x0, [sp, #88]
	cbnz	x0, LBB7_252
LBB7_244:
	ldr	x0, [sp, #112]
	cbnz	x0, LBB7_253
LBB7_245:
	mov	x0, x19
	bl	__Unwind_Resume
LBB7_246:
	ldr	x0, [sp, #16]
	bl	__ZdlPv
	ldrsb	w8, [sp, #63]
	tbz	w8, #31, LBB7_242
LBB7_247:
	ldr	x0, [sp, #40]
	bl	__ZdlPv
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
	b	LBB7_251
LBB7_248:
Ltmp33:
	b	LBB7_250
LBB7_249:
Ltmp19:
LBB7_250:
	mov	x8, x19
	mov	x19, x0
	ldr	x9, [x8]
	ldr	x9, [x9, #40]
	mov	x0, x8
	blr	x9
	ldr	x0, [sp, #64]
	cbz	x0, LBB7_243
LBB7_251:
	str	x0, [sp, #72]
	bl	__ZdlPv
	ldr	x0, [sp, #88]
	cbz	x0, LBB7_244
LBB7_252:
	str	x0, [sp, #96]
	bl	__ZdlPv
	ldr	x0, [sp, #112]
	cbz	x0, LBB7_245
LBB7_253:
	str	x0, [sp, #120]
	bl	__ZdlPv
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpLdrGot	Lloh4, Lloh5
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpLdrGot	Lloh12, Lloh13
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdrGot	Lloh14, Lloh15
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpLdrGot	Lloh22, Lloh23
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpLdrGot	Lloh24, Lloh25
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpLdrGot	Lloh30, Lloh31
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh34, Lloh35
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpLdrGot	Lloh36, Lloh37
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpLdrGot	Lloh44, Lloh45
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpLdrGot	Lloh46, Lloh47
	.loh AdrpAdd	Lloh50, Lloh51
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpLdrGot	Lloh54, Lloh55
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpLdrGot	Lloh56, Lloh57
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpLdrGot	Lloh62, Lloh63
	.loh AdrpAdd	Lloh64, Lloh65
	.loh AdrpAdd	Lloh66, Lloh67
	.loh AdrpAdd	Lloh70, Lloh71
	.loh AdrpLdrGot	Lloh68, Lloh69
	.loh AdrpAdd	Lloh72, Lloh73
	.loh AdrpAdd	Lloh74, Lloh75
	.loh AdrpLdrGot	Lloh76, Lloh77
	.loh AdrpAdd	Lloh80, Lloh81
	.loh AdrpLdrGot	Lloh78, Lloh79
	.loh AdrpAdd	Lloh82, Lloh83
	.loh AdrpAdd	Lloh84, Lloh85
	.loh AdrpLdrGot	Lloh86, Lloh87
	.loh AdrpAdd	Lloh90, Lloh91
	.loh AdrpLdrGot	Lloh88, Lloh89
	.loh AdrpAdd	Lloh92, Lloh93
	.loh AdrpLdrGot	Lloh94, Lloh95
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table7:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp3-Ltmp1                    ;   Call between Ltmp1 and Ltmp3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0             ; >> Call Site 4 <<
	.uleb128 Ltmp4-Ltmp3                    ;   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0             ;     jumps to Ltmp5
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp4-Lfunc_begin0             ; >> Call Site 5 <<
	.uleb128 Ltmp6-Ltmp4                    ;   Call between Ltmp4 and Ltmp6
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0             ; >> Call Site 6 <<
	.uleb128 Ltmp7-Ltmp6                    ;   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin0             ;     jumps to Ltmp8
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp9-Lfunc_begin0             ; >> Call Site 7 <<
	.uleb128 Ltmp18-Ltmp9                   ;   Call between Ltmp9 and Ltmp18
	.uleb128 Ltmp19-Lfunc_begin0            ;     jumps to Ltmp19
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp18-Lfunc_begin0            ; >> Call Site 8 <<
	.uleb128 Ltmp20-Ltmp18                  ;   Call between Ltmp18 and Ltmp20
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp20-Lfunc_begin0            ; >> Call Site 9 <<
	.uleb128 Ltmp21-Ltmp20                  ;   Call between Ltmp20 and Ltmp21
	.uleb128 Ltmp22-Lfunc_begin0            ;     jumps to Ltmp22
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp23-Lfunc_begin0            ; >> Call Site 10 <<
	.uleb128 Ltmp32-Ltmp23                  ;   Call between Ltmp23 and Ltmp32
	.uleb128 Ltmp33-Lfunc_begin0            ;     jumps to Ltmp33
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp32-Lfunc_begin0            ; >> Call Site 11 <<
	.uleb128 Ltmp34-Ltmp32                  ;   Call between Ltmp32 and Ltmp34
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp34-Lfunc_begin0            ; >> Call Site 12 <<
	.uleb128 Ltmp35-Ltmp34                  ;   Call between Ltmp34 and Ltmp35
	.uleb128 Ltmp94-Lfunc_begin0            ;     jumps to Ltmp94
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp36-Lfunc_begin0            ; >> Call Site 13 <<
	.uleb128 Ltmp37-Ltmp36                  ;   Call between Ltmp36 and Ltmp37
	.uleb128 Ltmp38-Lfunc_begin0            ;     jumps to Ltmp38
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp39-Lfunc_begin0            ; >> Call Site 14 <<
	.uleb128 Ltmp42-Ltmp39                  ;   Call between Ltmp39 and Ltmp42
	.uleb128 Ltmp43-Lfunc_begin0            ;     jumps to Ltmp43
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp44-Lfunc_begin0            ; >> Call Site 15 <<
	.uleb128 Ltmp45-Ltmp44                  ;   Call between Ltmp44 and Ltmp45
	.uleb128 Ltmp46-Lfunc_begin0            ;     jumps to Ltmp46
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp47-Lfunc_begin0            ; >> Call Site 16 <<
	.uleb128 Ltmp52-Ltmp47                  ;   Call between Ltmp47 and Ltmp52
	.uleb128 Ltmp62-Lfunc_begin0            ;     jumps to Ltmp62
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp53-Lfunc_begin0            ; >> Call Site 17 <<
	.uleb128 Ltmp56-Ltmp53                  ;   Call between Ltmp53 and Ltmp56
	.uleb128 Ltmp57-Lfunc_begin0            ;     jumps to Ltmp57
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp58-Lfunc_begin0            ; >> Call Site 18 <<
	.uleb128 Ltmp61-Ltmp58                  ;   Call between Ltmp58 and Ltmp61
	.uleb128 Ltmp62-Lfunc_begin0            ;     jumps to Ltmp62
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp63-Lfunc_begin0            ; >> Call Site 19 <<
	.uleb128 Ltmp64-Ltmp63                  ;   Call between Ltmp63 and Ltmp64
	.uleb128 Ltmp94-Lfunc_begin0            ;     jumps to Ltmp94
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp65-Lfunc_begin0            ; >> Call Site 20 <<
	.uleb128 Ltmp66-Ltmp65                  ;   Call between Ltmp65 and Ltmp66
	.uleb128 Ltmp67-Lfunc_begin0            ;     jumps to Ltmp67
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp68-Lfunc_begin0            ; >> Call Site 21 <<
	.uleb128 Ltmp71-Ltmp68                  ;   Call between Ltmp68 and Ltmp71
	.uleb128 Ltmp72-Lfunc_begin0            ;     jumps to Ltmp72
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp73-Lfunc_begin0            ; >> Call Site 22 <<
	.uleb128 Ltmp74-Ltmp73                  ;   Call between Ltmp73 and Ltmp74
	.uleb128 Ltmp75-Lfunc_begin0            ;     jumps to Ltmp75
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp76-Lfunc_begin0            ; >> Call Site 23 <<
	.uleb128 Ltmp81-Ltmp76                  ;   Call between Ltmp76 and Ltmp81
	.uleb128 Ltmp91-Lfunc_begin0            ;     jumps to Ltmp91
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp82-Lfunc_begin0            ; >> Call Site 24 <<
	.uleb128 Ltmp85-Ltmp82                  ;   Call between Ltmp82 and Ltmp85
	.uleb128 Ltmp86-Lfunc_begin0            ;     jumps to Ltmp86
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp87-Lfunc_begin0            ; >> Call Site 25 <<
	.uleb128 Ltmp90-Ltmp87                  ;   Call between Ltmp87 and Ltmp90
	.uleb128 Ltmp91-Lfunc_begin0            ;     jumps to Ltmp91
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp92-Lfunc_begin0            ; >> Call Site 26 <<
	.uleb128 Ltmp93-Ltmp92                  ;   Call between Ltmp92 and Ltmp93
	.uleb128 Ltmp94-Lfunc_begin0            ;     jumps to Ltmp94
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp95-Lfunc_begin0            ; >> Call Site 27 <<
	.uleb128 Ltmp96-Ltmp95                  ;   Call between Ltmp95 and Ltmp96
	.uleb128 Ltmp97-Lfunc_begin0            ;     jumps to Ltmp97
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp98-Lfunc_begin0            ; >> Call Site 28 <<
	.uleb128 Ltmp103-Ltmp98                 ;   Call between Ltmp98 and Ltmp103
	.uleb128 Ltmp113-Lfunc_begin0           ;     jumps to Ltmp113
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp104-Lfunc_begin0           ; >> Call Site 29 <<
	.uleb128 Ltmp107-Ltmp104                ;   Call between Ltmp104 and Ltmp107
	.uleb128 Ltmp108-Lfunc_begin0           ;     jumps to Ltmp108
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp109-Lfunc_begin0           ; >> Call Site 30 <<
	.uleb128 Ltmp112-Ltmp109                ;   Call between Ltmp109 and Ltmp112
	.uleb128 Ltmp113-Lfunc_begin0           ;     jumps to Ltmp113
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp114-Lfunc_begin0           ; >> Call Site 31 <<
	.uleb128 Ltmp115-Ltmp114                ;   Call between Ltmp114 and Ltmp115
	.uleb128 Ltmp116-Lfunc_begin0           ;     jumps to Ltmp116
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp117-Lfunc_begin0           ; >> Call Site 32 <<
	.uleb128 Ltmp126-Ltmp117                ;   Call between Ltmp117 and Ltmp126
	.uleb128 Ltmp127-Lfunc_begin0           ;     jumps to Ltmp127
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp126-Lfunc_begin0           ; >> Call Site 33 <<
	.uleb128 Ltmp128-Ltmp126                ;   Call between Ltmp126 and Ltmp128
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp128-Lfunc_begin0           ; >> Call Site 34 <<
	.uleb128 Ltmp129-Ltmp128                ;   Call between Ltmp128 and Ltmp129
	.uleb128 Ltmp130-Lfunc_begin0           ;     jumps to Ltmp130
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp131-Lfunc_begin0           ; >> Call Site 35 <<
	.uleb128 Ltmp140-Ltmp131                ;   Call between Ltmp131 and Ltmp140
	.uleb128 Ltmp141-Lfunc_begin0           ;     jumps to Ltmp141
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp140-Lfunc_begin0           ; >> Call Site 36 <<
	.uleb128 Ltmp142-Ltmp140                ;   Call between Ltmp140 and Ltmp142
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp142-Lfunc_begin0           ; >> Call Site 37 <<
	.uleb128 Ltmp143-Ltmp142                ;   Call between Ltmp142 and Ltmp143
	.uleb128 Ltmp202-Lfunc_begin0           ;     jumps to Ltmp202
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp144-Lfunc_begin0           ; >> Call Site 38 <<
	.uleb128 Ltmp145-Ltmp144                ;   Call between Ltmp144 and Ltmp145
	.uleb128 Ltmp146-Lfunc_begin0           ;     jumps to Ltmp146
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp147-Lfunc_begin0           ; >> Call Site 39 <<
	.uleb128 Ltmp150-Ltmp147                ;   Call between Ltmp147 and Ltmp150
	.uleb128 Ltmp151-Lfunc_begin0           ;     jumps to Ltmp151
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp152-Lfunc_begin0           ; >> Call Site 40 <<
	.uleb128 Ltmp153-Ltmp152                ;   Call between Ltmp152 and Ltmp153
	.uleb128 Ltmp154-Lfunc_begin0           ;     jumps to Ltmp154
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp155-Lfunc_begin0           ; >> Call Site 41 <<
	.uleb128 Ltmp160-Ltmp155                ;   Call between Ltmp155 and Ltmp160
	.uleb128 Ltmp170-Lfunc_begin0           ;     jumps to Ltmp170
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp161-Lfunc_begin0           ; >> Call Site 42 <<
	.uleb128 Ltmp164-Ltmp161                ;   Call between Ltmp161 and Ltmp164
	.uleb128 Ltmp165-Lfunc_begin0           ;     jumps to Ltmp165
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp166-Lfunc_begin0           ; >> Call Site 43 <<
	.uleb128 Ltmp169-Ltmp166                ;   Call between Ltmp166 and Ltmp169
	.uleb128 Ltmp170-Lfunc_begin0           ;     jumps to Ltmp170
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp171-Lfunc_begin0           ; >> Call Site 44 <<
	.uleb128 Ltmp172-Ltmp171                ;   Call between Ltmp171 and Ltmp172
	.uleb128 Ltmp202-Lfunc_begin0           ;     jumps to Ltmp202
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp173-Lfunc_begin0           ; >> Call Site 45 <<
	.uleb128 Ltmp174-Ltmp173                ;   Call between Ltmp173 and Ltmp174
	.uleb128 Ltmp175-Lfunc_begin0           ;     jumps to Ltmp175
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp176-Lfunc_begin0           ; >> Call Site 46 <<
	.uleb128 Ltmp179-Ltmp176                ;   Call between Ltmp176 and Ltmp179
	.uleb128 Ltmp180-Lfunc_begin0           ;     jumps to Ltmp180
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp181-Lfunc_begin0           ; >> Call Site 47 <<
	.uleb128 Ltmp182-Ltmp181                ;   Call between Ltmp181 and Ltmp182
	.uleb128 Ltmp183-Lfunc_begin0           ;     jumps to Ltmp183
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp184-Lfunc_begin0           ; >> Call Site 48 <<
	.uleb128 Ltmp189-Ltmp184                ;   Call between Ltmp184 and Ltmp189
	.uleb128 Ltmp199-Lfunc_begin0           ;     jumps to Ltmp199
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp190-Lfunc_begin0           ; >> Call Site 49 <<
	.uleb128 Ltmp193-Ltmp190                ;   Call between Ltmp190 and Ltmp193
	.uleb128 Ltmp194-Lfunc_begin0           ;     jumps to Ltmp194
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp195-Lfunc_begin0           ; >> Call Site 50 <<
	.uleb128 Ltmp198-Ltmp195                ;   Call between Ltmp195 and Ltmp198
	.uleb128 Ltmp199-Lfunc_begin0           ;     jumps to Ltmp199
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp200-Lfunc_begin0           ; >> Call Site 51 <<
	.uleb128 Ltmp201-Ltmp200                ;   Call between Ltmp200 and Ltmp201
	.uleb128 Ltmp202-Lfunc_begin0           ;     jumps to Ltmp202
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp203-Lfunc_begin0           ; >> Call Site 52 <<
	.uleb128 Ltmp204-Ltmp203                ;   Call between Ltmp203 and Ltmp204
	.uleb128 Ltmp205-Lfunc_begin0           ;     jumps to Ltmp205
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp206-Lfunc_begin0           ; >> Call Site 53 <<
	.uleb128 Ltmp211-Ltmp206                ;   Call between Ltmp206 and Ltmp211
	.uleb128 Ltmp221-Lfunc_begin0           ;     jumps to Ltmp221
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp212-Lfunc_begin0           ; >> Call Site 54 <<
	.uleb128 Ltmp215-Ltmp212                ;   Call between Ltmp212 and Ltmp215
	.uleb128 Ltmp216-Lfunc_begin0           ;     jumps to Ltmp216
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp217-Lfunc_begin0           ; >> Call Site 55 <<
	.uleb128 Ltmp220-Ltmp217                ;   Call between Ltmp217 and Ltmp220
	.uleb128 Ltmp221-Lfunc_begin0           ;     jumps to Ltmp221
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp222-Lfunc_begin0           ; >> Call Site 56 <<
	.uleb128 Ltmp223-Ltmp222                ;   Call between Ltmp222 and Ltmp223
	.uleb128 Ltmp224-Lfunc_begin0           ;     jumps to Ltmp224
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp225-Lfunc_begin0           ; >> Call Site 57 <<
	.uleb128 Ltmp234-Ltmp225                ;   Call between Ltmp225 and Ltmp234
	.uleb128 Ltmp235-Lfunc_begin0           ;     jumps to Ltmp235
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp234-Lfunc_begin0           ; >> Call Site 58 <<
	.uleb128 Ltmp236-Ltmp234                ;   Call between Ltmp234 and Ltmp236
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp236-Lfunc_begin0           ; >> Call Site 59 <<
	.uleb128 Ltmp237-Ltmp236                ;   Call between Ltmp236 and Ltmp237
	.uleb128 Ltmp238-Lfunc_begin0           ;     jumps to Ltmp238
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp239-Lfunc_begin0           ; >> Call Site 60 <<
	.uleb128 Ltmp248-Ltmp239                ;   Call between Ltmp239 and Ltmp248
	.uleb128 Ltmp249-Lfunc_begin0           ;     jumps to Ltmp249
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp248-Lfunc_begin0           ; >> Call Site 61 <<
	.uleb128 Ltmp250-Ltmp248                ;   Call between Ltmp248 and Ltmp250
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp250-Lfunc_begin0           ; >> Call Site 62 <<
	.uleb128 Ltmp251-Ltmp250                ;   Call between Ltmp250 and Ltmp251
	.uleb128 Ltmp310-Lfunc_begin0           ;     jumps to Ltmp310
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp252-Lfunc_begin0           ; >> Call Site 63 <<
	.uleb128 Ltmp253-Ltmp252                ;   Call between Ltmp252 and Ltmp253
	.uleb128 Ltmp254-Lfunc_begin0           ;     jumps to Ltmp254
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp255-Lfunc_begin0           ; >> Call Site 64 <<
	.uleb128 Ltmp258-Ltmp255                ;   Call between Ltmp255 and Ltmp258
	.uleb128 Ltmp259-Lfunc_begin0           ;     jumps to Ltmp259
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp260-Lfunc_begin0           ; >> Call Site 65 <<
	.uleb128 Ltmp261-Ltmp260                ;   Call between Ltmp260 and Ltmp261
	.uleb128 Ltmp262-Lfunc_begin0           ;     jumps to Ltmp262
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp263-Lfunc_begin0           ; >> Call Site 66 <<
	.uleb128 Ltmp268-Ltmp263                ;   Call between Ltmp263 and Ltmp268
	.uleb128 Ltmp278-Lfunc_begin0           ;     jumps to Ltmp278
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp269-Lfunc_begin0           ; >> Call Site 67 <<
	.uleb128 Ltmp272-Ltmp269                ;   Call between Ltmp269 and Ltmp272
	.uleb128 Ltmp273-Lfunc_begin0           ;     jumps to Ltmp273
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp274-Lfunc_begin0           ; >> Call Site 68 <<
	.uleb128 Ltmp277-Ltmp274                ;   Call between Ltmp274 and Ltmp277
	.uleb128 Ltmp278-Lfunc_begin0           ;     jumps to Ltmp278
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp279-Lfunc_begin0           ; >> Call Site 69 <<
	.uleb128 Ltmp280-Ltmp279                ;   Call between Ltmp279 and Ltmp280
	.uleb128 Ltmp310-Lfunc_begin0           ;     jumps to Ltmp310
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp281-Lfunc_begin0           ; >> Call Site 70 <<
	.uleb128 Ltmp282-Ltmp281                ;   Call between Ltmp281 and Ltmp282
	.uleb128 Ltmp283-Lfunc_begin0           ;     jumps to Ltmp283
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp284-Lfunc_begin0           ; >> Call Site 71 <<
	.uleb128 Ltmp287-Ltmp284                ;   Call between Ltmp284 and Ltmp287
	.uleb128 Ltmp288-Lfunc_begin0           ;     jumps to Ltmp288
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp289-Lfunc_begin0           ; >> Call Site 72 <<
	.uleb128 Ltmp290-Ltmp289                ;   Call between Ltmp289 and Ltmp290
	.uleb128 Ltmp291-Lfunc_begin0           ;     jumps to Ltmp291
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp292-Lfunc_begin0           ; >> Call Site 73 <<
	.uleb128 Ltmp297-Ltmp292                ;   Call between Ltmp292 and Ltmp297
	.uleb128 Ltmp307-Lfunc_begin0           ;     jumps to Ltmp307
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp298-Lfunc_begin0           ; >> Call Site 74 <<
	.uleb128 Ltmp301-Ltmp298                ;   Call between Ltmp298 and Ltmp301
	.uleb128 Ltmp302-Lfunc_begin0           ;     jumps to Ltmp302
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp303-Lfunc_begin0           ; >> Call Site 75 <<
	.uleb128 Ltmp306-Ltmp303                ;   Call between Ltmp303 and Ltmp306
	.uleb128 Ltmp307-Lfunc_begin0           ;     jumps to Ltmp307
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp308-Lfunc_begin0           ; >> Call Site 76 <<
	.uleb128 Ltmp309-Ltmp308                ;   Call between Ltmp308 and Ltmp309
	.uleb128 Ltmp310-Lfunc_begin0           ;     jumps to Ltmp310
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp311-Lfunc_begin0           ; >> Call Site 77 <<
	.uleb128 Ltmp312-Ltmp311                ;   Call between Ltmp311 and Ltmp312
	.uleb128 Ltmp313-Lfunc_begin0           ;     jumps to Ltmp313
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp314-Lfunc_begin0           ; >> Call Site 78 <<
	.uleb128 Ltmp319-Ltmp314                ;   Call between Ltmp314 and Ltmp319
	.uleb128 Ltmp329-Lfunc_begin0           ;     jumps to Ltmp329
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp320-Lfunc_begin0           ; >> Call Site 79 <<
	.uleb128 Ltmp323-Ltmp320                ;   Call between Ltmp320 and Ltmp323
	.uleb128 Ltmp324-Lfunc_begin0           ;     jumps to Ltmp324
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp325-Lfunc_begin0           ; >> Call Site 80 <<
	.uleb128 Ltmp328-Ltmp325                ;   Call between Ltmp325 and Ltmp328
	.uleb128 Ltmp329-Lfunc_begin0           ;     jumps to Ltmp329
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp328-Lfunc_begin0           ; >> Call Site 81 <<
	.uleb128 Lfunc_end0-Ltmp328             ;   Call between Ltmp328 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__125__throw_bad_function_callB8ne200100Ev ; -- Begin function _ZNSt3__125__throw_bad_function_callB8ne200100Ev
	.globl	__ZNSt3__125__throw_bad_function_callB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__125__throw_bad_function_callB8ne200100Ev
	.p2align	2
__ZNSt3__125__throw_bad_function_callB8ne200100Ev: ; @_ZNSt3__125__throw_bad_function_callB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w0, #8                          ; =0x8
	bl	___cxa_allocate_exception
Lloh96:
	adrp	x8, __ZTVNSt3__117bad_function_callE@GOTPAGE
Lloh97:
	ldr	x8, [x8, __ZTVNSt3__117bad_function_callE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
Lloh98:
	adrp	x1, __ZTINSt3__117bad_function_callE@PAGE
Lloh99:
	add	x1, x1, __ZTINSt3__117bad_function_callE@PAGEOFF
Lloh100:
	adrp	x2, __ZNSt3__117bad_function_callD1Ev@PAGE
Lloh101:
	add	x2, x2, __ZNSt3__117bad_function_callD1Ev@PAGEOFF
	bl	___cxa_throw
	.loh AdrpAdd	Lloh100, Lloh101
	.loh AdrpAdd	Lloh98, Lloh99
	.loh AdrpLdrGot	Lloh96, Lloh97
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117bad_function_callD1Ev ; -- Begin function _ZNSt3__117bad_function_callD1Ev
	.globl	__ZNSt3__117bad_function_callD1Ev
	.weak_def_can_be_hidden	__ZNSt3__117bad_function_callD1Ev
	.p2align	2
__ZNSt3__117bad_function_callD1Ev:      ; @_ZNSt3__117bad_function_callD1Ev
	.cfi_startproc
; %bb.0:
	b	__ZNSt9exceptionD2Ev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117bad_function_callD0Ev ; -- Begin function _ZNSt3__117bad_function_callD0Ev
	.globl	__ZNSt3__117bad_function_callD0Ev
	.weak_def_can_be_hidden	__ZNSt3__117bad_function_callD0Ev
	.p2align	2
__ZNSt3__117bad_function_callD0Ev:      ; @_ZNSt3__117bad_function_callD0Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt9exceptionD2Ev
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__throw_length_errorB8ne200100EPKc ; -- Begin function _ZNSt3__120__throw_length_errorB8ne200100EPKc
	.globl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.weak_def_can_be_hidden	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.p2align	2
__ZNSt3__120__throw_length_errorB8ne200100EPKc: ; @_ZNSt3__120__throw_length_errorB8ne200100EPKc
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x20, x0
	mov	w0, #16                         ; =0x10
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp330:
	mov	x1, x20
	bl	__ZNSt12length_errorC1B8ne200100EPKc
Ltmp331:
; %bb.1:
Lloh102:
	adrp	x1, __ZTISt12length_error@GOTPAGE
Lloh103:
	ldr	x1, [x1, __ZTISt12length_error@GOTPAGEOFF]
Lloh104:
	adrp	x2, __ZNSt12length_errorD1Ev@GOTPAGE
Lloh105:
	ldr	x2, [x2, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
LBB12_2:
Ltmp332:
	mov	x20, x0
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpLdrGot	Lloh104, Lloh105
	.loh AdrpLdrGot	Lloh102, Lloh103
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table12:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp330-Lfunc_begin1           ;   Call between Lfunc_begin1 and Ltmp330
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp330-Lfunc_begin1           ; >> Call Site 2 <<
	.uleb128 Ltmp331-Ltmp330                ;   Call between Ltmp330 and Ltmp331
	.uleb128 Ltmp332-Lfunc_begin1           ;     jumps to Ltmp332
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp331-Lfunc_begin1           ; >> Call Site 3 <<
	.uleb128 Lfunc_end1-Ltmp331             ;   Call between Ltmp331 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt12length_errorC1B8ne200100EPKc ; -- Begin function _ZNSt12length_errorC1B8ne200100EPKc
	.globl	__ZNSt12length_errorC1B8ne200100EPKc
	.weak_def_can_be_hidden	__ZNSt12length_errorC1B8ne200100EPKc
	.p2align	2
__ZNSt12length_errorC1B8ne200100EPKc:   ; @_ZNSt12length_errorC1B8ne200100EPKc
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt11logic_errorC2EPKc
Lloh106:
	adrp	x8, __ZTVSt12length_error@GOTPAGE
Lloh107:
	ldr	x8, [x8, __ZTVSt12length_error@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh106, Lloh107
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED1Ev
__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED1Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED1Ev"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED0Ev
__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED0Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED0Ev"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEv
__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEv"
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Lloh108:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh109:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x0]
	ldur	q0, [x19, #8]
	stur	q0, [x0, #8]
	ldr	x8, [x19, #24]
	str	x8, [x0, #24]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh108, Lloh109
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE"
	.cfi_startproc
; %bb.0:
Lloh110:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh111:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x1]
	ldur	q0, [x0, #8]
	ldr	x8, [x0, #24]
	str	x8, [x1, #24]
	stur	q0, [x1, #8]
	ret
	.loh AdrpAdd	Lloh110, Lloh111
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7destroyEv
__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7destroyEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7destroyEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEclEv
__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEclEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEclEv"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	ldr	x8, [x8]
	cbz	x8, LBB20_8
; %bb.1:
	ldp	x9, x10, [x0, #8]
	ldr	x9, [x9]
	ldr	x10, [x10]
	cmp	x8, #4
	b.lo	LBB20_5
; %bb.2:
	lsl	x11, x8, #2
	add	x12, x10, x11
	add	x11, x9, x11
	cmp	x10, x11
	ccmp	x9, x12, #2, lo
	b.lo	LBB20_5
; %bb.3:
	cmp	x8, #16
	b.hs	LBB20_9
; %bb.4:
	mov	x11, #0                         ; =0x0
	b	LBB20_13
LBB20_5:
	mov	x11, #0                         ; =0x0
LBB20_6:
	sub	x8, x8, x11
	lsl	x11, x11, #2
	add	x10, x10, x11
	add	x9, x9, x11
	fmov	s0, #2.00000000
LBB20_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x9], #4
	ldr	s2, [x10]
	fmadd	s1, s1, s0, s2
	str	s1, [x10], #4
	subs	x8, x8, #1
	b.ne	LBB20_7
LBB20_8:
	ret
LBB20_9:
	and	x11, x8, #0xfffffffffffffff0
	add	x12, x10, #32
	add	x13, x9, #32
	movi.4s	v0, #64, lsl #24
	mov	x14, x11
LBB20_10:                               ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x13, #-32]
	ldp	q3, q4, [x13], #64
	ldp	q5, q6, [x12, #-32]
	ldp	q7, q16, [x12]
	fmla.4s	v5, v0, v1
	fmla.4s	v6, v0, v2
	fmla.4s	v7, v0, v3
	fmla.4s	v16, v0, v4
	stp	q5, q6, [x12, #-32]
	stp	q7, q16, [x12], #64
	subs	x14, x14, #16
	b.ne	LBB20_10
; %bb.11:
	cmp	x8, x11
	b.eq	LBB20_8
; %bb.12:
	tst	x8, #0xc
	b.eq	LBB20_6
LBB20_13:
	mov	x14, x11
	and	x11, x8, #0xfffffffffffffffc
	lsl	x13, x14, #2
	add	x12, x9, x13
	add	x13, x10, x13
	sub	x14, x14, x11
	movi.4s	v0, #64, lsl #24
LBB20_14:                               ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x12], #16
	ldr	q2, [x13]
	fmla.4s	v2, v0, v1
	str	q2, [x13], #16
	adds	x14, x14, #4
	b.ne	LBB20_14
; %bb.15:
	cmp	x8, x11
	b.eq	LBB20_8
	b	LBB20_6
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x1, #8]
Lloh112:
	adrp	x9, __ZTSZ4mainE3$_0@PAGE
Lloh113:
	add	x9, x9, __ZTSZ4mainE3$_0@PAGEOFF
	cmp	x8, x9
	b.ne	LBB21_2
LBB21_1:
	add	x0, x0, #8
	ret
LBB21_2:
	tst	x8, x9
	b.lt	LBB21_4
; %bb.3:
	mov	x0, #0                          ; =0x0
	ret
LBB21_4:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	and	x0, x8, #0x7fffffffffffffff
	and	x1, x9, #0x7fffffffffffffff
	bl	_strcmp
	mov	x8, x0
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	cbz	w8, LBB21_1
; %bb.5:
	mov	x0, #0                          ; =0x0
	ret
	.loh AdrpAdd	Lloh112, Lloh113
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE11target_typeEv
__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE11target_typeEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE11target_typeEv"
	.cfi_startproc
; %bb.0:
Lloh114:
	adrp	x0, __ZTIZ4mainE3$_0@PAGE
Lloh115:
	add	x0, x0, __ZTIZ4mainE3$_0@PAGEOFF
	ret
	.loh AdrpAdd	Lloh114, Lloh115
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED1Ev
__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED1Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED1Ev"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED0Ev
__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED0Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED0Ev"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEv
__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEv"
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Lloh116:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh117:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x0]
	ldur	q0, [x19, #8]
	stur	q0, [x0, #8]
	ldr	x8, [x19, #24]
	str	x8, [x0, #24]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh116, Lloh117
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE"
	.cfi_startproc
; %bb.0:
Lloh118:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh119:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x1]
	ldur	q0, [x0, #8]
	ldr	x8, [x0, #24]
	str	x8, [x1, #24]
	stur	q0, [x1, #8]
	ret
	.loh AdrpAdd	Lloh118, Lloh119
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7destroyEv
__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7destroyEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7destroyEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEclEv
__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEclEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEclEv"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #24]
	ldr	x8, [x8]
	cbz	x8, LBB29_8
; %bb.1:
	ldp	x9, x10, [x0, #8]
	ldr	x9, [x9]
	ldr	x10, [x10]
	cmp	x8, #4
	b.lo	LBB29_5
; %bb.2:
	lsl	x11, x8, #2
	add	x12, x10, x11
	add	x11, x9, x11
	cmp	x10, x11
	ccmp	x9, x12, #2, lo
	b.lo	LBB29_5
; %bb.3:
	cmp	x8, #16
	b.hs	LBB29_9
; %bb.4:
	mov	x11, #0                         ; =0x0
	b	LBB29_13
LBB29_5:
	mov	x11, #0                         ; =0x0
LBB29_6:
	sub	x8, x8, x11
	lsl	x11, x11, #2
	add	x10, x10, x11
	add	x9, x9, x11
	fmov	s0, #2.00000000
LBB29_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	s1, [x9], #4
	ldr	s2, [x10]
	fmadd	s1, s1, s0, s2
	str	s1, [x10], #4
	subs	x8, x8, #1
	b.ne	LBB29_7
LBB29_8:
	ret
LBB29_9:
	and	x11, x8, #0xfffffffffffffff0
	add	x12, x10, #32
	add	x13, x9, #32
	movi.4s	v0, #64, lsl #24
	mov	x14, x11
LBB29_10:                               ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x13, #-32]
	ldp	q3, q4, [x13], #64
	ldp	q5, q6, [x12, #-32]
	ldp	q7, q16, [x12]
	fmla.4s	v5, v0, v1
	fmla.4s	v6, v0, v2
	fmla.4s	v7, v0, v3
	fmla.4s	v16, v0, v4
	stp	q5, q6, [x12, #-32]
	stp	q7, q16, [x12], #64
	subs	x14, x14, #16
	b.ne	LBB29_10
; %bb.11:
	cmp	x8, x11
	b.eq	LBB29_8
; %bb.12:
	tst	x8, #0xc
	b.eq	LBB29_6
LBB29_13:
	mov	x14, x11
	and	x11, x8, #0xfffffffffffffffc
	lsl	x13, x14, #2
	add	x12, x9, x13
	add	x13, x10, x13
	sub	x14, x14, x11
	movi.4s	v0, #64, lsl #24
LBB29_14:                               ; =>This Inner Loop Header: Depth=1
	ldr	q1, [x12], #16
	ldr	q2, [x13]
	fmla.4s	v2, v0, v1
	str	q2, [x13], #16
	adds	x14, x14, #4
	b.ne	LBB29_14
; %bb.15:
	cmp	x8, x11
	b.eq	LBB29_8
	b	LBB29_6
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x1, #8]
Lloh120:
	adrp	x9, __ZTSZ4mainE3$_1@PAGE
Lloh121:
	add	x9, x9, __ZTSZ4mainE3$_1@PAGEOFF
	cmp	x8, x9
	b.ne	LBB30_2
LBB30_1:
	add	x0, x0, #8
	ret
LBB30_2:
	tst	x8, x9
	b.lt	LBB30_4
; %bb.3:
	mov	x0, #0                          ; =0x0
	ret
LBB30_4:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	and	x0, x8, #0x7fffffffffffffff
	and	x1, x9, #0x7fffffffffffffff
	bl	_strcmp
	mov	x8, x0
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	cbz	w8, LBB30_1
; %bb.5:
	mov	x0, #0                          ; =0x0
	ret
	.loh AdrpAdd	Lloh120, Lloh121
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE11target_typeEv
__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE11target_typeEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE11target_typeEv"
	.cfi_startproc
; %bb.0:
Lloh122:
	adrp	x0, __ZTIZ4mainE3$_1@PAGE
Lloh123:
	add	x0, x0, __ZTIZ4mainE3$_1@PAGEOFF
	ret
	.loh AdrpAdd	Lloh122, Lloh123
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ; -- Begin function _ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.globl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	2
__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ; @_ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x21, x2
	mov	x20, x1
	mov	x19, x0
Ltmp333:
	add	x0, sp, #8
	mov	x1, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp334:
; %bb.1:
	ldrb	w8, [sp, #8]
	cmp	w8, #1
	b.ne	LBB32_10
; %bb.2:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x4, x19, x8
	ldr	x22, [x4, #40]
	ldr	w24, [x4, #8]
	ldr	w23, [x4, #144]
	cmn	w23, #1
	b.ne	LBB32_7
; %bb.3:
Ltmp336:
	add	x8, sp, #24
	mov	x25, x4
	mov	x0, x4
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp337:
; %bb.4:
Ltmp338:
Lloh124:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh125:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #24
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp339:
; %bb.5:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp340:
	mov	w1, #32                         ; =0x20
	blr	x8
Ltmp341:
; %bb.6:
	mov	x23, x0
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
	mov	x4, x25
	str	w23, [x25, #144]
LBB32_7:
	mov	w8, #176                        ; =0xb0
	and	w8, w24, w8
	add	x3, x20, x21
	cmp	w8, #32
	csel	x2, x3, x20, eq
Ltmp343:
	sxtb	w5, w23
	mov	x0, x22
	mov	x1, x20
	bl	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp344:
; %bb.8:
	cbnz	x0, LBB32_10
; %bb.9:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x0, x19, x8
	ldr	w8, [x0, #32]
	mov	w9, #5                          ; =0x5
Ltmp346:
	orr	w1, w8, w9
	bl	__ZNSt3__18ios_base5clearEj
Ltmp347:
LBB32_10:
	add	x0, sp, #8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB32_11:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB32_12:
Ltmp348:
	b	LBB32_15
LBB32_13:
Ltmp342:
	mov	x20, x0
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
	b	LBB32_16
LBB32_14:
Ltmp345:
LBB32_15:
	mov	x20, x0
LBB32_16:
	add	x0, sp, #8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	b	LBB32_18
LBB32_17:
Ltmp335:
	mov	x20, x0
LBB32_18:
	mov	x0, x20
	bl	___cxa_begin_catch
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
Ltmp349:
	add	x0, x19, x8
	bl	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp350:
; %bb.19:
	bl	___cxa_end_catch
	b	LBB32_11
LBB32_20:
Ltmp351:
	mov	x19, x0
Ltmp352:
	bl	___cxa_end_catch
Ltmp353:
; %bb.21:
	mov	x0, x19
	bl	__Unwind_Resume
LBB32_22:
Ltmp354:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh124, Lloh125
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table32:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp333-Lfunc_begin2           ; >> Call Site 1 <<
	.uleb128 Ltmp334-Ltmp333                ;   Call between Ltmp333 and Ltmp334
	.uleb128 Ltmp335-Lfunc_begin2           ;     jumps to Ltmp335
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp336-Lfunc_begin2           ; >> Call Site 2 <<
	.uleb128 Ltmp337-Ltmp336                ;   Call between Ltmp336 and Ltmp337
	.uleb128 Ltmp345-Lfunc_begin2           ;     jumps to Ltmp345
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp338-Lfunc_begin2           ; >> Call Site 3 <<
	.uleb128 Ltmp341-Ltmp338                ;   Call between Ltmp338 and Ltmp341
	.uleb128 Ltmp342-Lfunc_begin2           ;     jumps to Ltmp342
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp343-Lfunc_begin2           ; >> Call Site 4 <<
	.uleb128 Ltmp344-Ltmp343                ;   Call between Ltmp343 and Ltmp344
	.uleb128 Ltmp345-Lfunc_begin2           ;     jumps to Ltmp345
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp346-Lfunc_begin2           ; >> Call Site 5 <<
	.uleb128 Ltmp347-Ltmp346                ;   Call between Ltmp346 and Ltmp347
	.uleb128 Ltmp348-Lfunc_begin2           ;     jumps to Ltmp348
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp347-Lfunc_begin2           ; >> Call Site 6 <<
	.uleb128 Ltmp349-Ltmp347                ;   Call between Ltmp347 and Ltmp349
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp349-Lfunc_begin2           ; >> Call Site 7 <<
	.uleb128 Ltmp350-Ltmp349                ;   Call between Ltmp349 and Ltmp350
	.uleb128 Ltmp351-Lfunc_begin2           ;     jumps to Ltmp351
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp350-Lfunc_begin2           ; >> Call Site 8 <<
	.uleb128 Ltmp352-Ltmp350                ;   Call between Ltmp350 and Ltmp352
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp352-Lfunc_begin2           ; >> Call Site 9 <<
	.uleb128 Ltmp353-Ltmp352                ;   Call between Ltmp352 and Ltmp353
	.uleb128 Ltmp354-Lfunc_begin2           ;     jumps to Ltmp354
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp353-Lfunc_begin2           ; >> Call Site 10 <<
	.uleb128 Lfunc_end2-Ltmp353             ;   Call between Ltmp353 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ; -- Begin function _ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	2
__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ; @_ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
; %bb.0:
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	cbz	x0, LBB33_16
; %bb.1:
	mov	x24, x5
	mov	x20, x4
	mov	x22, x3
	mov	x21, x2
	ldr	x8, [x4, #24]
	sub	x9, x3, x1
	subs	x8, x8, x9
	csel	x23, x8, xzr, gt
	sub	x25, x2, x1
	cmp	x25, #1
	b.lt	LBB33_3
; %bb.2:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x2, x25
	blr	x8
	cmp	x0, x25
	b.ne	LBB33_15
LBB33_3:
	cmp	x23, #1
	b.lt	LBB33_12
; %bb.4:
	mov	x8, #9223372036854775800        ; =0x7ffffffffffffff8
	cmp	x23, x8
	b.hs	LBB33_17
; %bb.5:
	cmp	x23, #23
	b.hs	LBB33_7
; %bb.6:
	strb	w23, [sp, #31]
	add	x25, sp, #8
	b	LBB33_8
LBB33_7:
	orr	x8, x23, #0x7
	cmp	x8, #23
	mov	w9, #25                         ; =0x19
	csinc	x26, x9, x8, eq
	mov	x0, x26
	bl	__Znwm
	mov	x25, x0
	orr	x8, x26, #0x8000000000000000
	stp	x23, x8, [sp, #16]
	str	x0, [sp, #8]
LBB33_8:
	mov	x0, x25
	mov	x1, x24
	mov	x2, x23
	bl	_memset
	strb	wzr, [x25, x23]
	ldrsb	w8, [sp, #31]
	ldr	x9, [sp, #8]
	cmp	w8, #0
	add	x8, sp, #8
	csel	x1, x9, x8, lt
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
Ltmp355:
	mov	x0, x19
	mov	x2, x23
	blr	x8
Ltmp356:
; %bb.9:
	ldrsb	w8, [sp, #31]
	tbnz	w8, #31, LBB33_11
; %bb.10:
	cmp	x0, x23
	b.ne	LBB33_15
	b	LBB33_12
LBB33_11:
	ldr	x8, [sp, #8]
	mov	x24, x0
	mov	x0, x8
	bl	__ZdlPv
	cmp	x24, x23
	b.ne	LBB33_15
LBB33_12:
	sub	x22, x22, x21
	cmp	x22, #1
	b.lt	LBB33_14
; %bb.13:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x1, x21
	mov	x2, x22
	blr	x8
	cmp	x0, x22
	b.ne	LBB33_15
LBB33_14:
	str	xzr, [x20, #24]
	b	LBB33_16
LBB33_15:
	mov	x19, #0                         ; =0x0
LBB33_16:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB33_17:
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
LBB33_18:
Ltmp357:
	mov	x19, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB33_20
; %bb.19:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
LBB33_20:
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table33:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3      ; >> Call Site 1 <<
	.uleb128 Ltmp355-Lfunc_begin3           ;   Call between Lfunc_begin3 and Ltmp355
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp355-Lfunc_begin3           ; >> Call Site 2 <<
	.uleb128 Ltmp356-Ltmp355                ;   Call between Ltmp355 and Ltmp356
	.uleb128 Ltmp357-Lfunc_begin3           ;     jumps to Ltmp357
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp356-Lfunc_begin3           ; >> Call Site 3 <<
	.uleb128 Lfunc_end3-Ltmp356             ;   Call between Ltmp356 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh126:
	adrp	x0, l_.str.13@PAGE
Lloh127:
	add	x0, x0, l_.str.13@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.loh AdrpAdd	Lloh126, Lloh127
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED1Ev
__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED1Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED1Ev"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED0Ev
__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED0Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED0Ev"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEv
__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEv"
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Lloh128:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh129:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x0]
	ldur	q0, [x19, #8]
	stur	q0, [x0, #8]
	ldr	x8, [x19, #24]
	str	x8, [x0, #24]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh128, Lloh129
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE"
	.cfi_startproc
; %bb.0:
Lloh130:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh131:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x1]
	ldur	q0, [x0, #8]
	ldr	x8, [x0, #24]
	str	x8, [x1, #24]
	stur	q0, [x1, #8]
	ret
	.loh AdrpAdd	Lloh130, Lloh131
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7destroyEv
__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7destroyEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7destroyEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEclEv
__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEclEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEclEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x1, #8]
Lloh132:
	adrp	x9, __ZTSZ4mainE3$_2@PAGE
Lloh133:
	add	x9, x9, __ZTSZ4mainE3$_2@PAGEOFF
	cmp	x8, x9
	b.ne	LBB42_2
LBB42_1:
	add	x0, x0, #8
	ret
LBB42_2:
	tst	x8, x9
	b.lt	LBB42_4
; %bb.3:
	mov	x0, #0                          ; =0x0
	ret
LBB42_4:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	and	x0, x8, #0x7fffffffffffffff
	and	x1, x9, #0x7fffffffffffffff
	bl	_strcmp
	mov	x8, x0
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	cbz	w8, LBB42_1
; %bb.5:
	mov	x0, #0                          ; =0x0
	ret
	.loh AdrpAdd	Lloh132, Lloh133
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE11target_typeEv
__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE11target_typeEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE11target_typeEv"
	.cfi_startproc
; %bb.0:
Lloh134:
	adrp	x0, __ZTIZ4mainE3$_2@PAGE
Lloh135:
	add	x0, x0, __ZTIZ4mainE3$_2@PAGEOFF
	ret
	.loh AdrpAdd	Lloh134, Lloh135
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED1Ev
__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED1Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED1Ev"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED0Ev
__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED0Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED0Ev"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEv
__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEv"
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #32                         ; =0x20
	bl	__Znwm
Lloh136:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh137:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x0]
	ldur	q0, [x19, #8]
	stur	q0, [x0, #8]
	ldr	x8, [x19, #24]
	str	x8, [x0, #24]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh136, Lloh137
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE"
	.cfi_startproc
; %bb.0:
Lloh138:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh139:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x1]
	ldur	q0, [x0, #8]
	ldr	x8, [x0, #24]
	str	x8, [x1, #24]
	stur	q0, [x1, #8]
	ret
	.loh AdrpAdd	Lloh138, Lloh139
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7destroyEv
__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7destroyEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7destroyEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEclEv
__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEclEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEclEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x1, #8]
Lloh140:
	adrp	x9, __ZTSZ4mainE3$_3@PAGE
Lloh141:
	add	x9, x9, __ZTSZ4mainE3$_3@PAGEOFF
	cmp	x8, x9
	b.ne	LBB51_2
LBB51_1:
	add	x0, x0, #8
	ret
LBB51_2:
	tst	x8, x9
	b.lt	LBB51_4
; %bb.3:
	mov	x0, #0                          ; =0x0
	ret
LBB51_4:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	and	x0, x8, #0x7fffffffffffffff
	and	x1, x9, #0x7fffffffffffffff
	bl	_strcmp
	mov	x8, x0
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	cbz	w8, LBB51_1
; %bb.5:
	mov	x0, #0                          ; =0x0
	ret
	.loh AdrpAdd	Lloh140, Lloh141
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE11target_typeEv
__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE11target_typeEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE11target_typeEv"
	.cfi_startproc
; %bb.0:
Lloh142:
	adrp	x0, __ZTIZ4mainE3$_3@PAGE
Lloh143:
	add	x0, x0, __ZTIZ4mainE3$_3@PAGEOFF
	ret
	.loh AdrpAdd	Lloh142, Lloh143
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED1Ev
__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED1Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED1Ev"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED0Ev
__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED0Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED0Ev"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEv
__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEv"
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #40                         ; =0x28
	bl	__Znwm
Lloh144:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh145:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x0]
	ldur	q0, [x19, #8]
	stur	q0, [x0, #8]
	ldur	q0, [x19, #24]
	stur	q0, [x0, #24]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh144, Lloh145
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE"
	.cfi_startproc
; %bb.0:
Lloh146:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh147:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x1]
	ldur	q0, [x0, #8]
	ldur	q1, [x0, #24]
	stur	q1, [x1, #24]
	stur	q0, [x1, #8]
	ret
	.loh AdrpAdd	Lloh146, Lloh147
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7destroyEv
__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7destroyEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7destroyEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEclEv
__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEclEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEclEv"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #32]
	ldr	x9, [x8]
	cbz	x9, LBB59_5
; %bb.1:
	ldp	x8, x10, [x0, #8]
	ldr	x8, [x8]
	ldr	x10, [x10]
	ldr	x11, [x0, #24]
	ldr	x11, [x11]
	cmp	x9, #4
	b.hs	LBB59_6
; %bb.2:
	mov	x12, #0                         ; =0x0
LBB59_3:
	sub	x9, x9, x12
	lsl	x12, x12, #2
	add	x11, x11, x12
	add	x10, x10, x12
	add	x8, x8, x12
LBB59_4:                                ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x8], #4
	ldr	s1, [x10], #4
	fmul	s0, s0, s1
	str	s0, [x11], #4
	subs	x9, x9, #1
	b.ne	LBB59_4
LBB59_5:
	ret
LBB59_6:
	mov	x12, #0                         ; =0x0
	sub	x13, x11, x8
	cmp	x13, #64
	b.lo	LBB59_3
; %bb.7:
	sub	x13, x11, x10
	cmp	x13, #64
	b.lo	LBB59_3
; %bb.8:
	cmp	x9, #16
	b.hs	LBB59_10
; %bb.9:
	mov	x12, #0                         ; =0x0
	b	LBB59_14
LBB59_10:
	and	x12, x9, #0xfffffffffffffff0
	add	x13, x11, #32
	add	x14, x8, #32
	add	x15, x10, #32
	mov	x16, x12
LBB59_11:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	ldp	q4, q5, [x15, #-32]
	ldp	q6, q7, [x15], #64
	fmul.4s	v0, v0, v4
	fmul.4s	v1, v1, v5
	fmul.4s	v2, v2, v6
	fmul.4s	v3, v3, v7
	stp	q0, q1, [x13, #-32]
	stp	q2, q3, [x13], #64
	subs	x16, x16, #16
	b.ne	LBB59_11
; %bb.12:
	cmp	x9, x12
	b.eq	LBB59_5
; %bb.13:
	tst	x9, #0xc
	b.eq	LBB59_3
LBB59_14:
	mov	x16, x12
	and	x12, x9, #0xfffffffffffffffc
	lsl	x15, x16, #2
	add	x13, x8, x15
	add	x14, x10, x15
	add	x15, x11, x15
	sub	x16, x16, x12
LBB59_15:                               ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x13], #16
	ldr	q1, [x14], #16
	fmul.4s	v0, v0, v1
	str	q0, [x15], #16
	adds	x16, x16, #4
	b.ne	LBB59_15
; %bb.16:
	cmp	x9, x12
	b.ne	LBB59_3
	b	LBB59_5
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x1, #8]
Lloh148:
	adrp	x9, __ZTSZ4mainE3$_4@PAGE
Lloh149:
	add	x9, x9, __ZTSZ4mainE3$_4@PAGEOFF
	cmp	x8, x9
	b.ne	LBB60_2
LBB60_1:
	add	x0, x0, #8
	ret
LBB60_2:
	tst	x8, x9
	b.lt	LBB60_4
; %bb.3:
	mov	x0, #0                          ; =0x0
	ret
LBB60_4:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	and	x0, x8, #0x7fffffffffffffff
	and	x1, x9, #0x7fffffffffffffff
	bl	_strcmp
	mov	x8, x0
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	cbz	w8, LBB60_1
; %bb.5:
	mov	x0, #0                          ; =0x0
	ret
	.loh AdrpAdd	Lloh148, Lloh149
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE11target_typeEv
__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE11target_typeEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE11target_typeEv"
	.cfi_startproc
; %bb.0:
Lloh150:
	adrp	x0, __ZTIZ4mainE3$_4@PAGE
Lloh151:
	add	x0, x0, __ZTIZ4mainE3$_4@PAGEOFF
	ret
	.loh AdrpAdd	Lloh150, Lloh151
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED1Ev
__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED1Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED1Ev"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED0Ev
__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED0Ev: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED0Ev"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEv
__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEv"
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #40                         ; =0x28
	bl	__Znwm
Lloh152:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh153:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x0]
	ldur	q0, [x19, #8]
	stur	q0, [x0, #8]
	ldur	q0, [x19, #24]
	stur	q0, [x0, #24]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh152, Lloh153
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE"
	.cfi_startproc
; %bb.0:
Lloh154:
	adrp	x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE@PAGE+16
Lloh155:
	add	x8, x8, __ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE@PAGEOFF+16
	str	x8, [x1]
	ldur	q0, [x0, #8]
	ldur	q1, [x0, #24]
	stur	q1, [x1, #24]
	stur	q0, [x1, #8]
	ret
	.loh AdrpAdd	Lloh154, Lloh155
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7destroyEv
__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7destroyEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7destroyEv"
	.cfi_startproc
; %bb.0:
	ret
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv"
	.cfi_startproc
; %bb.0:
	b	__ZdlPv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEclEv
__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEclEv: ; @"_ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEclEv"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #32]
	ldr	x9, [x8]
	cbz	x9, LBB68_5
; %bb.1:
	ldp	x8, x10, [x0, #8]
	ldr	x8, [x8]
	ldr	x10, [x10]
	ldr	x11, [x0, #24]
	ldr	x11, [x11]
	cmp	x9, #4
	b.hs	LBB68_6
; %bb.2:
	mov	x12, #0                         ; =0x0
LBB68_3:
	sub	x9, x9, x12
	lsl	x12, x12, #2
	add	x11, x11, x12
	add	x10, x10, x12
	add	x8, x8, x12
LBB68_4:                                ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x8], #4
	ldr	s1, [x10], #4
	fmul	s0, s0, s1
	str	s0, [x11], #4
	subs	x9, x9, #1
	b.ne	LBB68_4
LBB68_5:
	ret
LBB68_6:
	mov	x12, #0                         ; =0x0
	sub	x13, x11, x8
	cmp	x13, #64
	b.lo	LBB68_3
; %bb.7:
	sub	x13, x11, x10
	cmp	x13, #64
	b.lo	LBB68_3
; %bb.8:
	cmp	x9, #16
	b.hs	LBB68_10
; %bb.9:
	mov	x12, #0                         ; =0x0
	b	LBB68_14
LBB68_10:
	and	x12, x9, #0xfffffffffffffff0
	add	x13, x11, #32
	add	x14, x8, #32
	add	x15, x10, #32
	mov	x16, x12
LBB68_11:                               ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-32]
	ldp	q2, q3, [x14], #64
	ldp	q4, q5, [x15, #-32]
	ldp	q6, q7, [x15], #64
	fmul.4s	v0, v0, v4
	fmul.4s	v1, v1, v5
	fmul.4s	v2, v2, v6
	fmul.4s	v3, v3, v7
	stp	q0, q1, [x13, #-32]
	stp	q2, q3, [x13], #64
	subs	x16, x16, #16
	b.ne	LBB68_11
; %bb.12:
	cmp	x9, x12
	b.eq	LBB68_5
; %bb.13:
	tst	x9, #0xc
	b.eq	LBB68_3
LBB68_14:
	mov	x16, x12
	and	x12, x9, #0xfffffffffffffffc
	lsl	x15, x16, #2
	add	x13, x8, x15
	add	x14, x10, x15
	add	x15, x11, x15
	sub	x16, x16, x12
LBB68_15:                               ; =>This Inner Loop Header: Depth=1
	ldr	q0, [x13], #16
	ldr	q1, [x14], #16
	fmul.4s	v0, v0, v1
	str	q0, [x15], #16
	adds	x16, x16, #4
	b.ne	LBB68_15
; %bb.16:
	cmp	x9, x12
	b.ne	LBB68_3
	b	LBB68_5
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info"
	.cfi_startproc
; %bb.0:
	ldr	x8, [x1, #8]
Lloh156:
	adrp	x9, __ZTSZ4mainE3$_5@PAGE
Lloh157:
	add	x9, x9, __ZTSZ4mainE3$_5@PAGEOFF
	cmp	x8, x9
	b.ne	LBB69_2
LBB69_1:
	add	x0, x0, #8
	ret
LBB69_2:
	tst	x8, x9
	b.lt	LBB69_4
; %bb.3:
	mov	x0, #0                          ; =0x0
	ret
LBB69_4:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	and	x0, x8, #0x7fffffffffffffff
	and	x1, x9, #0x7fffffffffffffff
	bl	_strcmp
	mov	x8, x0
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	cbz	w8, LBB69_1
; %bb.5:
	mov	x0, #0                          ; =0x0
	ret
	.loh AdrpAdd	Lloh156, Lloh157
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE11target_typeEv
__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE11target_typeEv: ; @"_ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE11target_typeEv"
	.cfi_startproc
; %bb.0:
Lloh158:
	adrp	x0, __ZTIZ4mainE3$_5@PAGE
Lloh159:
	add	x0, x0, __ZTIZ4mainE3$_5@PAGEOFF
	ret
	.loh AdrpAdd	Lloh158, Lloh159
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"SAXPY scalar time: "

l_.str.1:                               ; @.str.1
	.asciz	" ms, "

l_.str.2:                               ; @.str.2
	.asciz	" GFLOP/s"

l_.str.3:                               ; @.str.3
	.asciz	"SAXPY vectorized time: "

l_.str.4:                               ; @.str.4
	.asciz	"SAXPY speedup: "

l_.str.5:                               ; @.str.5
	.asciz	"x\n"

l_.str.6:                               ; @.str.6
	.asciz	"DOT scalar time: "

l_.str.7:                               ; @.str.7
	.asciz	"DOT vectorized time: "

l_.str.8:                               ; @.str.8
	.asciz	"DOT speedup: "

l_.str.9:                               ; @.str.9
	.asciz	"Elementwise scalar time: "

l_.str.10:                              ; @.str.10
	.asciz	"Elementwise vectorized time: "

l_.str.11:                              ; @.str.11
	.asciz	"Elementwise speedup: "

	.private_extern	__ZTSNSt3__117bad_function_callE ; @_ZTSNSt3__117bad_function_callE
	.section	__TEXT,__const
	.globl	__ZTSNSt3__117bad_function_callE
	.weak_definition	__ZTSNSt3__117bad_function_callE
__ZTSNSt3__117bad_function_callE:
	.asciz	"NSt3__117bad_function_callE"

	.private_extern	__ZTINSt3__117bad_function_callE ; @_ZTINSt3__117bad_function_callE
	.section	__DATA,__const
	.globl	__ZTINSt3__117bad_function_callE
	.weak_definition	__ZTINSt3__117bad_function_callE
	.p2align	3, 0x0
__ZTINSt3__117bad_function_callE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__117bad_function_callE-9223372036854775808
	.quad	__ZTISt9exception

	.globl	__ZTVNSt3__117bad_function_callE ; @_ZTVNSt3__117bad_function_callE
	.weak_def_can_be_hidden	__ZTVNSt3__117bad_function_callE
	.p2align	3, 0x0
__ZTVNSt3__117bad_function_callE:
	.quad	0
	.quad	__ZTINSt3__117bad_function_callE
	.quad	__ZNSt3__117bad_function_callD1Ev
	.quad	__ZNSt3__117bad_function_callD0Ev
	.quad	__ZNKSt9exception4whatEv

	.p2align	3, 0x0                          ; @"_ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE"
__ZTVNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE:
	.quad	0
	.quad	__ZTINSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED1Ev
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEED0Ev
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE7destroyEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEclEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEE11target_typeEv

	.section	__TEXT,__const
__ZTSNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE: ; @"_ZTSNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE"
	.asciz	"NSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE"

	.private_extern	__ZTSNSt3__110__function6__baseIFvvEEE ; @_ZTSNSt3__110__function6__baseIFvvEEE
	.globl	__ZTSNSt3__110__function6__baseIFvvEEE
	.weak_definition	__ZTSNSt3__110__function6__baseIFvvEEE
__ZTSNSt3__110__function6__baseIFvvEEE:
	.asciz	"NSt3__110__function6__baseIFvvEEE"

	.private_extern	__ZTINSt3__110__function6__baseIFvvEEE ; @_ZTINSt3__110__function6__baseIFvvEEE
	.section	__DATA,__const
	.globl	__ZTINSt3__110__function6__baseIFvvEEE
	.weak_definition	__ZTINSt3__110__function6__baseIFvvEEE
	.p2align	3, 0x0
__ZTINSt3__110__function6__baseIFvvEEE:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSNSt3__110__function6__baseIFvvEEE-9223372036854775808

	.p2align	3, 0x0                          ; @"_ZTINSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE"
__ZTINSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__110__function6__funcIZ4mainE3$_0NS_9allocatorIS2_EEFvvEEE
	.quad	__ZTINSt3__110__function6__baseIFvvEEE

	.section	__TEXT,__const
__ZTSZ4mainE3$_0:                       ; @"_ZTSZ4mainE3$_0"
	.asciz	"Z4mainE3$_0"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTIZ4mainE3$_0"
__ZTIZ4mainE3$_0:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSZ4mainE3$_0

	.p2align	3, 0x0                          ; @"_ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE"
__ZTVNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE:
	.quad	0
	.quad	__ZTINSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED1Ev
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEED0Ev
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE7destroyEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEclEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEE11target_typeEv

	.section	__TEXT,__const
__ZTSNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE: ; @"_ZTSNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE"
	.asciz	"NSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTINSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE"
__ZTINSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__110__function6__funcIZ4mainE3$_1NS_9allocatorIS2_EEFvvEEE
	.quad	__ZTINSt3__110__function6__baseIFvvEEE

	.section	__TEXT,__const
__ZTSZ4mainE3$_1:                       ; @"_ZTSZ4mainE3$_1"
	.asciz	"Z4mainE3$_1"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTIZ4mainE3$_1"
__ZTIZ4mainE3$_1:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSZ4mainE3$_1

	.section	__TEXT,__cstring,cstring_literals
l_.str.13:                              ; @.str.13
	.asciz	"basic_string"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE"
__ZTVNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE:
	.quad	0
	.quad	__ZTINSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED1Ev
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEED0Ev
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE7destroyEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEclEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEE11target_typeEv

	.section	__TEXT,__const
__ZTSNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE: ; @"_ZTSNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE"
	.asciz	"NSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTINSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE"
__ZTINSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__110__function6__funcIZ4mainE3$_2NS_9allocatorIS2_EEFvvEEE
	.quad	__ZTINSt3__110__function6__baseIFvvEEE

	.section	__TEXT,__const
__ZTSZ4mainE3$_2:                       ; @"_ZTSZ4mainE3$_2"
	.asciz	"Z4mainE3$_2"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTIZ4mainE3$_2"
__ZTIZ4mainE3$_2:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSZ4mainE3$_2

	.p2align	3, 0x0                          ; @"_ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE"
__ZTVNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE:
	.quad	0
	.quad	__ZTINSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED1Ev
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEED0Ev
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE7destroyEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEclEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEE11target_typeEv

	.section	__TEXT,__const
__ZTSNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE: ; @"_ZTSNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE"
	.asciz	"NSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTINSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE"
__ZTINSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__110__function6__funcIZ4mainE3$_3NS_9allocatorIS2_EEFvvEEE
	.quad	__ZTINSt3__110__function6__baseIFvvEEE

	.section	__TEXT,__const
__ZTSZ4mainE3$_3:                       ; @"_ZTSZ4mainE3$_3"
	.asciz	"Z4mainE3$_3"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTIZ4mainE3$_3"
__ZTIZ4mainE3$_3:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSZ4mainE3$_3

	.p2align	3, 0x0                          ; @"_ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE"
__ZTVNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE:
	.quad	0
	.quad	__ZTINSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED1Ev
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEED0Ev
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE7destroyEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEclEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEE11target_typeEv

	.section	__TEXT,__const
__ZTSNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE: ; @"_ZTSNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE"
	.asciz	"NSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTINSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE"
__ZTINSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__110__function6__funcIZ4mainE3$_4NS_9allocatorIS2_EEFvvEEE
	.quad	__ZTINSt3__110__function6__baseIFvvEEE

	.section	__TEXT,__const
__ZTSZ4mainE3$_4:                       ; @"_ZTSZ4mainE3$_4"
	.asciz	"Z4mainE3$_4"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTIZ4mainE3$_4"
__ZTIZ4mainE3$_4:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSZ4mainE3$_4

	.p2align	3, 0x0                          ; @"_ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE"
__ZTVNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE:
	.quad	0
	.quad	__ZTINSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED1Ev
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEED0Ev
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7__cloneEPNS0_6__baseIS5_EE
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE7destroyEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE18destroy_deallocateEv
	.quad	__ZNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEclEv
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE6targetERKSt9type_info
	.quad	__ZNKSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEE11target_typeEv

	.section	__TEXT,__const
__ZTSNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE: ; @"_ZTSNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE"
	.asciz	"NSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTINSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE"
__ZTINSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__110__function6__funcIZ4mainE3$_5NS_9allocatorIS2_EEFvvEEE
	.quad	__ZTINSt3__110__function6__baseIFvvEEE

	.section	__TEXT,__const
__ZTSZ4mainE3$_5:                       ; @"_ZTSZ4mainE3$_5"
	.asciz	"Z4mainE3$_5"

	.section	__DATA,__const
	.p2align	3, 0x0                          ; @"_ZTIZ4mainE3$_5"
__ZTIZ4mainE3$_5:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSZ4mainE3$_5

.subsections_via_symbols
