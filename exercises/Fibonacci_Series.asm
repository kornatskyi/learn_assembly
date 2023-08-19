global main
extern printf

section .data
  msg db "The Fibonacci number for the series length %i is %i", 0x0a, 0x00
  err_negative db "Input Error: n should be >= 0", 0x0a, 0x00
  err_too_big db "Input Error: n should be <= 46", 0x0a, 0x00
  n dd 464; define n

section .text
main:
  ; prolog
  push ebp
  mov ebp, esp

  ; if less than zero print error
  mov ecx, [n]
  cmp ecx, 0
  jl print_less_than_zero_error ; print error if n less than 0

  ; if less than zero print error
  cmp ecx, 46
  jge print_more_than_limit_error ; print error if n more than 46

  ; if equals to zero print zero
  mov eax, 0 ; new set to 0
  cmp ecx, 0
  je print_result ; print error if n less than 0

  ; set default values
  mov ebx, 1 ; cur
  mov edx, 1 ; prev
  mov eax, 1 ; new

  ; loop
  repeat:
    dec ecx
    cmp ecx, 1
    jle print_result
    mov eax, ebx ; new = cur
    add eax, edx ; new = new + prev
    mov edx, ebx ; prev = cur
    mov ebx, eax ; cur = new
    jmp repeat

  print_result:
    push eax
    push dword [n]
    push msg
    call printf
    add esp, 12 ; clean up the stack

  ; epilog
  mov esp, ebp
  pop ebp

  ; exit the program
  mov eax, 1   ; syscall number for exit on x86-64 architecture
  mov ebx, 0 ; exit status code
  int 0x80       ; invoke syscall

print_less_than_zero_error:
  push ebp
  mov ebp, esp

  push err_negative
  call printf
  add esp, 4

  mov esp, ebp
  pop ebp

  ; exit the program
  mov eax, 1   ; syscall number for exit on x86-64 architecture
  mov ebx, 1 ; exit status code
  int 0x80       ; invoke syscall

print_more_than_limit_error:
  push ebp
  mov ebp, esp

  push err_too_big
  call printf
  add esp, 4

  mov esp, ebp
  pop ebp

  ; exit the program
  mov eax, 1   ; syscall number for exit on x86-64 architecture
  mov ebx, 1 ; exit status code
  int 0x80       ; invoke syscall

