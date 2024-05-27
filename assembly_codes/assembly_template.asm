section .data

section .text
global _start

_start:


    ; main code
    mov rax, 0xa


    ; Exit the program (using a syscall)
    ; Note: 60 is the syscall number for exit, 0 is the exit status
    mov rax, 60
    xor rdi, rdi
    syscall