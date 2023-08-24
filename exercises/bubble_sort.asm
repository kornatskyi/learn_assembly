global main
extern printf

section .data
  format_string db "Index: %i, Number: %i", 0x0a, 0x00
  numbers dd 4,7,2,13,3,32,1,3,4
  len dd 9
section .text
main:
  ;prolog
  push ebp
  mov ebp, esp

  mov eax, [len] ; reversed swap counter
  dec eax

  mov ecx, 0 ; i index (iterator)

  loop: ; while
    push ecx ; save ecx on the stack as an i
    imul ecx, 4 ; multiply it by the "word" size
    mov ebx, [numbers+ecx] ; numbers[i] 
    mov edx, [numbers+ecx+4] ; numbers[i+1] 
    pop ecx ; get ecx back from the stack
    cmp ebx, edx ;if [number+i] > [number+i+1]
    jg swap ;[number+i+1] = [number+i]; 
    endswap:
    dec eax ; decrement swap counter

    mov ebx, [len]
    dec ebx ; make len-1
    inc ecx; i++
    cmp ecx, ebx; i < (len-1)
    jge reset_iterator
    jmp loop

  reset_iterator:
    mov ecx, 0
    add eax, ecx
    
    cmp eax, 0 ; if nothing was reset then end the loop
    je end ; if 

    mov eax, [len]
    dec eax
    jmp loop

  swap:
    push ecx ; save ecx on the stack as an i
    imul ecx, 4 ; multiply it by the "word" size

    mov ebx, [numbers+ecx] ; numbers[i] 
    mov edx, [numbers+ecx+4] ; numbers[i+1] 
    mov [numbers+ecx], edx
    mov [numbers+ecx+4], ebx

    inc eax ; increment swap counter
    pop ecx
    jmp endswap

  end:
  
  mov ecx, 0
  mov eax, 0
 ploop:
    cmp ecx, [len]
    jge endprint

    push eax ; index
    push ecx
    ; Calculate offset
    imul ecx, 4
    ; print all numbers
    push dword [numbers + ecx]
    push eax
    push format_string
    call printf
    add esp, 12
    pop ecx
    pop eax
    inc ecx
    inc eax
    jmp ploop

  endprint:

  ;epilog
  mov esp, ebp
  pop ebp

  ;exit
  mov eax, 1
  mov ebx, 0
  int 0x80
