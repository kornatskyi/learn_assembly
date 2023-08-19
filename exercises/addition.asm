global main
extern printf

section .data
  msg db "Answer %i", 0x0a, 0x00
  a dd 3
  b dd -1

section .text
main:
  ;prolog
  push ebp
  mov ebp, esp

  mov eax, [a]
  add eax, [b]
  push eax
  push msg
  call printf
  mov eax, 0
  
  ;epilog
  mov esp, ebp
  pop ebp
  ret