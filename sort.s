TEX:
	.text
	.align 2
	.global main

main:

	stmfd sp!, {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,fp,lr}

		mov r9,r1
		@ldr r9, [r1,#0]
		add r0 , r0 , #-1
		mov r8 , r0 
		ldr r0,= string3
		bl printf
		mov r7 , #0
		mov r4 , #4
	EQ :
		@printf
		@@@
		cmp r7 , r8
		bgt END
		cmp r7 , #0
		bne PRINT
	ITER:
		add r7 , r7 , #1
		mov r5 , #1
		mov r6 , r5 
		
	SORT:
		mul r3 , r5 , r4
		ldr r0 , [r9,r3]
		bl atoi
		mov r10 , r0
		mul r3 , r6 , r4
		ldr r0 , [r9,r3]
		bl atoi
		cmp r10 , r0
		movlt r5 , r6 
		add r6 , r6 , #1
		cmp r6 , r8 
		bgt EQ
		b SORT

	PRINT:
		mul r3 , r5 , r4
		ldr r0 ,[r9,r3]
		bl atoi
		mov r1 , r0
		ldr r0 ,= string1
		bl printf
		mul r3 , r5 , r4
		ldr r1 ,=string2
		str r1 ,[r9,r3]
		b ITER


	END:
	ldmfd sp!, {r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,fp,lr}

	bx lr

	string1: 
	.asciz "%d "
	string2:
	.asciz "-999"
	string3:
	.asciz "Sorting result is : "

	.end
