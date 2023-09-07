.data
Prompt1: .asciiz "Ingrese el primer número: "   # Mensaje para solicitar el primer número
Prompt2: .asciiz "Ingrese el segundo número: "  # Mensaje para solicitar el segundo número
Prompt3: .asciiz "Ingrese el tercer número: "   # Mensaje para solicitar el tercer número
result: .asciiz "El número menor de deicy y yeison: " # Mensaje para mostrar el resultado

.text
.globl main

main:
    # Pide al usuario que ingrese el primer número
    li $v0, 4         # Cargar el servicio de impresión de cadena
    la $a0, Prompt1   # Cargar la dirección del mensaje
    syscall           # Imprimir el mensaje
    li $v0, 5         # Cargar el servicio de lectura de entero
    syscall           # Leer el primer número ingresado por el usuario
    move $t0, $v0     # Almacenar el primer número en $t0

    # Pide al usuario que ingrese el segundo número
    li $v0, 4         # Cargar el servicio de impresión de cadena
    la $a0, Prompt2   # Cargar la dirección del mensaje
    syscall           # Imprimir el mensaje
    li $v0, 5         # Cargar el servicio de lectura de entero
    syscall           # Leer el segundo número ingresado por el usuario
    move $t1, $v0     # Almacenar el segundo número en $t1

    # Pide al usuario que ingrese el tercer número
    li $v0, 4         # Cargar el servicio de impresión de cadena
    la $a0, Prompt3   # Cargar la dirección del mensaje
    syscall           # Imprimir el mensaje
    li $v0, 5         # Cargar el servicio de lectura de entero
    syscall           # Leer el tercer número ingresado por el usuario
    move $t2, $v0     # Almacenar el tercer número en $t2

    # Encuentra el número mayor
    move $t3, $t0     # Copiar $t0 a $t3
    bgt $t1, $t3, check_t1_t3  # Compara $t1 con $t3
    move $t3, $t1

check_t1_t3:
    bgt $t2, $t3, check_t2_t3  # Compara $t2 con $t3
    move $t3, $t2

check_t2_t3:
    # Imprimir el resultado
    li $v0, 4         # Cargar el servicio de impresión de cadena
    la $a0, result    # Cargar la dirección del mensaje
    syscall           # Imprimir el mensaje
    move $a0, $t3     # Cargar el número mayor en $a0
    li $v0, 1         # Cargar el servicio de impresión de entero
    syscall           # Imprimir el número mayor

    # Salir del programa
    li $v0, 10        # Cargar el servicio de salida del programa
    syscall

