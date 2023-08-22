
Assemble program
```shell
# assemble

# NASM assembler
nasm -f elf32 <file_name.asm> -o <output_file_name.o>

# link
ld -m elf_i386 <file_name.o> -o <exec_file_name>

# GNU assembler
as --gstabs -o doNothingByProgrammer.o doNothingByProgrammer.s
# link
gcc -o doNothingByProgrammer doNothingByProgrammer.o
```

Run `gdb`

```shell
gdb ./doNothingByProgrammer

# set configurations in gdb
set disassembly-flavor intel

# set a breakpoint on main function
b main
# run the program
r

# enable TUI
tui enable

# split TUI to see registers
layout regs 

# with tui enable
gdb -tui -ex "layout regs" exec

```


Minimalistic C compile
```shell
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none <program.c>


# for x32
gcc -m32 -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none <program.c>
```