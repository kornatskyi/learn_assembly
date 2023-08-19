filename=$1

nasm -f elf32 -g $filename -o out.o # -g is debug flag

gcc -m32 out.o -o exec

./exec

echo "Status code:" $?
