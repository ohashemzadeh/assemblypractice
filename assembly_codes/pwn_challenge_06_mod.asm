
_start:
    ; MAIN CODE

    mov rdi , 0xeb7e578 ; Fill with sample value
    mov rsi , 0x1fff    ; Fill with sample value

    mov rax, rdi    ; Dividend
    mov rbx, rsi    ; Divisor

    div rbx         ; Divide rax by rbx; quotient in rax, remainder in rdx
    mov rax, rdx    ; Move the remainder to rax


    ; DO NOT REMOVE THE BELOW PART
    call _run_other_main_commands



; ................................................................................................................................


_run_other_main_commands:
    ; Print each register name and value
    call print_registers

    ; Exit
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall



section .data
    newline db 0xA, 0x0
    rax_msg db "RAX: ", 0
    rbx_msg db "RBX: ", 0
    rcx_msg db "RCX: ", 0
    rdx_msg db "RDX: ", 0
    rsi_msg db "RSI: ", 0
    rdi_msg db "RDI: ", 0
    rbp_msg db "RBP: ", 0
    rsp_msg db "RSP: ", 0
    r8_msg  db "R8:  ", 0
    r9_msg  db "R9:  ", 0
    r10_msg db "R10: ", 0
    r11_msg db "R11: ", 0
    r12_msg db "R12: ", 0
    r13_msg db "R13: ", 0
    r14_msg db "R14: ", 0
    r15_msg db "R15: ", 0

section .bss
    buf resb 17  ; Allocate 17 bytes: 16 for hex string + 1 for null terminator

section .text
    global _start

print_registers:
    ; Print RAX
    mov rsi, rax_msg
    call print_string
    mov rax, rax
    call print_reg_value
    call print_newline

    ; Print RBX
    mov rsi, rbx_msg
    call print_string
    mov rax, rbx
    call print_reg_value
    call print_newline

    ; Print RCX
    mov rsi, rcx_msg
    call print_string
    mov rax, rcx
    call print_reg_value
    call print_newline

    ; Print RDX
    mov rsi, rdx_msg
    call print_string
    mov rax, rdx
    call print_reg_value
    call print_newline

    ; Print RSI
    mov rsi, rsi_msg
    call print_string
    mov rax, rsi
    call print_reg_value
    call print_newline

    ; Print RDI
    mov rsi, rdi_msg
    call print_string
    mov rax, rdi
    call print_reg_value
    call print_newline

    ; Print RBP
    mov rsi, rbp_msg
    call print_string
    mov rax, rbp
    call print_reg_value
    call print_newline

    ; Print RSP (current value of rsp)
    mov rsi, rsp_msg
    call print_string
    mov rax, rsp
    call print_reg_value
    call print_newline

    ; Print R8
    mov rsi, r8_msg
    call print_string
    mov rax, r8
    call print_reg_value
    call print_newline

    ; Print R9
    mov rsi, r9_msg
    call print_string
    mov rax, r9
    call print_reg_value
    call print_newline

    ; Print R10
    mov rsi, r10_msg
    call print_string
    mov rax, r10
    call print_reg_value
    call print_newline

    ; Print R11
    mov rsi, r11_msg
    call print_string
    mov rax, r11
    call print_reg_value
    call print_newline

    ; Print R12
    mov rsi, r12_msg
    call print_string
    mov rax, r12
    call print_reg_value
    call print_newline

    ; Print R13
    mov rsi, r13_msg
    call print_string
    mov rax, r13
    call print_reg_value
    call print_newline

    ; Print R14
    mov rsi, r14_msg
    call print_string
    mov rax, r14
    call print_reg_value
    call print_newline

    ; Print R15
    mov rsi, r15_msg
    call print_string
    mov rax, r15
    call print_reg_value
    call print_newline

    ret

print_string:
    ; Find the length of the string
    mov rdx, 0
.next_char:
    cmp byte [rsi + rdx], 0
    je .string_end
    inc rdx
    jmp .next_char
.string_end:

    ; Print the string
    mov rax, 1         ; syscall: write
    mov rdi, 1         ; file descriptor: stdout
    syscall
    ret

print_reg_value:
    ; Convert the value in RAX to a string
    mov rbx, 16         ; Base 16
    lea rcx, [buf + 16] ; Write pointer to the end of buffer
    mov byte [rcx], 0   ; Null-terminate the string

.convert:
    dec rcx
    xor rdx, rdx
    div rbx
    add dl, '0'
    cmp dl, '9'
    jle .store
    add dl, 7

.store:
    mov [rcx], dl
    test rax, rax
    jnz .convert

    ; Print the string
    mov rdx, buf + 16
    sub rdx, rcx
    mov rsi, rcx
    mov rax, 1         ; syscall: write
    mov rdi, 1         ; file descriptor: stdout
    syscall
    ret

print_newline:
    mov rsi, newline
    mov rdx, 1
    mov rax, 1         ; syscall: write
    mov rdi, 1         ; file descriptor: stdout
    syscall
    ret
