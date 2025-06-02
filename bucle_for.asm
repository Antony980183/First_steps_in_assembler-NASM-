; Archivo: dado_time.asm
; Compilación en Linux (32 bits):
;   nasm -f elf32 dado_time.asm -o dado_time.o
;   ld -m elf_i386 dado_time.o -o dado_time -lc -dynamic-linker /lib/ld-linux.so.2

section .data
    ; Variables y cadenas
    format_str         db "El valor del dado es: %d", 10, 0
    mensaje_tirar_dado db "Presione Enter para tirar el dado (R para reiniciar): ", 0
    semilla            db 0      ; Variable para la semilla
    dado               db 0      ; Aquí se almacenará el resultado del dado

section .text
global main
extern printf, getchar, time, exit

;-------------------------------------
; act_semilla: Actualiza la semilla usando la función time()
;-------------------------------------
act_semilla:
    push dword 0          ; Pasa un puntero NULL a time() para obtener la hora actual
    call time             ; time() devuelve el valor en EAX (32 bits)
    add esp, 4            ; Limpia la pila (se empujó un argumento de 4 bytes)
    ; Utilizamos solo el byte menos significativo del valor obtenido (EAX)
    mov [semilla], al
    ret

;-------------------------------------
; generar_dado: Genera un número al azar del 1 al 6
;-------------------------------------
generar_dado:
    call act_semilla          ; Actualiza la semilla usando time()
    mov al, [semilla]         ; Carga la semilla en AL
    mov ah, 0                 ; Limpia AH para formar AX correctamente
    mov bl, 6                 ; Coloca 6 en BL para obtener un residuo entre 0 y 5
    div bl                    ; Divide AX entre BL:
                              ; - Cociente en AL (no lo usamos)
                              ; - Residuo en AH
    mov al, ah                ; Toma el residuo en AL
    add al, 1                 ; Ajusta el rango para obtener un valor de 1 a 6
    mov [dado], al            ; Guarda el resultado en 'dado'
    ret

;-------------------------------------
; main: Función principal
;-------------------------------------
main:
    ; Imprime el mensaje para tirar el dado
    push mensaje_tirar_dado
    call printf
    add esp, 4

    ; Espera a que el usuario presione Enter (o la tecla correspondiente)
    call getchar

    ; Genera el valor del dado
    call generar_dado

    ; Imprime el valor obtenido
    ; Dado que 'dado' es de 8 bits, lo extendemos a 32 bits con MOVZX para usarlo con printf
    movzx eax, byte [dado]
    push eax
    push format_str
    call printf
    add esp, 8

    ; Finaliza el programa utilizando exit de la libc
    push dword 0
    call exit