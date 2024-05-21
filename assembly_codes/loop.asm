section	.text
   global _start        ;must be declared for using gcc
	
_start:	               ; tell linker entry point
   mov rcx, 12          ; Number of loop iterations
   mov rax, 'A'         ; Start Character of loop
	
l1:
   mov [num], rax
   mov rax, 4
   mov rbx, 1
   push rcx
	
   mov rcx, num        
   mov rdx, 1        
   int 0x80
	
   mov rax, [num]
   sub rax, '0'
   inc rax
   add rax, '0'
   pop rcx
   loop l1
	
   mov rax,1             ;system call number (sys_exit)
   int 0x80              ;call kernel

section	.bss
num resb 1