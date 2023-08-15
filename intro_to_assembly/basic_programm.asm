global _start
_start:
  mov eax, 42     ; Value for multiplication
  mov ebx, 2      ; Another value for multiplication
  mul ebx         ; Multiply eax by ebx, result is in edx:eax
  mov ebx, eax
  ; For the purpose of this example, let's just use the value in eax as the exit status.
  ; You might want to handle overflows or use a fixed value.
  mov eax, eax
  

  mov eax, 1      ; sys_exit system call number
  int 0x80        ; make the system call
