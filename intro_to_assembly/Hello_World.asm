; Make the _start label accessible from outside this file (e.g., for linking)
global _start

; Start the data section where we can define data to be used in our program
section .data
  ; Define a string named 'msg' with the text "Hello, world" followed by a newline (0x0a in hex)
  msg db "Hello, world", 0x0a
  
  ; Define a constant 'len' which holds the length of 'msg'. 
  ; The $ symbol represents the current address in memory, so $ - msg calculates the difference 
  ; between the current address and the address where 'msg' starts, giving the length of 'msg'.
  ; this calculated during the assembly time
  len equ $ - msg

; Start the text section where the actual code of our program resides
section .text
_start: ; The entry point of our program
  mov eax, 4        ; Set eax to 4, which is the system call number for sys_write
  mov ebx, 1        ; Set ebx to 1, which represents the STDOUT file descriptor
  mov ecx, msg      ; Set ecx to point to the 'msg' string, this is the data we want to write
  mov edx, len      ; Set edx to the length of 'msg', which tells the system how many bytes to write
  int 0x80          ; Trigger an interrupt to make the system call. The system call is determined by eax (sys_write in this case)

  mov eax, 1        ; Set eax to 1, which is the system call number for sys_exit, to exit the program
  mov ebx, 0        ; Set ebx to 0, which will be our program's exit status. 0 typically means successful completion.
  int 0x80          ; Trigger another interrupt to make the system call to exit the program
