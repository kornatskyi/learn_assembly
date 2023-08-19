nasm -v -w+all -f elf hello.asm
ld -m elf_i386 -s -o hello hello.o
qemu-i386 -d cpu,in_asm hello
