global _start

_start:
  call myFunc
  mov eax, 1
  int 0x80

myFunc:
  mov ebx, 42
  pop eax
  jmp eax
  ; cant use ret instead of combination of pop and jmp operations 