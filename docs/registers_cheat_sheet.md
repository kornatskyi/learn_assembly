Here's a quick cheat sheet for registers on x86-64 architecture used in Linux for assembly language programming. Keep in mind that x86-64 extends the x86 architecture to 64-bits.

**General Purpose Registers (64-bit)**:
- RAX: accumulator for integer operations
- RBX: base register for address calculations
- RCX: counter for loop operations
- RDX: data register for I/O operations
- RSI: source index for string operations
- RDI: destination index for string operations
- RBP: base pointer for stack frames
- RSP: stack pointer for top address of the stack
- R8 - R15: additional general-purpose registers

**General Purpose Registers (32-bit counterparts)**:
- EAX, EBX, ECX, EDX, ESI, EDI, EBP, ESP

**General Purpose Registers (16-bit counterparts)**:
- AX, BX, CX, DX, SI, DI, BP, SP

**General Purpose Registers (8-bit counterparts)**:
- AH, AL, BH, BL, CH, CL, DH, DL

**Segment Registers**:
- CS: code segment
- DS: data segment
- ES: extra segment
- FS: more extra segment
- GS: even more extra segment
- SS: stack segment

**Index and Pointer Registers**:
- RSI: source index
- RDI: destination index
- RBP: base pointer (for function call frame)
- RSP: stack pointer
- RIP: instruction pointer

**Flags Register**:
- OF: Overflow Flag
- DF: Direction Flag
- IF: Interrupt Flag
- TF: Trap Flag
- SF: Sign Flag
- ZF: Zero Flag
- AF: Auxiliary Carry Flag
- PF: Parity Flag
- CF: Carry Flag

**MMX Registers (64-bit)**:
- MM0 - MM7

**XMM Registers (128-bit)**:
- XMM0 - XMM15

**YMM Registers (256-bit)**:
- YMM0 - YMM15

**ZMM Registers (512-bit)**:
- ZMM0 - ZMM31

**Control Registers**:
- CR0 - CR4, CR8

**Debug Registers**:
- DR0 - DR7

**Test Registers**:
- TR3 - TR7

**Floating Point Stack (80-bit)**:
- ST(0) - ST(7)

**System Registers**:
- GDTR, LDTR, IDTR

**Instructions Pointer**:
- RIP

Please note that not all registers are available in all modes (e.g., real mode, protected mode, long mode). Also, the use of some registers might depend on the specific instruction set extensions that are supported by the processor (e.g., SSE, AVX). Always consult the relevant documentation for your processor and operating system for precise information.