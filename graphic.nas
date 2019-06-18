[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_hankaku
	EXTERN	_io_load_eflags
	EXTERN	_io_cli
	EXTERN	_io_out8
	EXTERN	_io_store_eflags
[FILE "graphic.c"]
[SECTION .text]
	GLOBAL	_init_screen8
_init_screen8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	MOV	ESI,DWORD [16+EBP]
	PUSH	ESI
	MOV	EBX,DWORD [12+EBP]
	PUSH	EBX
	MOV	EDI,DWORD [8+EBP]
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	EDI
	CALL	_boxfill8
	LEA	EAX,DWORD [-10+ESI]
	PUSH	ESI
	SUB	ESI,40
	PUSH	EBX
	PUSH	EAX
	PUSH	0
	PUSH	15
	PUSH	EBX
	PUSH	EDI
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	LEA	ESI,DWORD [-50+EBX]
	PUSH	ESI
	PUSH	30
	PUSH	50
	PUSH	7
	PUSH	EBX
	PUSH	EDI
	CALL	_boxfill8
	PUSH	40
	PUSH	ESI
	PUSH	30
	PUSH	50
	PUSH	14
	PUSH	EBX
	PUSH	EDI
	CALL	_boxfill8
	LEA	EAX,DWORD [-55+EBX]
	ADD	ESP,56
	PUSH	38
	PUSH	EAX
	LEA	EAX,DWORD [-60+EBX]
	PUSH	33
	PUSH	EAX
	PUSH	1
	PUSH	EBX
	PUSH	EDI
	CALL	_boxfill8
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
	GLOBAL	_putfont8
_putfont8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	ESI,ESI
	PUSH	EBX
	MOV	EDI,DWORD [28+EBP]
	MOV	BL,BYTE [24+EBP]
L15:
	MOV	EAX,DWORD [20+EBP]
	MOV	EDX,DWORD [16+EBP]
	ADD	EAX,ESI
	IMUL	EAX,DWORD [12+EBP]
	ADD	EAX,DWORD [8+EBP]
	LEA	ECX,DWORD [EDX+EAX*1]
	MOV	DL,BYTE [ESI+EDI*1]
	TEST	DL,DL
	JNS	L7
	MOV	BYTE [ECX],BL
L7:
	MOV	AL,DL
	AND	EAX,64
	TEST	AL,AL
	JE	L8
	MOV	BYTE [1+ECX],BL
L8:
	MOV	AL,DL
	AND	EAX,32
	TEST	AL,AL
	JE	L9
	MOV	BYTE [2+ECX],BL
L9:
	MOV	AL,DL
	AND	EAX,16
	TEST	AL,AL
	JE	L10
	MOV	BYTE [3+ECX],BL
L10:
	MOV	AL,DL
	AND	EAX,8
	TEST	AL,AL
	JE	L11
	MOV	BYTE [4+ECX],BL
L11:
	MOV	AL,DL
	AND	EAX,4
	TEST	AL,AL
	JE	L12
	MOV	BYTE [5+ECX],BL
L12:
	MOV	AL,DL
	AND	EAX,2
	TEST	AL,AL
	JE	L13
	MOV	BYTE [6+ECX],BL
L13:
	AND	EDX,1
	TEST	DL,DL
	JE	L5
	MOV	BYTE [7+ECX],BL
L5:
	INC	ESI
	CMP	ESI,15
	JLE	L15
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
	GLOBAL	_putfonts8_asc
_putfonts8_asc:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	EAX
	MOV	EBX,DWORD [28+EBP]
	MOV	AL,BYTE [24+EBP]
	MOV	BYTE [-13+EBP],AL
	MOV	ESI,DWORD [16+EBP]
	MOV	EDI,DWORD [20+EBP]
	CMP	BYTE [EBX],0
	JNE	L23
L25:
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L23:
	MOVZX	EAX,BYTE [EBX]
	SAL	EAX,4
	INC	EBX
	ADD	EAX,_hankaku
	PUSH	EAX
	MOVSX	EAX,BYTE [-13+EBP]
	PUSH	EAX
	PUSH	EDI
	PUSH	ESI
	ADD	ESI,8
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_putfont8
	ADD	ESP,24
	CMP	BYTE [EBX],0
	JNE	L23
	JMP	L25
[SECTION .data]
_cursor.0:
	DB	"**************.."
	DB	"*************..."
	DB	"************...."
	DB	"***********....."
	DB	"**********......"
	DB	"*********......."
	DB	"*********......."
	DB	"**********......"
	DB	"***********....."
	DB	"*****..*****...."
	DB	"****....*****..."
	DB	"***......*****.."
	DB	"**........*****."
	DB	"*..........*****"
	DB	"............****"
	DB	".............***"
[SECTION .text]
	GLOBAL	_init_mouse_cursor8
_init_mouse_cursor8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	EDI,EDI
	PUSH	EBX
	XOR	EBX,EBX
	PUSH	ECX
	MOV	AL,BYTE [12+EBP]
	MOV	ESI,DWORD [8+EBP]
	MOV	BYTE [-13+EBP],AL
L39:
	XOR	EDX,EDX
L38:
	LEA	EAX,DWORD [EDX+EDI*1]
	CMP	BYTE [_cursor.0+EAX],42
	JE	L44
L35:
	CMP	BYTE [_cursor.0+EAX],79
	JE	L45
L36:
	CMP	BYTE [_cursor.0+EAX],46
	JE	L46
L33:
	INC	EDX
	CMP	EDX,15
	JLE	L38
	INC	EBX
	ADD	EDI,16
	CMP	EBX,15
	JLE	L39
	POP	EDX
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L46:
	MOV	CL,BYTE [-13+EBP]
	MOV	BYTE [EAX+ESI*1],CL
	JMP	L33
L45:
	MOV	BYTE [EAX+ESI*1],7
	JMP	L36
L44:
	MOV	BYTE [EAX+ESI*1],0
	JMP	L35
	GLOBAL	_putblock8_8
_putblock8_8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	ESI,ESI
	PUSH	EBX
	SUB	ESP,12
	CMP	ESI,DWORD [20+EBP]
	JGE	L59
	XOR	EDI,EDI
L57:
	XOR	EBX,EBX
	CMP	EBX,DWORD [16+EBP]
	JGE	L61
	MOV	EAX,DWORD [32+EBP]
	ADD	EAX,EDI
	MOV	DWORD [-20+EBP],EAX
L56:
	MOV	EAX,DWORD [28+EBP]
	MOV	EDX,DWORD [24+EBP]
	ADD	EAX,ESI
	ADD	EDX,EBX
	IMUL	EAX,DWORD [12+EBP]
	ADD	EAX,EDX
	MOV	ECX,DWORD [8+EBP]
	MOV	EDX,DWORD [-20+EBP]
	INC	EBX
	MOV	DL,BYTE [EDX]
	MOV	BYTE [EAX+ECX*1],DL
	INC	DWORD [-20+EBP]
	CMP	EBX,DWORD [16+EBP]
	JL	L56
L61:
	INC	ESI
	ADD	EDI,DWORD [36+EBP]
	CMP	ESI,DWORD [20+EBP]
	JL	L57
L59:
	ADD	ESP,12
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
[SECTION .data]
_table_rgb.1:
	DB	0
	DB	0
	DB	0
	DB	-1
	DB	0
	DB	0
	DB	0
	DB	-1
	DB	0
	DB	-1
	DB	-1
	DB	0
	DB	0
	DB	0
	DB	-1
	DB	-1
	DB	0
	DB	-1
	DB	0
	DB	-1
	DB	-1
	DB	-1
	DB	-1
	DB	-1
	DB	-58
	DB	-58
	DB	-58
	DB	-124
	DB	0
	DB	0
	DB	0
	DB	-124
	DB	0
	DB	-124
	DB	-124
	DB	0
	DB	0
	DB	0
	DB	-124
	DB	-124
	DB	0
	DB	-124
	DB	0
	DB	-124
	DB	-124
	DB	-124
	DB	-124
	DB	-124
[SECTION .text]
	GLOBAL	_init_palette
_init_palette:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	_table_rgb.1
	PUSH	15
	PUSH	0
	CALL	_set_palette
	LEAVE
	RET
	GLOBAL	_boxfill8
_boxfill8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	EDI
	PUSH	EDI
	MOV	AL,BYTE [16+EBP]
	MOV	ECX,DWORD [24+EBP]
	MOV	EDI,DWORD [28+EBP]
	MOV	BYTE [-13+EBP],AL
	CMP	ECX,DWORD [32+EBP]
	JG	L75
	MOV	EBX,DWORD [12+EBP]
	IMUL	EBX,ECX
L73:
	MOV	EDX,DWORD [20+EBP]
	CMP	EDX,EDI
	JG	L77
	MOV	ESI,DWORD [8+EBP]
	ADD	ESI,EBX
	ADD	ESI,EDX
	MOV	DWORD [-20+EBP],ESI
L72:
	MOV	ESI,DWORD [-20+EBP]
	MOV	AL,BYTE [-13+EBP]
	INC	EDX
	MOV	BYTE [ESI],AL
	INC	ESI
	MOV	DWORD [-20+EBP],ESI
	CMP	EDX,EDI
	JLE	L72
L77:
	INC	ECX
	ADD	EBX,DWORD [12+EBP]
	CMP	ECX,DWORD [32+EBP]
	JLE	L73
L75:
	POP	EBX
	POP	ESI
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
	GLOBAL	_set_palette
_set_palette:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	ECX
	MOV	EBX,DWORD [8+EBP]
	MOV	EDI,DWORD [12+EBP]
	MOV	ESI,DWORD [16+EBP]
	CALL	_io_load_eflags
	MOV	DWORD [-16+EBP],EAX
	CALL	_io_cli
	PUSH	EBX
	PUSH	968
	CALL	_io_out8
	CMP	EBX,EDI
	POP	EAX
	POP	EDX
	JLE	L83
L85:
	MOV	EAX,DWORD [-16+EBP]
	MOV	DWORD [8+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_io_store_eflags
L83:
	MOV	AL,BYTE [ESI]
	INC	EBX
	SHR	AL,2
	MOVZX	EAX,AL
	PUSH	EAX
	PUSH	969
	CALL	_io_out8
	MOV	AL,BYTE [1+ESI]
	SHR	AL,2
	MOVZX	EAX,AL
	PUSH	EAX
	PUSH	969
	CALL	_io_out8
	MOV	AL,BYTE [2+ESI]
	SHR	AL,2
	ADD	ESI,3
	MOVZX	EAX,AL
	PUSH	EAX
	PUSH	969
	CALL	_io_out8
	ADD	ESP,24
	CMP	EBX,EDI
	JLE	L83
	JMP	L85