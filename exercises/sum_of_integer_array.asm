global main
extern printf

section .data
  format_string db "Sum: %i", 0x0a, 0x00
  numbers dd 12,7,8,9,0
  len dd 4
section .text
main:
  ;prolog
  push ebp
  mov ebp, esp

  mov ecx, 0 ; iterator
  mov eax, 0 ; sum result
  loop:
  cmp ecx, [len]
  jnl end
  mov ebx, ecx ; remember ecx
  imul ecx, 4
  add eax, [numbers+ecx]
  mov ecx, ebx
  inc ecx
  jmp loop

  end:
  push eax
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
