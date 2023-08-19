; Calculate Factorial

global main
extern printf

section .data
  msg db "Factorial of %i is %i", 0x0a, 0x00
  err db "Error occured, invalid input value. Expect input value be value between 0 and 12 but got %i", 0x0a, 0x00
  n dd 13

section .text
main:
  ; prolog
  push ebp
  mov ebp, esp

  mov eax, [n] ; mov constant to the register
  cmp eax, 0 ; check if n < 0
  jl print_error
  cmp eax, 12 ; check if n > 12, because the 13! is more than 2^31
  jg print_error

  mov ebx, 1 ; set default result to 1
  if_n_gth_zero: ; lable place where to jump
    cmp eax, 0 ; compare n to 0
    jle print ; if it less or equal jump to the pring result
    imul ebx, eax ; mult result by n - i, where i number of time n was alredy decremented
    dec eax ; decrement n
    jmp if_n_gth_zero ; jump back to the begining of the operation

  print:
  call print_result

  ; epilog
  mov esp, ebp
  pop ebp
  ret

print_result:
  push ebp
  mov ebp, esp

  push ebx
  push dword [n]
  push msg
  call printf
  add esp, 12 ; clean up the stack (3 pushes * 4 bytes each)

  mov esp, ebp
  pop ebp
  ret

print_error:
  push ebp
  mov ebp, esp

  push dword [n]
  push err
  call printf
  add esp, 8 ; clean up the stack (2 pushes * 4 bytes each)
  mov eax, 1
  mov ebx, 1 ; set status code
  int 0x80