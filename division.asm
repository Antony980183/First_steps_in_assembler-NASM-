section .data
    saltoLinea db 0xa, 0xd

section .bss
    resultado resb 1

section .text
    global main

main:
    mov bx, 2 ; agrega un 2 a bx, divisor
    mov dx, 0 ; fuerzo que mi residuo sea 0 para evitar errores futuros
    mov ax, 6 ; agrega un 8 a ax, dividendo

    div bx ; bx = 8/2,  ax = 4,  dx = 0
    add ax, 48
    mov [resultado], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    jmp _saltoDeLinea

_saltoDeLinea:
    mov eax, 4
    mov ebx, 1
    mov ecx, saltoLinea
    mov edx, 1
    int 0x80

    jmp _exit

_exit:
    mov eax, 1
    mov ebx, 0
    int 0x80