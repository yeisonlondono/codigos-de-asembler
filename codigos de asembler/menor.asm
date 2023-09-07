.data
Prompt1: .asciiz "Ingrese el primer n�mero: "   # Mensaje para solicitar el primer n�mero
Prompt2: .asciiz "Ingrese el segundo n�mero: "  # Mensaje para solicitar el segundo n�mero
Prompt3: .asciiz "Ingrese el tercer n�mero: "   # Mensaje para solicitar el tercer n�mero
result: .asciiz "El n�mero menor de deicy y yeison: " # Mensaje para mostrar el resultado

.text
.globl main

main:
    # Pide al usuario que ingrese el primer n�mero
    li $v0, 4         # Cargar el servicio de impresi�n de cadena
    la $a0, Prompt1   # Cargar la direcci�n del mensaje
    syscall           # Imprimir el mensaje
    li $v0, 5         # Cargar el servicio de lectura de entero
    syscall           # Leer el primer n�mero ingresado por el usuario
    move $t0, $v0     # Almacenar el primer n�mero en $t0

    # Pide al usuario que ingrese el segundo n�mero
    li $v0, 4         # Cargar el servicio de impresi�n de cadena
    la $a0, Prompt2   # Cargar la direcci�n del mensaje
    syscall           # Imprimir el mensaje
    li $v0, 5         # Cargar el servicio de lectura de entero
    syscall           # Leer el segundo n�mero ingresado por el usuario
    move $t1, $v0     # Almacenar el segundo n�mero en $t1

    # Pide al usuario que ingrese el tercer n�mero
    li $v0, 4         # Cargar el servicio de impresi�n de cadena
    la $a0, Prompt3   # Cargar la direcci�n del mensaje
    syscall           # Imprimir el mensaje
    li $v0, 5         # Cargar el servicio de lectura de entero
    syscall           # Leer el tercer n�mero ingresado por el usuario
    move $t2, $v0     # Almacenar el tercer n�mero en $t2

    # Encuentra el n�mero mayor
    move $t3, $t0     # Copiar $t0 a $t3
    bgt $t1, $t3, check_t1_t3  # Compara $t1 con $t3
    move $t3, $t1

check_t1_t3:
    bgt $t2, $t3, check_t2_t3  # Compara $t2 con $t3
    move $t3, $t2

check_t2_t3:
    # Imprimir el resultado
    li $v0, 4         # Cargar el servicio de impresi�n de cadena
    la $a0, result    # Cargar la direcci�n del mensaje
    syscall           # Imprimir el mensaje
    move $a0, $t3     # Cargar el n�mero mayor en $a0
    li $v0, 1         # Cargar el servicio de impresi�n de entero
    syscall           # Imprimir el n�mero mayor

    # Salir del programa
    li $v0, 10        # Cargar el servicio de salida del programa
    syscall

