.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode: DWORD

.data

	source BYTE 1, 2, 3, 4, 5, 6, 7, 8

.code

main PROC
	
	mov esi, 0 ;Starting index for front of array
	mov edi, LENGTHOF source - 1 ;Starting index for end of array
	mov ecx, SIZEOF source / 2 ;Process 2 elements per pass of the function

	; Saves the values on each end of the array to a register, then swap them
	L1:
		mov al, source[esi]
		mov bl, source[edi]
		mov source[edi], al
		mov source[esi], bl
		inc esi
		dec edi
		loop L1

	; This section merely demonstrates that the code works as intended by iterating through the array
	mov esi, 0
	mov ecx, SIZEOF source
	L2:
		mov al, source[esi]
		inc esi
		loop L2
		
	INVOKE ExitProcess, 0
main ENDP
END main