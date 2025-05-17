section .data
    mensaje_uno db 0xA, 0xD, "Hola Mundo"
    len_uno equ $-mensaje_uno

    mensaje_dos db " Cruel!", 0xA, 0xD
    len_dos equ $-mensaje_dos

section .text
    global main

_print:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

main:
    mov ecx, mensaje_uno
    mov edx, len_uno
    call _print

    mov ecx, mensaje_dos
    mov edx, len_dos
    call _print

    jmp _salida

_salida:
    mov eax, 1
    mov ebx, 0
    int 0x80
