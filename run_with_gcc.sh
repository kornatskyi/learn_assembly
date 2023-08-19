filename=$1

nasm -f elf32 $filename -o out.o

gcc -m32 out.o -o exec

./exec

echo "Status code:" $?
