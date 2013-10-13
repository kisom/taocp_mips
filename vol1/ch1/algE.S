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
displ:	.asciiz	"GCD(%d, %d) is %d\n"

	.text
	.set noreorder
algE:	move	$t0,	$a0
	move	$t1,	$a1
_algE:	div	$t0,	$t1
	mfhi	$t2
	beq	$t2,	$0,	_algEx
	move	$t0,	$t1
	move	$t1,	$t2
	j	_algE
_algEx:	jr	$ra
	move	$v0,	$t1
	.set reorder

	.globl	main
main:	lw	$a0,	m
	lw	$a1,	n
	jal	algE

	dla	$a0,	displ
	lw	$a1,	m
	lw	$a2,	n
	move	$a3,	$v0
	jal	printf

	ori	$a0,	$0,	0
	ori	$v0,	$0,	1
	syscall
