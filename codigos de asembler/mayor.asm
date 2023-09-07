.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result: .asciiz "El número mayor de yeison y cindy: "

.text
.globl main

main:
    # Imprimir el primer prompt y leer el primer número
    li $v0, 4         # Cargar el código de servicio 4 para imprimir una cadena
    la $a0, prompt1   # Cargar la dirección de la cadena prompt1 en $a0
    syscall           # Llamar al sistema para imprimir la cadena
    li $v0, 5         # Cargar el código de servicio 5 para leer un entero
    syscall           # Llamar al sistema para leer un entero del usuario
    move $t0, $v0     # Mover el valor ingresado a $t0

    # Imprimir el segundo prompt y leer el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Imprimir el tercer prompt y leer el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Comparar los números para encontrar el mayor
    move $t3, $t0     # Mover el primer número a $t3
    blt $t1, $t0, menor1  # Si $t1 < $t0, saltar a la etiqueta menor1
    move $t3, $t1     # Si no, mover $t1 (el segundo número) a $t3
menor1:
    blt $t2, $t3, menor2  # Si $t2 < $t3, saltar a la etiqueta menor2
    move $t3, $t2     # Si no, mover $t2 (el tercer número) a $t3
menor2:

    # Imprimir el resultado
    li $v0, 4         # Cargar el código de servicio 4 para imprimir una cadena
    la $a0, result    # Cargar la dirección de la cadena result en $a0
    syscall           # Llamar al sistema para imprimir la cadena
    li $v0, 1         # Cargar el código de servicio 1 para imprimir un entero
    move $a0, $t3     # Mover el valor más pequeño ($t3) a $a0 para imprimirlo
    syscall           # Llamar al sistema para imprimir el entero

    # Terminar el programa
    li $v0, 10        # Cargar el código de servicio 10 para salir del programa
    syscall           # Llamar al sistema para salir
