FILE_NAME=pwn_challenge_08

nasm -f elf64 -o $FILE_NAME.o $FILE_NAME.asm;
ld -o $FILE_NAME $FILE_NAME.o;
objcopy -O binary --only-section=.text ./$FILE_NAME.o ./$FILE_NAME.bin;
./$FILE_NAME