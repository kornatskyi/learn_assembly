_start:
  push 13
  call times2
  mov ebx, eax ; ebx is responsible for status codes so move value the caluculate value into it
  mov eax, 1
  int 0x80

times2:
  ;this function doubles the value of the first paramerter and returns it in eax register
  push ebp ; remember beginig of the function by using base pointer
  mov ebp, esp ; settings it's values to the value of actuall pointer at this moment
  mov eax, [ebp+8] ; set eax to the value that we pushed to the sack at the begining, it's functions argument
  add eax, eax ; x2 eax (our value that we want to calculate)
  mov esp, ebp ; reset pointer to the beginig of the function (in this case we don't actually have anythin on the stack to reset but it's a good practice to do it) 
  pop ebp ; remove ebp from the stack
  ret ; remove return addres from the stack and jump to that addres