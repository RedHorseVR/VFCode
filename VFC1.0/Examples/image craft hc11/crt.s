* define starting addresses
	sect 0		* code
	org $1800
	sect 1		* data
	org $4000
stackbase equ $7ffb
*
* start of code
*
	sect 0
	lds #stackbase
	jsr _main
	swi
__lsrd:
	cpy		#0
	beq		__lsrd_done
	lsrd
	dey
	bra		__lsrd
__lsrd_done:
	rts
__lsld:
	cpy		#0
	beq		__lsld_done
	lsld
	dey
	bra		__lsld
__lsld_done:
	rts
__asrd:
	cmpa	#0
	bpl		__lsrd
__asrd_loop:
	cpy		#0
	beq		__asrd_done
	asra
	rorb
	dey
	bra		__asrd_loop
__asrd_done:
	rts
__asgnblk:
	cpd		#0
	beq		__asgnblk_done
__asgnblk_loop:
	pshb
	ldab	0,y
	stab	0,x
	pulb
	subd	#1
	beq		__asgnblk_done
	inx
	iny
	bra		__asgnblk_loop
__asgnblk_done:
	rts
__muli:
__mulu:
	pshx
	pshy
	pshb
	psha
	tsx
	ldaa 3,x
	mul
	pshb
	psha
	ldab 0,x
	ldaa 3,x
	mul
	pula
	aba
	psha
	ldab 1,x
	ldaa 2,x
	mul
	pula
	aba
	pulb
	pulx
	pulx
	pulx
	rts
__divi:
	pshx		
	psha	
	tsta
	bpl	__divi_1
	coma
	comb
	addd	#1
__divi_1:	
	pshy		
	pulx	
	tsy
	cpx	#0
	bpl	__divi_2
	xgdx
	coma
	comb
	xgdx
	inx
	com	0,y
__divi_2:	
	idiv
	xgdx
	tst	0,y	
	bpl	__divi_3
	coma	
	comb
	addd	#1
__divi_3:	
	ins
	pulx
	rts
__modi:
	pshx
	psha
	tsta
	bpl	__modi_1
	coma	
	comb
	addd	#1
__modi_1:	
	pshy
	pulx
	cpx	#0
	bpl	__modi_2
	xgdx	
	coma
	comb
	xgdx
	inx
__modi_2:	
	idiv
	tsx	
	tst	0,x
	bpl	__modi_3
	coma	
	comb
	addd	#1
__modi_3:	
	ins		
	pulx
	rts
_putchar:
	tsy
	ldaa	3,y
	jsr		$ffaf
	rts
