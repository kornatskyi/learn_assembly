
Assemble program
```shell
# assemble
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

```


Minimalistic C compile
```shell
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none doNothingProg1.c
```