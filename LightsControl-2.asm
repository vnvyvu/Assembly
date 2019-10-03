mov al,11000000b
Stat:
    out 120,al
    jmp Delay150
Delay150:
    mov cx,150
    Pause:nop
          loop Pause
    ror al,1
    jmp Stat