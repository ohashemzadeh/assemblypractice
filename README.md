# assemblypractice

# How to run assembly code with .asm extension:

- `apt install nasm`

- Change the `FILE_NAME` variable and run the below bash code:

```bash
FILE_NAME=test_01

nasm -f elf64 -o $FILE_NAME.o $FILE_NAME.asm;
ld -o $FILE_NAME $FILE_NAME.o;
objcopy -O binary --only-section=.text ./$FILE_NAME.o ./$FILE_NAME.bin;
./$FILE_NAME
```

# Extracting the Binary Code

- `objcopy --dump-section .text=helloworld_binary_code helloworld`

# How to check object <file(s)>

- `readelf -a hello_world`

and 
- To disassemble your program:
- `objdump -d -M intel -d hello_world`

# How to solve challenges in `pwncollege` website:

- Here we are gonna practice some assembly.
- https://pwn.college/fundamentals/assembly-crash-course


- First set the ssh key according to this page.
https://www.youtube.com/watch?v=DJO1A2neZ6Y

- Then connect to your practice machine by this command:
`ssh -i key hacker@dojo.pwn.college`

- Press `start` button on each challenge page.

- Run `/challenge/run` in terminal to see the question (challenge).

- `ipython3`


Then Write the answer to the question in the code below

```python
from pwn import *


code = '''
mov rdi, 0x92c7dad8fa239f91
shr rdi, 32
xor rax, rax
mov al, dil
'''

context.arch = 'amd64'
p = process('/challenge/run')
p.recvline()
p.send(asm(code))
print(p.recvallS())
```

- Then we copy the last line (answer) in the pwncollege flag.
