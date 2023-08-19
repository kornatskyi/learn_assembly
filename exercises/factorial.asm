; Factorial without error and special case handling 

global main
extern printf

section .data
  msg db "Factorial of %i is %i", 0x0a, 0x00
  n dd 1

section .text
main:
  ; prolog
  push ebp
  mov ebp, esp
  
  mov eax, [n] ; mov constant to the register
  mov ebx, 1 ; set default result to 1
  if_n_gth_zero: ; lable place where to jump
    imul ebx, eax ; mult result by n - i, where i number of time n was decremented
    dec eax ; decrement n
    cmp eax, 1 ; check if n is still more than 1
    jg if_n_gth_zero ; if so jump to the start and do the operation again

  push ebx
  push dword [n]
  push msg
  call printf

  ; epilog
  mov esp, ebp
  pop ebp
  ret
