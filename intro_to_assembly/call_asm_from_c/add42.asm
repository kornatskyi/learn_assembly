global add42
add42:
  ;prolog
  push ebp
  mov ebp, esp

  mov eax, [ebp+8]
  add eax, 42

  ;epilog
  mov esp, ebp
  pop ebp
  ret