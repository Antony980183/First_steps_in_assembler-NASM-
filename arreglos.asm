section .bss
    resultado resb 1

section .text
    global main

main:
    jmp suma

suma:
    mov eax, 1
    mov ebx, 9
    add eax, ebx ; 5 
    add eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80


    mov eax, 1
    mov ebx, 0
    int 0x80