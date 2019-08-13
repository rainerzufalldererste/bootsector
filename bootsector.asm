; Setup offset to BIOS memory layout.
mov ax, 0x7C0
mov ds, ax

; Setup Stack at 0xFFFF.
mov bp, 0xFFFF
mov sp, bp

mov ax, hello_world
call print

jmp _bootsector_end

%include "print.asm"
%include "print_hex_byte.asm"
%include "print_hex_bytes.asm"

_bootsector_end:

; Hang forever.
jmp $

hello_world:
db 'Hello World!', 0

times 510-($-$$) db 0
dw 0xAA55
