mov al,10101010b
Stat:
    out 120,al
    jmp Delay200
Delay200:
    mov cx,200
    Pause:nop
          loop Pause
    not al
    jmp Stat