```shell
# assemble
nasm -f elf32 add42.asm -o add42.o

# compile and link

gcc -m32 add42.o main.c -o ex11

```