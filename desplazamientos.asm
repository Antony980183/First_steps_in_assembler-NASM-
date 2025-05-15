section .data
    espacio db 0xa, 0xd

section .bss
    resultado1 resb 1
    resultado2 resb 1

section .text
    global main

main:
    jmp _ejemploUno

_ejemploUno:
    mov eax, 4
    shr eax, 1   ; los desplazamientos son una forma de multiplicar o dividir desplazando un bit a la izquiera o derecha "shl" or "shr"
    add eax, 48
    mov [resultado1], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado1
    mov edx, 1
    int 0x80

    jmp _saltoDeLinea

_saltoDeLinea:
    mov eax, 4
    mov ebx, 1
    mov ecx, espacio
    mov edx, 1
    int 0x80

    jmp _exit

_exit:
    mov eax, 1
    mov ebx, 0
    int 0x80  



