;Esto es para practicar lenguaje ensamblador
section .data
    mensaje db "Hola Perro Mundo Triple HPT!", 0xa,0xd
    len equ $ - mensaje
section .text
    global main

main: 

jmp imprimir 

imprimir:

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 0x80


    mov eax, 1
    int 0x80