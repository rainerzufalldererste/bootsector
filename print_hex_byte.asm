; `print_hex_byte`
; al / ax: byte to print as hex in format `00` / `FF`.

print_hex_byte:
pusha
mov bl, al
mov ah, 0x0E ; Enter TTY Mode

mov al, bl
and al, 0x0F
add al, '0'
cmp al, '9'
jle _print_hex_byte_char1

add al, 7
_print_hex_byte_char1:
int 0x10

shr bl, 8
mov al, bl
add al, '0'
cmp al, '9'
jle _print_hex_byte_char2

add al, 7
_print_hex_byte_char2:
int 0x10

popa
ret
