global _start
section .data
  myAddr db "yellow"

section .text
_start:
  mov [myAddr], byte 'H'
  mov [myAddr+5], byte '!'
  mov eax, 4 ; sys_write system call
  mov ebx, 1 ; stdout file descriptor
  mov ecx, myAddr ; bytes to write
  mov edx, 6 ; number of bytes to write
  int 0x80 ; perform system call
  mov eax, 1 ; sys_exit system call
  mov ebx, 0 ; exit status is 0
  int 0x80