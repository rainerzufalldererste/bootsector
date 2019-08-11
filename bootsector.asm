; Setup offset to BIOS memory layout.
mov ax, 0x7C0
mov ds, ax

; Setup Stack at 0xFFFF.
mov bp, 0xFFFF
mov sp, bp

jmp start

start:

mov ax, hello_world
call print

jmp end

%include "print.asm"

end:

; Hang forever.
jmp $

hello_world:
db 'Hello World!', 0

times 510-($-$$) db 0
dw 0xAA55
