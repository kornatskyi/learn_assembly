.intel_syntax noprefix

section .data
c1 db 'h',0
c2 db 'e',0
c3 db 'l',0
c4 db 'l',0
c5 db 'o',0

.section .text
.globl compose
compose:
      push rbp                 # Save caller's frame pointer
      mov rbp, rsp             # Establish our frame pointer
      
      mov al, [rel c1]         # Load the value of c1 into al (lower 8 bits of rax)
      push rax                 # Push the value (note that this pushes 64 bits onto the stack)
      mov al, [rel c2]
      push rax
      mov al, [rel c3]
      push rax
      mov al, [rel c4]
      push rax
      mov al, [rel c5]
      push rax
      
      add rsp, 5*8             # Clean up the 5 pushed qwords

      xor rax, rax             # Zero the rax register (return 0 to caller)

      mov rsp, rbp             # Restore stack pointer
      pop rbp                  # Restore caller's frame pointer
      ret
