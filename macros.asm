%macro _print 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

section .data
    mensaje_uno db "hola mundo", 0xA, 0xD
    len_uno equ $-mensaje_uno

    mensaje_dos db "kkck", 0xA, 0xD
    len_dos equ $-mensaje_dos

section .text
    global main

main:
    _print mensaje_uno, len_uno

    _print mensaje_dos, len_dos

    mov eax, 1
    mov ebx, 0
    int 0x80