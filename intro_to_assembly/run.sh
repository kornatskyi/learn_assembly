
filename=$1

nasm -f elf32 $filename -o out.o

ld -m elf_i386 -o exec out.o

./exec

echo "Status code:" $?