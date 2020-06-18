;optimize with:
;1s on/off->inc 0.5(degreeC)/dec 0.5(degreeC)
;1nop->5ms
;[30,40]

.model small
.stack 100h
.data
.code
main proc
    mov ax,@data
    mov ds,ax
    #start=Thermometer.exe#
    in al,125
    mov bl,al
    cmp al,30
    jb Tang
    jmp Giam
    
main endp
Giam:
    mov al,0
    out 127,al
    
    sub bl,30
    add bl,bl
    xor bh,bh
    
    mov al,200
    mul bl
    
    mov cx,ax
    DelayG30:nop
             loop DelayG30
    
    jmp Lap
Tang:
    mov al,1
    out 127,al
    
    mov al,30
    sub al,bl
    add al,al
    xor ah,ah
    
    mov al,200
    mul bl
    
    mov cx,ax
    DelayT30:nop
             loop DelayT30
    jmp Lap
Lap:
    mov al,1
    out 127,al
    mov cx,4000;cx=(40-30)*2*200
    DelayT:nop
           loop DelayT
    mov al,0
    out 127,al
    mov cx,4000;cx=(40-30)*2*200
    DelayG:nop
           loop DelayG
    jmp Lap