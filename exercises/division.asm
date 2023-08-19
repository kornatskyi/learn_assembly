; The div instruction in x86 assembly divides the value in the edx:eax register
; pair by the given operand, where edx holds the high-order 32 bits and eax 
; holds the low-order 32 bits of the dividend.
; The result is stored in eax (quotient) and edx (remainder)
global main
extern printf

section .data
  msg db "Quotient: %i, Remainder: %i", 0x0a, 0x00
  a dd 123 
  b dd 32

section .text
main:
  ;prolog
  push ebp
  mov ebp, esp
  
  ; devide
  xor edx, edx ; clear edx
  mov eax, [a]
  mov ebx, [b]
  div ebx

  ; call printf
  push edx ; push reminder
  push eax ; push quotient
  push msg
  call printf
  add esp, 12 ; clean up the stack (3 pushes * 4 bytes each)
  mov eax, 0
  
  ;epilog
  mov esp, ebp
  pop ebp
  ret