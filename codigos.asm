;Esto es para practicar lenguaje ensamblador
section .data
    mensaje db "Hola Perro Mundo Triple HPT!", 0xa,0xd
    len equ $ - mensaje 

    saltoLinea db 0xa,0xd

    resultado db "0" ; esta "vacio"

section .bss
    resultado2 resb 1

section .text
    global main

main: 

jmp _resta

imprimir:

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 0x80

    jmp _salida

suma:
    mov eax, 2
    mov ebx, 3
    add eax, ebx ; 5 
    add eax, 48
    mov [resultado], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80


    jmp _salida

_resta:
    mov eax, 8
    mov ebx, 1
    sub eax, ebx
    add eax, 48
    mov [resultado2], eax

    
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado2
    mov edx, 1
    int 0x80

    jmp _saltoDeLinea

_saltoDeLinea:
    mov eax, 4
    mov ebx, 1
    mov ecx, saltoLinea
    mov edx, 2
    int 0x80

    jmp _salida

_salida:
    mov eax, 1
    mov ebx, 0
    int 0x80

