.model tiny
.stack 100h
.data
str db 100 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov dx,offset str
    mov ah,0ah
    int 21h
    
    mov bx,offset str+2
    Lap:mov dl,[bx]
        call c2C
        push dx
        inc bx
        cmp [bx],'$'
        jne Lap
    call Endl    
    mov ah,2h
    Print:pop dx
          int 21h
          cmp dx,0
          jne Print
    
    mov ah,4ch
    int 21h    
main endp
c2C:cmp dl,'a'
    jae Dk
    jmp Exit
    Dk:cmp dl,'z'
       jbe Change
       jmp Exit
       Change: sub dl,32
    Exit: ret
    
Endl:mov ah,2h
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     ret