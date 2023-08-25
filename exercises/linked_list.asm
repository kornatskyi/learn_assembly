global main
extern printf

section .data
  format_string db "Hello, %i", 0x0a, 0x00

  mempool db 1024 dup(0)

section .text
main:
  ;prolog
  push ebp
  mov ebp, esp

  mov byte [mempool], 0
  mov dword [mempool+1], 1024

  push 6 ; size of memory to allocate
  call malloc ; alocate memory, return addres of the memory block in eax register
  add esp, 4 ; clean stack

  ; print
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

; parameters
; dword size
malloc: 
  
  ; find begining of empty space
  movzx eax, byte [mempool] ; first statuts value
  mov ebx, [mempool+1] ; first size

  mov ecx, [esp+4] ; get first parameter, size of memory to alocate
  again:
  cmp eax, 0
  jne find_next_free
  cmp ecx, ebx ; compare new size to current block free size
  jg find_next_free
  jmp end

  find_next_free:
    add eax, [mempool+ebx] ; next status address (mempool_address + size)
    add ebx, [mempool+ebx+5] ; total memory size (5 is staus(byte(1)) + size(dword(4)))
    jmp again ; try to find availble memroy again
  
  end:
  ; return value through eax register
  mov byte [mempool+ebx], 1
  lea eax, [mempool+ebx] ; address of the status byte of the empty space
  ret
