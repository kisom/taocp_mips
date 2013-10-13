/*
 * Copyright (c) 2013 Kyle Isom <kyle@tyrfingr.is>
 * 
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above 
 * copyright notice and this permission notice appear in all copies.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

	.data
m:	.word	544
n:	.word	119
displ:	.asciiz	"GCD(%d, %d) = %d\n"

	.text
	.set noreorder
algF:	move	$t0,	$a0
	move 	$t1,	$a1
_algF:	div	$t0,	$t1
	mfhi	$t0
	beq	$t0,	$0,	_algFx1
	nop
	div	$t1,	$t0
	mfhi	$t1
	beq	$t1,	$0,	_algFx2
	nop
	j	_algF
_algFx1:move	$v0,	$t1
	jr	$ra
_algFx2:move	$v0,	$t0
	jr	$ra
	.set	reorder

	.globl	main
main:	lw	$a0,	m
	lw	$a1,	n
	jal	algF

	dla	$a0,	displ
	lw	$a1,	m
	lw	$a2,	n
	move	$a3,	$v0
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall
