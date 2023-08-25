global main
extern printf

section .data
  format_string db "Number: %i", 0x0a, 0x00
  nbs dd 13,7,21

section .text
main:
  ;prolog
  push ebp
  mov ebp, esp

  push dword [nbs]
  push format_string
  call printf
  add esp, 8

  push dword [nbs+4]
  push format_string
  call printf
  add esp, 8

  mov eax, 1
  mov [nbs+4], eax
  push dword [nbs+4]
  push format_string
  call printf
  add esp, 8

  ;epilog
  mov esp, ebp
  pop ebp

  ;exit
  mov eax, 1
  mov ebx, 0
  int 0x80
