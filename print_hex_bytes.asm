; `print_hex_bytes`
; ax: address of byte stream to print in format `00` / `FF`
; bx: size of memory block to print (in bytes)

print_hex_bytes:
pusha

mov cx, bx
mov bx, ax
mov ah, 0x0E ; Enter TTY Mode

cmp cx, 0
je _print_hex_bytes_end
add cx, bx

_print_hex_bytes_loop:
mov al, [bx]
shr al, 4
add al, '0'

cmp al, '9'
jle _print_hex_bytes_char1
add al, 7
_print_hex_bytes_char1:
int 0x10

mov al, [bx]
and al, 0xF
add al, '0'

cmp al, '9'
jle _print_hex_bytes_char2
add al, 7
_print_hex_bytes_char2:
int 0x10

inc bx
cmp bx, cx
jne _print_hex_bytes_loop

_print_hex_bytes_end:
popa
ret