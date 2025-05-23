extern printf
extern system


section .data
    mensaje  db "Suma de enteros", 10, 10,  0
    resultado_texto  db "El resultado de la suma es: %d", 10, 0
    clear_cmd  db "clear", 0

    

section .text
    global main

main:
    push clear_cmd
    call system
    add esp, 4
    
    push mensaje
    call print_to_console
    add esp, 4
    
    mov eax, 20
    add eax, 5

    push eax
    push resultado_texto
    call print_result_to_console
    add esp, 8

    mov eax, 0
    ret 

print_to_console:
    push ebp
    mov ebp, esp


    push dword [ebp+8]
    call printf
    add esp, 4
    
    mov esp, ebp
    pop ebp

    ret 


print_result_to_console:
    push ebp
    mov ebp, esp


    push dword [ebp+12]
    push dword [ebp+8]
    call printf
    add esp, 8
    
    mov esp, ebp
    pop ebp

    ret 
    ;MIPS ASSembly
    ; go ASM


print_result_to_console:
    push ebp
    mov ebp, esp


    push dword [ebp+12]
    push dword [ebp+8]
    call printf
    add esp, 8
    
    mov esp, ebp
    pop ebp

    ret 