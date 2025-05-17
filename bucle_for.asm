section .data
    salto db 0xA,0xD

section .bss
    resutlado resb 1

section .text
    global main

main:
    mov ecx, 3
    mov eax, 0

    jmp _for

_for:
    add eax, ecx
loop _for

add eax, 48
mov [resutlado], eax

mov eax, 4
mov ebx, 1
mov ecx, resutlado
mov edx, 1
int 0x80

mov eax, 4
mov ebx, 1
mov ecx, salto
mov edx, 2
int 0x80

mov eax, 1
mov ebx, 0
int 0x80
