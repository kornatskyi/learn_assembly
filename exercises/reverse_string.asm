; Reverse string using the stack, and print chars from the stack
global main
extern printf

section .data
  format_string db "%c", 0x0a, 0x00 ; format_string
  string db "hello world", 0x00 ; string to reverse

section .text
main:
  ; prolog
  push ebp
  mov ebp, esp

  mov ecx, 0 ; iterator
  push_loop: ; push all characters onto the stack
    mov al, [string+ecx]
    push eax
    inc ecx
    cmp al, 0
    jne push_loop

  pop_loop:
    pop eax ; pop the last character from the stack
    push ecx ; save value of ecx(which is loop counter here), because printf function erases it
    push eax  ; push the character back onto the stack as an argument for printf
    push format_string ; push format_string as a first argument
    call printf
    add esp, 8 ; cleanup stack arguments
    pop ecx ; get ecx value from the top of the stack
    dec ecx 
    cmp ecx, 0
    jne pop_loop ; continue until ecx is 0

  ; epilog
  mov esp, ebp
  pop ebp

  ; exit
  mov eax, 1
  mov ebx, 0
  int 0x80

