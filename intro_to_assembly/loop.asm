global _start

section .text
_start:
  mov ebx, 1
  mov ecx, 5
label:
  add ebx, ebx
  dec ecx ; decrement ecx -= 1
  cmp ecx, 0
  jg label
  mov eax, 1
  int 0x80
