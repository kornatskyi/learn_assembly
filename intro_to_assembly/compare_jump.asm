global _start

section .text
_start:
  mov ecx, 99
  mov ebx, 42
  mov eax, 1
  cmp ecx, 100 ; compoare ecx to 100
  jl skip ; jump if less than
  mov ebx, 13
skip:
  int 0x80