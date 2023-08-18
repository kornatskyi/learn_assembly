```asm
section .text
global _start

_start:

    ; RAX register (accumulator for integer operations)
    mov rax, 1          ; Move 1 into RAX
    add rax, 2          ; Add 2 to RAX

    ; RBX register (base register for address calculations)
    mov rbx, rax        ; Move value from RAX to RBX
    add rbx, 3          ; Add 3 to RBX

    ; RCX register (counter for loop operations)
    mov rcx, 5          ; Set RCX to 5 (loop counter)
loop1:
    sub rcx, 1          ; Decrement RCX by 1
    jnz loop1           ; Jump to loop1 if RCX is not zero

    ; RDX register (data register for I/O operations)
    mov rdx, 8          ; Move 8 into RDX

    ; RSI register (source index for string operations)
    mov rsi, rdx        ; Copy RDX to RSI

    ; RDI register (destination index for string operations)
    mov rdi, rsi        ; Copy RSI to RDI

    ; RBP register (base pointer for stack frames)
    mov rbp, rsp        ; Copy stack pointer to base pointer

    ; RSP register (stack pointer for top address of the stack)
    add rsp, 16         ; Adjust stack pointer

    ; R8 register (additional general-purpose register)
    mov r8, 10          ; Move 10 into R8

    ; R9 register (additional general-purpose register)
    mov r9, r8          ; Copy R8 to R9

    ; R10 register (additional general-purpose register)
    mov r10, 20         ; Move 20 into R10

    ; R11 register (additional general-purpose register)
    mov r11, r10        ; Copy R10 to R11

    ; R12 register (additional general-purpose register)
    mov r12, 30         ; Move 30 into R12

    ; R13 register (additional general-purpose register)
    mov r13, r12        ; Copy R12 to R13

    ; R14 register (additional general-purpose register)
    mov r14, 40         ; Move 40 into R14

    ; R15 register (additional general-purpose register)
    mov r15, r14        ; Copy R14 to R15

    ; Exit the program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall             ; invoke syscall

```
