section .data
    saltoLinea db 0xa, 0xd

section .bss
    resultado resb 1

section  .text
    global main

main:
    mov ax, 2
    mov cx, 3
    mul cx
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
    