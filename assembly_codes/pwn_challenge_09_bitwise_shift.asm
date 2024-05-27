section .data

section .text
global _start

_start:


    ; main code
    mov rdi, 0x92c7dad8fa239f91 ; Move the specified 64-bit value into rdi
    shr rdi, 32 ; Shift rdi right by 32 bits
    xor rax, rax
    mov al, dil ; Move the lower 8 bits of rdi into al


    ; Exit the program (using a syscall)
    ; Note: 60 is the syscall number for exit, 0 is the exit status
    mov rax, 60
    xor rdi, rdi
    syscall