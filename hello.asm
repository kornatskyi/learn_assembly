section .data
hello_message db 'Hello, World!',0
another_var db 'Some value',0

section .text
global _start
_start:
    ; Write the message to stdout
    mov eax, 4
    mov ebx, 1
    mov ecx, hello_message
    mov edx, 13
    int 0x80
    
    ; Exit the program
    mov eax, 1
    int 0x80
