	sect 1
_Version:
	FCB 49,46,49,0
	sect 0
_main:
	pshx
	tsx
	ldd #L3.dhry
	std 0,x
	jsr  _printf
	tsx
	jsr  _Proc0
	tsx
	pulx
	rts
L2.dhry:
_Proc0:
;  IntLoc3 -> 16,x
; CharIndex -> 18,x
;  IntLoc1 -> 20,x
; String1Loc -> 22,x
; String2Loc -> 54,x
;  IntLoc2 -> 86,x
;  EnumLoc -> 88,x
;        i -> 90,x
	tsx
	xgdx
	subd #92
	xgdx
	txs
	ldd #_x1
	std  _PtrGlbNext
	ldd #_x2
	std  _PtrGlb
	ldd  _PtrGlbNext
	ldy  _PtrGlb
	std 0,y
	ldd #0
	pshb
	psha
	ldd  _PtrGlb
	addd #2
	xgdy
	pula
	pulb
	stab 0,y
	ldd #2
	pshb
	psha
	ldd  _PtrGlb
	addd #3
	xgdy
	pula
	pulb
	stab 0,y
	ldd #40
	pshb
	psha
	ldd  _PtrGlb
	addd #4
	xgdy
	pula
	pulb
	std 0,y
	ldd  _PtrGlb
	addd #6
	std 0,x
	ldd #L5.dhry
	std 2,x
	jsr  _strcpy
	tsx
	xgdx
	tsx
	addd #22
	std 0,x
	ldd #L6.dhry
	std 2,x
	jsr  _strcpy
	tsx
	ldd #10
	std  _Array2Glob+816+14
	ldd #0
	std 90,x
	jmp  L12.dhry
L9.dhry:
	jsr  _Proc5
	tsx
	jsr  _Proc4
	tsx
	ldd #2
	std 20,x
	ldd #3
	std 86,x
	xgdx
	tsx
	addd #54
	std 0,x
	ldd #L13.dhry
	std 2,x
	jsr  _strcpy
	tsx
	ldab #1
	stab 88,x
	xgdx
	tsx
	addd #22
	std 0,x
	xgdx
	tsx
	addd #54
	std 2,x
	jsr  _Func2
	tsx
	cpd #0
	bne  L15.dhry
	ldd #1
	std 14,x
	jmp  L16.dhry
L15.dhry:
	ldd #0
	std 14,x
L16.dhry:
	ldd 14,x
	std  _BoolGlob
	jmp  L18.dhry
L17.dhry:
	ldd #5
	pshb
	psha
	ldd 20,x
	std 12,x
	xgdy
	pula
	pulb
	jsr  __muli
	pshb
	psha
	ldd 86,x
	std 10,x
	nega
	negb
	sbca #0
	tsy
	addd 0,y
	puly
	std 16,x
	ldd 12,x
	std 0,x
	ldd 10,x
	std 2,x
	xgdx
	tsx
	addd #16
	std 4,x
	jsr  _Proc7
	tsx
	ldd 20,x
	addd #1
	std 20,x
L18.dhry:
	ldd 20,x
	cpd 86,x
	blt  L17.dhry
	ldd #_Array1Glob
	std 0,x
	ldd #_Array2Glob
	std 2,x
	ldd 20,x
	std 4,x
	ldd 16,x
	std 6,x
	jsr  _Proc8
	tsx
	ldd  _PtrGlb
	std 0,x
	jsr  _Proc1
	tsx
	ldab #65
	stab 18,x
	jmp  L23.dhry
L20.dhry:
	ldab 18,x
	clra
	tstb
	bpl X0.dhry
	coma
X0.dhry:
	std 0,x
	ldd #67
	std 2,x
	jsr  _Func1
	tsx
	std 8,x
	ldab 88,x
	clra
	pshb
	psha
	ldd 8,x
	clra
	tsy
	cpd 0,y
	puly
	bne  L24.dhry
	ldd #0
	std 0,x
	xgdx
	tsx
	addd #88
	std 2,x
	jsr  _Proc6
	tsx
L24.dhry:
L21.dhry:
	ldab 18,x
	clra
	tstb
	bpl X1.dhry
	coma
X1.dhry:
	addd #1
	stab 18,x
L23.dhry:
	ldab 18,x
	clra
	tstb
	bpl X2.dhry
	coma
X2.dhry:
	pshb
	psha
	ldab  _Char2Glob
	clra
	tstb
	bpl X3.dhry
	coma
X3.dhry:
	tsy
	cpd 0,y
	puly
	bge  L20.dhry
	ldd 86,x
	pshb
	psha
	ldd 20,x
	std 12,x
	xgdy
	pula
	pulb
	jsr  __muli
	std 16,x
	std 10,x
	ldy 12,x
	jsr  __divi
	std 86,x
	ldd #7
	pshb
	psha
	ldd 10,x
	subd 86,x
	xgdy
	pula
	pulb
	jsr  __muli
	subd 12,x
	std 86,x
	xgdx
	tsx
	addd #20
	std 0,x
	jsr  _Proc2
	tsx
L10.dhry:
	ldd 90,x
	addd #1
	std 90,x
L12.dhry:
	ldd 90,x
	cpd #5000
	bhs X4.dhry
	jmp  L9.dhry
X4.dhry:
	ldd #L26.dhry
	std 0,x
	jsr  _printf
	tsx
	xgdx
	addd #92
	xgdx
	txs
	rts
L4.dhry:
_Proc1:
; PtrParIn -> 16,x
	tsx
	xgdx
	subd #14
	xgdx
	txs
	ldy 16,x
	ldd 0,y
	ldy  _PtrGlb
	xgdx
	ldd #38
	jsr  __asgnblk
	tsx
	ldd #5
	pshb
	psha
	ldd 16,x
	addd #4
	xgdy
	pula
	pulb
	std 0,y
	ldd 16,x
	std 12,x
	addd #4
	xgdy
	ldd 0,y
	pshb
	psha
	ldy 12,x
	ldd 0,y
	addd #4
	xgdy
	pula
	pulb
	std 0,y
	ldy 16,x
	ldd 0,y
	std 10,x
	ldy 10,x
	std 0,y
	ldy 16,x
	ldd 0,y
	std 0,x
	jsr  _Proc3
	tsx
	ldy 16,x
	ldd 0,y
	addd #2
	xgdy
	ldab 0,y
	clra
	cpd #0
	bne  L33.dhry
	ldd #6
	pshb
	psha
	ldy 16,x
	ldd 0,y
	addd #4
	xgdy
	pula
	pulb
	std 0,y
	ldd 16,x
	std 8,x
	addd #3
	xgdy
	ldab 0,y
	clra
	std 0,x
	ldy 8,x
	ldd 0,y
	addd #3
	std 2,x
	jsr  _Proc6
	tsx
	ldy  _PtrGlb
	ldd 0,y
	ldy 16,x
	ldy 0,y
	std 0,y
	ldy 16,x
	ldd 0,y
	addd #4
	std 6,x
	xgdy
	ldd 0,y
	std 0,x
	ldd #10
	std 2,x
	ldd 6,x
	std 4,x
	jsr  _Proc7
	tsx
	jmp  L34.dhry
L33.dhry:
	ldd 16,x
	std 8,x
	ldy 8,x
	ldy 0,y
	xgdx
	ldd #38
	jsr  __asgnblk
	tsx
L34.dhry:
	xgdx
	addd #14
	xgdx
	txs
	rts
L32.dhry:
_Proc2:
;   IntLoc -> 0,x
;  EnumLoc -> 2,x
; IntParIO -> 6,x
	pshx
	pshx
	tsx
	ldy 6,x
	ldd 0,y
	addd #10
	std 0,x
L41.dhry:
	ldab  _Char1Glob
	clra
	tstb
	bpl X5.dhry
	coma
X5.dhry:
	cpd #65
	bne  L45.dhry
	ldd 0,x
	subd #1
	std 0,x
	subd  _IntGlob
	ldy 6,x
	std 0,y
	ldab #0
	stab 2,x
L45.dhry:
	ldab 2,x
	clra
	cpd #0
	bne  L41.dhry
L43.dhry:
	pulx
	pulx
	rts
L40.dhry:
_Proc3:
; PtrParOut -> 8,x
	pshx
	pshx
	pshx
	tsx
	ldd  _PtrGlb
	cpd #0
	beq  L50.dhry
	ldy  _PtrGlb
	ldd 0,y
	ldy 8,x
	std 0,y
	jmp  L51.dhry
L50.dhry:
	ldd #100
	std  _IntGlob
L51.dhry:
	ldd #10
	std 0,x
	ldd  _IntGlob
	std 2,x
	ldd  _PtrGlb
	addd #4
	std 4,x
	jsr  _Proc7
	tsx
	pulx
	pulx
	pulx
	rts
L49.dhry:
_Proc4:
;  BoolLoc -> 2,x
	pshx
	pshx
	tsx
	ldab  _Char1Glob
	clra
	tstb
	bpl X6.dhry
	coma
X6.dhry:
	cpd #65
	bne  L54.dhry
	ldd #1
	std 0,x
	jmp  L55.dhry
L54.dhry:
	ldd #0
	std 0,x
L55.dhry:
	ldd 0,x
	std 2,x
	oraa  _BoolGlob
	orab  _BoolGlob+1
	std 2,x
	ldab #66
	stab  _Char2Glob
	pulx
	pulx
	rts
L52.dhry:
_Proc5:
	ldab #65
	stab  _Char1Glob
	ldd #0
	std  _BoolGlob
	rts
L56.dhry:
L71.dhry:
	FDB L63.dhry
	FDB L64.dhry
	FDB L67.dhry
	FDB L61.dhry
	FDB L69.dhry
_Proc6:
; EnumParOut -> 10,x
; EnumParIn -> 8,x
	pshx
	pshx
	pshx
	tsx
	ldd 8,x
	stab 8,x
	ldab 8,x
	ldy 10,x
	stab 0,y
	ldab 8,x
	clra
	std 0,x
	jsr  _Func3
	tsx
	cpd #0
	bne  L58.dhry
	ldab #3
	ldy 10,x
	stab 0,y
L58.dhry:
	ldab 8,x
	clra
	std 4,x
	std 2,x
	cpd #0
	blt  L60.dhry
	ldd 2,x
	cpd #4
	bgt  L60.dhry
	ldd 2,x
	lsld
	addd #L71.dhry
	xgdy
	ldy 0,y
	jmp 0,y
L60.dhry:
	jmp  L61.dhry
L63.dhry:
	ldab #0
	ldy 10,x
	stab 0,y
	jmp  L61.dhry
L64.dhry:
	ldd  _IntGlob
	cpd #100
	ble  L65.dhry
	ldab #0
	ldy 10,x
	stab 0,y
	jmp  L61.dhry
L65.dhry:
	ldab #3
	ldy 10,x
	stab 0,y
	jmp  L61.dhry
L67.dhry:
	ldab #1
	ldy 10,x
	stab 0,y
	jmp  L61.dhry
L69.dhry:
	ldab #2
	ldy 10,x
	stab 0,y
	jmp  L60.dhry
L61.dhry:
	pulx
	pulx
	pulx
	rts
L57.dhry:
_Proc7:
;   IntLoc -> 0,x
; IntParOut -> 8,x
; IntParI2 -> 6,x
; IntParI1 -> 4,x
	pshx
	tsx
	ldd 4,x
	addd #2
	std 0,x
	ldd 6,x
	addd 0,x
	ldy 8,x
	std 0,y
	pulx
	rts
L73.dhry:
_Proc8:
;   IntLoc -> 16,x
; IntIndex -> 18,x
; IntParI2 -> 28,x
; IntParI1 -> 26,x
; Array2Par -> 24,x
; Array1Par -> 22,x
	tsx
	xgdx
	subd #20
	xgdx
	txs
	ldd 26,x
	addd #5
	std 16,x
	ldd 28,x
	pshb
	psha
	ldd 16,x
	lsld
	addd 22,x
	xgdy
	pula
	pulb
	std 0,y
	ldd 16,x
	lsld
	std 14,x
	pshb
	psha
	ldd 22,x
	std 12,x
	tsy
	addd 0,y
	puly
	xgdy
	ldd 0,y
	pshb
	psha
	ldd 14,x
	addd #2
	addd 12,x
	xgdy
	pula
	pulb
	std 0,y
	ldd 16,x
	std 10,x
	pshb
	psha
	ldd 10,x
	lsld
	addd #60
	addd 22,x
	xgdy
	pula
	pulb
	std 0,y
	ldd 16,x
	std 18,x
	jmp  L78.dhry
L75.dhry:
	ldd 16,x
	std 8,x
	pshb
	psha
	ldd 18,x
	lsld
	pshb
	psha
	ldd #102
	ldy 8,x
	jsr  __muli
	addd 24,x
	tsy
	addd 0,y
	puly
	xgdy
	pula
	pulb
	std 0,y
L76.dhry:
	ldd 18,x
	addd #1
	std 18,x
L78.dhry:
	ldd 18,x
	pshb
	psha
	ldd 16,x
	addd #1
	tsy
	cpd 0,y
	puly
	bge  L75.dhry
	ldd 16,x
	std 6,x
	lsld
	subd #2
	pshb
	psha
	ldd #102
	ldy 6,x
	jsr  __muli
	addd 24,x
	tsy
	addd 0,y
	puly
	std 4,x
	xgdy
	ldd 0,y
	addd #1
	ldy 4,x
	std 0,y
	ldd 16,x
	std 2,x
	lsld
	std 0,x
	addd 22,x
	xgdy
	ldd 0,y
	pshb
	psha
	ldd 0,x
	pshb
	psha
	ldd #102
	ldy 2,x
	jsr  __muli
	addd #2040
	addd 24,x
	tsy
	addd 0,y
	puly
	xgdy
	pula
	pulb
	std 0,y
	ldd #5
	std  _IntGlob
	xgdx
	addd #20
	xgdx
	txs
	rts
L74.dhry:
_Func1:
; CharLoc2 -> 0,x
; CharLoc1 -> 2,x
; CharPar2 -> 8,x
; CharPar1 -> 6,x
	pshx
	pshx
	tsx
	ldd 6,x
	stab 6,x
	ldd 8,x
	stab 8,x
	ldab 6,x
	stab 2,x
	ldab 2,x
	stab 0,x
	ldab 0,x
	clra
	tstb
	bpl X7.dhry
	coma
X7.dhry:
	pshb
	psha
	ldab 8,x
	clra
	tstb
	bpl X8.dhry
	coma
X8.dhry:
	tsy
	cpd 0,y
	puly
	beq  L88.dhry
	ldd #0
	pulx
	pulx
	rts
L88.dhry:
	ldd #1
	pulx
	pulx
	rts
L87.dhry:
_Func2:
;   IntLoc -> 8,x
;  CharLoc -> 10,x
; StrParI2 -> 16,x
; StrParI1 -> 14,x
	tsx
	xgdx
	subd #12
	xgdx
	txs
	ldd #1
	std 8,x
	jmp  L92.dhry
L91.dhry:
	ldd 8,x
	std 6,x
	addd 14,x
	xgdy
	ldab 0,y
	clra
	tstb
	bpl X9.dhry
	coma
X9.dhry:
	std 0,x
	ldd 6,x
	addd #1
	addd 16,x
	xgdy
	ldab 0,y
	clra
	tstb
	bpl X10.dhry
	coma
X10.dhry:
	std 2,x
	jsr  _Func1
	tsx
	clra
	cpd #0
	bne  L94.dhry
	ldab #65
	stab 10,x
	ldd 8,x
	addd #1
	std 8,x
L94.dhry:
L92.dhry:
	ldd 8,x
	cpd #1
	ble  L91.dhry
	ldab 10,x
	clra
	tstb
	bpl X11.dhry
	coma
X11.dhry:
	std 4,x
	cpd #87
	blt  L96.dhry
	ldd 4,x
	cpd #90
	bgt  L96.dhry
	ldd #7
	std 8,x
L96.dhry:
	ldab 10,x
	clra
	tstb
	bpl X12.dhry
	coma
X12.dhry:
	cpd #88
	bne  L98.dhry
	ldd #1
	xgdx
	addd #12
	xgdx
	txs
	rts
L98.dhry:
	ldd 14,x
	std 0,x
	ldd 16,x
	std 2,x
	jsr  _strcmp
	tsx
	cpd #0
	ble  L100.dhry
	ldd 8,x
	addd #7
	std 8,x
	ldd #1
	xgdx
	addd #12
	xgdx
	txs
	rts
L100.dhry:
	ldd #0
	xgdx
	addd #12
	xgdx
	txs
	rts
L90.dhry:
_Func3:
;  EnumLoc -> 0,x
; EnumParIn -> 4,x
	pshx
	tsx
	ldd 4,x
	stab 4,x
	ldab 4,x
	stab 0,x
	ldab 0,x
	clra
	cpd #2
	bne  L105.dhry
	ldd #1
	pulx
	rts
L105.dhry:
	ldd #0
	pulx
	rts
L104.dhry:
_strcpy:
;        s -> 10,x
;        d -> 8,x
	pshx
	pshx
	pshx
	tsx
L108.dhry:
L109.dhry:
	ldd 8,x
	std 4,x
	addd #1
	std 8,x
	ldd 10,x
	std 2,x
	addd #1
	std 10,x
	ldy 2,x
	ldab 0,y
	std 0,x
	ldy 4,x
	stab 0,y
	ldd 0,x
	clra
	tstb
	bpl X13.dhry
	coma
X13.dhry:
	cpd #0
	bne  L108.dhry
	pulx
	pulx
	pulx
	rts
L107.dhry:
_strcmp:
;        s -> 8,x
;        d -> 6,x
	pshx
	pshx
	tsx
	jmp  L116.dhry
L115.dhry:
	ldd 6,x
	addd #1
	std 6,x
	ldd 8,x
	addd #1
	std 8,x
L116.dhry:
	ldy 6,x
	ldab 0,y
	clra
	tstb
	bpl X14.dhry
	coma
X14.dhry:
	std 2,x
	cpd #0
	beq  L118.dhry
	ldd 2,x
	pshb
	psha
	ldy 8,x
	ldab 0,y
	clra
	tstb
	bpl X15.dhry
	coma
X15.dhry:
	tsy
	cpd 0,y
	puly
	beq  L115.dhry
L118.dhry:
	ldy 6,x
	ldab 0,y
	clra
	tstb
	bpl X16.dhry
	coma
X16.dhry:
	pshb
	psha
	ldy 8,x
	ldab 0,y
	clra
	tstb
	bpl X17.dhry
	coma
X17.dhry:
	tsy
	cpd 0,y
	puly
	bne  L120.dhry
	ldd #1
	std 0,x
	jmp  L121.dhry
L120.dhry:
	ldd #0
	std 0,x
L121.dhry:
	ldd 0,x
	pulx
	pulx
	rts
L114.dhry:
	sect 1
_PtrGlbNext:
	RMB 2
_PtrGlb:
	RMB 2
_Array2Glob:
	RMB 5202
_Array1Glob:
	RMB 102
_Char2Glob:
	RMB 1
_Char1Glob:
	RMB 1
_BoolGlob:
	RMB 2
_IntGlob:
	RMB 2
_x2:
	RMB 38
_x1:
	RMB 38
	sect 0
L26.dhry:
	FCB 'D,'h,'r,'y,'s,'t,'o,'n,'e,32,'d,'o,'n,'e,10,0
L13.dhry:
	FCB 'D,'H,'R,'Y,'S,'T,'O,'N,'E,32,'P,'R,'O,'G,'R,'A
	FCB 'M,44,32,50,39,'N,'D,32,'S,'T,'R,'I,'N,'G,0
L6.dhry:
	FCB 'D,'H,'R,'Y,'S,'T,'O,'N,'E,32,'P,'R,'O,'G,'R,'A
	FCB 'M,44,32,49,39,'S,'T,32,'S,'T,'R,'I,'N,'G,0
L5.dhry:
	FCB 'D,'H,'R,'Y,'S,'T,'O,'N,'E,32,'P,'R,'O,'G,'R,'A
	FCB 'M,44,32,'S,'O,'M,'E,32,'S,'T,'R,'I,'N,'G,0
L3.dhry:
	FCB 'd,'h,'r,'y,'s,'t,'o,'n,'e,32,45,32,49,46,49,32
	FCB 40,'C,47,49,46,49,44,32,48,49,47,48,54,47,56,54
	FCB 41,10,0
