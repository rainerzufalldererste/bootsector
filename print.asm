; `print`
; ax: address of zero terminated string to print.

print:
pusha
mov bx, ax
mov ah, 0x0E ; Enter TTY Mode

_print_next_char:
mov cx, [bx]

cmp cl, 0
je _print_end
mov al, cl
int 0x10

cmp ch, 0
je _print_end
mov al, ch
int 0x10

add bx, 2
jmp _print_next_char

_print_end:
popa
ret
