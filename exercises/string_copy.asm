global main
extern printf

section .data
  someString db "hello world", 0x0a, 0x00

section .bss
  copiedString resb 13

section .text
main:
  ;prolog
  push ebp
  mov ebp, esp

  mov ecx, 0  ; iterator 
  jmp loop_condition

  loop:
    mov al,[someString+ecx]
    mov [copiedString+ecx], al
    inc ecx 

  loop_condition:
    cmp byte dword [someString+ecx], 0
    jne loop

  push copiedString
  call printf ; print copiedString
  add esp, 4

  ;epilog
  mov esp, ebp
  pop ebp

  ;exit
  mov eax, 1
  mov ebx, 0
  int 0x80
