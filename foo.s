        .intel_syntax noprefix                  #

        .text                                   # начинает секцию

        .section        .rodata                 # .rodata
.LC0:
        .string "%d"                            # .LC0: "#d"

        .text                                   # секция с кодом
        .globl  inputArray
        .type   inputArray, @function
inputArray:
        push    rbp                             # / сохраняем rbp на стек
        mov     rbp, rsp                        # | rbp := rsp
        sub     rsp, 32                         # \ rsp -= 32

        mov     QWORD PTR -24[rbp], rdi         # rdi - array
        mov     DWORD PTR -28[rbp], esi         # esi - n
        mov     DWORD PTR -4[rbp], 0            # i = 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR -4[rbp]          # eax := i
        lea     rdx, 0[0+rax*4]                 # rdx = rax*4
        mov     rax, QWORD PTR -24[rbp]         # rax = &array
        add     rax, rdx                        # rax = &(array[i])
        mov     rsi, rax                        # rsi := rax
        lea     rax, .LC0[rip]                  # rax := &(строчка "%d")
        mov     rdi, rax                        # rdi := rax
        call    __isoc99_scanf@PLT              # scanf("%d", rbp[-24])
        add     DWORD PTR -4[rbp], 1            # i++
.L2:
        mov     eax, DWORD PTR -4[rbp]          # eax := 'int i'
        cmp     eax, DWORD PTR -28[rbp]         # cmp 'int n' eax
        jb      .L3                             # jump <0 to .L3

        leave                                   # / выход из функции
        ret                                     # \
        .size   inputArray, .-inputArray
        .section        .rodata
.LC1:
        .string "%d "                           # .LC1: "%d "

        .text                                   # секция с кодом

        .globl  printArray
        .type   printArray, @function
printArray:
        push    rbp                             # / сохраняем rbp на стек
        mov     rbp, rsp                        # | rbp := rsp
        sub     rsp, 32                         # \ rsp -= 32

        mov     QWORD PTR -24[rbp], rdi         # rdi - array
        mov     DWORD PTR -28[rbp], esi         # esi - n
        mov     DWORD PTR -4[rbp], 0		# i = 0
        jmp     .L5
.L6:
        mov     eax, DWORD PTR -4[rbp]          # eax := i
        lea     rdx, 0[0+rax*4]			# rdx := rax * 4
        mov     rax, QWORD PTR -24[rbp]		# rax = &array
        add     rax, rdx			# rax = &(array[i])
        mov     eax, DWORD PTR [rax]		# aex = rax
	mov     esi, eax                        # esi := eax
        lea     rax, .LC1[rip]			# rax = &(строчка "%d")
        mov     rdi, rax                        # rdi := rax
        mov     eax, 0				# eax = 0
        call    printf@PLT			# printf("%d ", rbp[-24])
        add     DWORD PTR -4[rbp], 1		# i++
.L5:
        mov     eax, DWORD PTR -4[rbp] 		# eax := 'int i'
        cmp     eax, DWORD PTR -28[rbp]		# cmp int eax
        jb      .L6				# jump <0 t0 .L6

        leave                                   # / выход из функции
        ret                                     # \
        .size   printArray, .-printArray
	.globl	main
	.type	main, @function
main:
	push	rbp				# / сохраняем rbp на стек
	mov	rbp, rsp			# \ rbp := rsp
	push	r15				# сохраняем r15 на стек
	push	r14				# сохраняем r14 на стек
	push	r13				# сохраняем r13 на стек
	push	r12				# сохраняем r12 на стек
	push	rbx				# сохраняем rbx на стек	
	sub	rsp, 88				# rsp -= 88
	mov	rax, rsp			# rax := rsp
	mov	rbx, rax
	lea	rax, -92[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -92[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -64[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -112[rbp], rdx
	mov	QWORD PTR -104[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -128[rbp], rdx
	mov	QWORD PTR -120[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L8:
	cmp	rsp, rdx
	je	.L9
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L8
.L9:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L10
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L10:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -72[rbp], rax
	mov	eax, DWORD PTR -92[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -72[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	inputArray
	mov	eax, DWORD PTR -92[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -80[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	edi, 16
	mov	edx, 0
	div	rdi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L11:
	cmp	rsp, rdx
	je	.L12
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L11
.L12:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L13
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L13:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -88[rbp], rax
	mov	DWORD PTR -52[rbp], 0
	jmp	.L14
.L18:
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	test	eax, eax
	jle	.L15
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], 2
.L15:
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	test	eax, eax
	jne	.L16
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], 0
.L16:
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	test	eax, eax
	jns	.L17
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	lea	ecx, 5[rax]
	mov	rax, QWORD PTR -88[rbp]
	mov	edx, DWORD PTR -52[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], ecx
.L17:
	add	DWORD PTR -52[rbp], 1
.L14:
	mov	eax, DWORD PTR -92[rbp]
	cmp	DWORD PTR -52[rbp], eax
	jl	.L18
	mov	eax, DWORD PTR -92[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -88[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	printArray
	call	getchar@PLT
	mov	eax, 0
	mov	rsp, rbx
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
