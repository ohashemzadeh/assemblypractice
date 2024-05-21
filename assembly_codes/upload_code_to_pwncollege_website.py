from pwn import *

# Write your code here
code = '''

mov rax , 0x0
mov rbx , 0x0

mov al , dil
mov bx , si
'''

context.arch = 'amd64'
p = process('/challenge/run')
p.recvline()
p.send(asm(code))
print(p.recvallS())
