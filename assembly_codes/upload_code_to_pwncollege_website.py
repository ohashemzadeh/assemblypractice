from pwn import *

# Write your code here
code = '''

mov rax, rdi
mov rbx, rsi

div rbx
mov rax, rdx

'''

context.arch = 'amd64'
p = process('/challenge/run')
p.recvline()
p.send(asm(code))
print(p.recvallS())
