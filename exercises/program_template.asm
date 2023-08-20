global main
extern printf

section .data
  someString db "Hello", 0x00

section .text
main:
  ;prolog
  push ebp
  mov ebp, esp

  

  ;epilog
  mov esp, ebp
  pop ebp

  ;exit
  mov eax, 1
  mov ebx, 0
  int 0x80
