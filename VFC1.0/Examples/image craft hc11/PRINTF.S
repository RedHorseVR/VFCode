	sect 0
_printf:
;       bp -> 38,x
;      buf -> 40,x
;        p -> 552,x
;        i -> 554,x
;        s -> 556,x
;      arg -> 562,x
;      fmt -> 560,x
	tsx
	xgdx
	subd #558
	xgdx
	txs
	xgdx
	tsx
	addd #562
	pshb
	psha
	pshx
	pula
	pulb
	addd #552
	xgdy
	pula
	pulb
	std 0,y
	xgdx
	tsx
	addd #40
	std 38,x
	ldab #0
	ldy 38,x
	stab 0,y
	jmp  L3.PRINTF
L2.PRINTF:
	xgdx
	tsx
	addd #560
	xgdy
	ldy 0,y
	ldab 0,y
	clra
	tstb
	bpl X0.PRINTF
	coma
X0.PRINTF:
	cpd #37
	beq  L5.PRINTF
	ldd 38,x
	std 36,x
	addd #1
	std 38,x
	xgdx
	tsx
	addd #560
	xgdy
	ldd 0,y
	std 34,x
	addd #1
	pshb
	psha
	pshx
	pula
	pulb
	addd #560
	xgdy
	pula
	pulb
	std 0,y
	ldy 34,x
	ldab 0,y
	ldy 36,x
	stab 0,y
	jmp  L6.PRINTF
L5.PRINTF:
	xgdx
	tsx
	addd #560
	xgdy
	ldd 0,y
	addd #1
	std 34,x
	pshb
	psha
	pshx
	pula
	pulb
	addd #560
	xgdy
	pula
	pulb
	std 0,y
	ldy 34,x
	ldab 0,y
	clra
	tstb
	bpl X1.PRINTF
	coma
X1.PRINTF:
	std 36,x
	std 32,x
	cpd #111
	beq  L13.PRINTF
	ldd 32,x
	cpd #111
	ble X2.PRINTF
	jmp  L27.PRINTF
X2.PRINTF:
	ldd 36,x
	std 30,x
	cpd #99
	bne X3.PRINTF
	jmp  L19.PRINTF
X3.PRINTF:
	ldd 30,x
	cpd #100
	bne X4.PRINTF
	jmp  L10.PRINTF
X4.PRINTF:
	jmp  L7.PRINTF
L13.PRINTF:
	xgdx
	tsx
	addd #552
	xgdy
	ldd 0,y
	std 24,x
	addd #2
	pshb
	psha
	pshx
	pula
	pulb
	addd #552
	xgdy
	pula
	pulb
	std 0,y
	ldy 24,x
	ldd 0,y
	pshb
	psha
	pshx
	pula
	pulb
	addd #554
	xgdy
	pula
	pulb
	std 0,y
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	cpd #0
	blt X5.PRINTF
	jmp  L14.PRINTF
X5.PRINTF:
	ldd 38,x
	std 22,x
	addd #1
	std 38,x
	ldab #45
	ldy 22,x
	stab 0,y
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	nega
	negb
	sbca #0
	pshb
	psha
	pshx
	pula
	pulb
	addd #554
	xgdy
	pula
	pulb
	std 0,y
	jmp  L14.PRINTF
L27.PRINTF:
	ldd 36,x
	std 28,x
	cpd #120
	bne X6.PRINTF
	jmp  L16.PRINTF
X6.PRINTF:
	ldd 28,x
	cpd #120
	ble X7.PRINTF
	jmp  L7.PRINTF
X7.PRINTF:
	ldd 36,x
	cpd #115
	bne X8.PRINTF
	jmp  L20.PRINTF
X8.PRINTF:
	jmp  L7.PRINTF
L19.PRINTF:
	ldd 38,x
	std 14,x
	addd #1
	std 38,x
	xgdx
	tsx
	addd #552
	xgdy
	ldd 0,y
	std 12,x
	addd #2
	pshb
	psha
	pshx
	pula
	pulb
	addd #552
	xgdy
	pula
	pulb
	std 0,y
	ldy 12,x
	ldd 0,y
	ldy 14,x
	stab 0,y
	jmp  L8.PRINTF
L10.PRINTF:
	xgdx
	tsx
	addd #552
	xgdy
	ldd 0,y
	std 26,x
	addd #2
	pshb
	psha
	pshx
	pula
	pulb
	addd #552
	xgdy
	pula
	pulb
	std 0,y
	ldy 26,x
	ldd 0,y
	pshb
	psha
	pshx
	pula
	pulb
	addd #554
	xgdy
	pula
	pulb
	std 0,y
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	cpd #0
	blt X9.PRINTF
	jmp  L11.PRINTF
X9.PRINTF:
	ldd 38,x
	std 24,x
	addd #1
	std 38,x
	ldab #45
	ldy 24,x
	stab 0,y
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	nega
	negb
	sbca #0
	pshb
	psha
	pshx
	pula
	pulb
	addd #554
	xgdy
	pula
	pulb
	std 0,y
	jmp  L11.PRINTF
L16.PRINTF:
	xgdx
	tsx
	addd #552
	xgdy
	ldd 0,y
	std 20,x
	addd #2
	pshb
	psha
	pshx
	pula
	pulb
	addd #552
	xgdy
	pula
	pulb
	std 0,y
	ldy 20,x
	ldd 0,y
	pshb
	psha
	pshx
	pula
	pulb
	addd #554
	xgdy
	pula
	pulb
	std 0,y
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	cpd #0
	blt X10.PRINTF
	jmp  L17.PRINTF
X10.PRINTF:
	ldd 38,x
	std 18,x
	addd #1
	std 38,x
	ldab #45
	ldy 18,x
	stab 0,y
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	nega
	negb
	sbca #0
	pshb
	psha
	pshx
	pula
	pulb
	addd #554
	xgdy
	pula
	pulb
	std 0,y
	jmp  L17.PRINTF
L7.PRINTF:
	jmp  L8.PRINTF
L20.PRINTF:
	xgdx
	tsx
	addd #552
	xgdy
	ldd 0,y
	std 10,x
	xgdy
	ldd 0,y
	pshb
	psha
	pshx
	pula
	pulb
	addd #556
	xgdy
	pula
	pulb
	std 0,y
	ldd 10,x
	addd #2
	pshb
	psha
	pshx
	pula
	pulb
	addd #552
	xgdy
	pula
	pulb
	std 0,y
	xgdx
	tsx
	addd #556
	xgdy
	ldd 0,y
	cpd #0
	beq X11.PRINTF
	jmp  L25.PRINTF
X11.PRINTF:
	ldd #L23.PRINTF
	pshb
	psha
	pshx
	pula
	pulb
	addd #556
	xgdy
	pula
	pulb
	std 0,y
	jmp  L25.PRINTF
L11.PRINTF:
	xgdx
	tsx
	addd #38
	std 0,x
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	std 2,x
	ldd #10
	std 4,x
	jsr  _itoa.PRINTF
	tsx
	jmp  L8.PRINTF
L14.PRINTF:
	ldd 38,x
	std 22,x
	addd #1
	std 38,x
	ldab #48
	ldy 22,x
	stab 0,y
	xgdx
	tsx
	addd #38
	std 0,x
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	std 2,x
	ldd #8
	std 4,x
	jsr  _itoa.PRINTF
	tsx
	jmp  L8.PRINTF
L17.PRINTF:
	ldd 38,x
	std 18,x
	addd #1
	std 38,x
	ldab #48
	ldy 18,x
	stab 0,y
	ldd 38,x
	std 16,x
	addd #1
	std 38,x
	ldab #120
	ldy 16,x
	stab 0,y
	xgdx
	tsx
	addd #38
	std 0,x
	xgdx
	tsx
	addd #554
	xgdy
	ldd 0,y
	std 2,x
	ldd #16
	std 4,x
	jsr  _itoa.PRINTF
	tsx
	jmp  L8.PRINTF
L25.PRINTF:
	xgdx
	tsx
	addd #556
	xgdy
	ldy 0,y
	ldab 0,y
	clra
	tstb
	bpl X12.PRINTF
	coma
X12.PRINTF:
	cpd #0
	bne  L24.PRINTF
	jmp  L7.PRINTF
L24.PRINTF:
	ldd 38,x
	std 8,x
	addd #1
	std 38,x
	xgdx
	tsx
	addd #556
	xgdy
	ldd 0,y
	std 6,x
	addd #1
	pshb
	psha
	pshx
	pula
	pulb
	addd #556
	xgdy
	pula
	pulb
	std 0,y
	ldy 6,x
	ldab 0,y
	ldy 8,x
	stab 0,y
	jmp  L25.PRINTF
L8.PRINTF:
	xgdx
	tsx
	addd #560
	xgdy
	ldd 0,y
	addd #1
	pshb
	psha
	pshx
	pula
	pulb
	addd #560
	xgdy
	pula
	pulb
	std 0,y
L6.PRINTF:
L3.PRINTF:
	xgdx
	tsx
	addd #560
	xgdy
	ldy 0,y
	ldab 0,y
	clra
	tstb
	bpl X13.PRINTF
	coma
X13.PRINTF:
	cpd #0
	beq X14.PRINTF
	jmp  L2.PRINTF
X14.PRINTF:
	ldab #0
	ldy 38,x
	stab 0,y
	xgdx
	tsx
	addd #40
	std 38,x
	jmp  L31.PRINTF
L28.PRINTF:
	ldy 38,x
	ldab 0,y
	clra
	tstb
	bpl X15.PRINTF
	coma
X15.PRINTF:
	std 0,x
	jsr  _putchar
	tsx
L29.PRINTF:
	ldd 38,x
	addd #1
	std 38,x
L31.PRINTF:
	ldy 38,x
	ldab 0,y
	clra
	tstb
	bpl X16.PRINTF
	coma
X16.PRINTF:
	cpd #0
	bne  L28.PRINTF
	xgdx
	addd #558
	xgdx
	txs
	rts
L1.PRINTF:
	sect 1
L53.PRINTF:
	RMB 21
	sect 0
_itoa.PRINTF:
;      rem -> 4,x
;        s -> 6,x
;     base -> 14,x
;        i -> 12,x
;      buf -> 10,x
	pshx
	pshx
	pshx
	pshx
	tsx
	ldab #0
	stab  L53.PRINTF+20
	ldd 12,x
	cpd #0
	bne  L55.PRINTF
	ldab #48
	ldy 10,x
	ldy 0,y
	stab 0,y
	ldd 10,x
	std 2,x
	xgdy
	ldd 0,y
	addd #1
	ldy 2,x
	std 0,y
	pulx
	pulx
	pulx
	pulx
	rts
L55.PRINTF:
	ldd #L53.PRINTF+20
	std 6,x
	jmp  L59.PRINTF
L58.PRINTF:
	ldd 12,x
	ldy 14,x
	jsr  __modi
	std 4,x
	cpd #10
	bgt  L61.PRINTF
	ldd 6,x
	addd #-1
	std 2,x
	std 6,x
	ldd 4,x
	addd #48
	ldy 2,x
	stab 0,y
	jmp  L62.PRINTF
L61.PRINTF:
	ldd 14,x
	cpd #16
	bne  L63.PRINTF
	ldd 6,x
	addd #-1
	std 0,x
	std 6,x
	ldd 4,x
	addd #L65.PRINTF-10
	xgdy
	ldab 0,y
	ldy 0,x
	stab 0,y
L63.PRINTF:
L62.PRINTF:
	ldd 12,x
	ldy 14,x
	jsr  __divi
	std 12,x
L59.PRINTF:
	ldd 12,x
	cpd #0
	bne  L58.PRINTF
	jmp  L68.PRINTF
L67.PRINTF:
	ldd 6,x
	std 2,x
	addd #1
	std 6,x
	ldy 2,x
	ldab 0,y
	ldy 10,x
	ldy 0,y
	stab 0,y
	ldd 10,x
	std 0,x
	xgdy
	ldd 0,y
	addd #1
	ldy 0,x
	std 0,y
L68.PRINTF:
	ldy 6,x
	ldab 0,y
	clra
	tstb
	bpl X17.PRINTF
	coma
X17.PRINTF:
	cpd #0
	bne  L67.PRINTF
	pulx
	pulx
	pulx
	pulx
	rts
L52.PRINTF:
	sect 0
L65.PRINTF:
	FCB 'a,'b,'c,'d,'e,'f,0
L23.PRINTF:
	FCB 40,'n,'u,'l,'l,41,0
