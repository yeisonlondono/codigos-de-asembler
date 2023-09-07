# Programa para calcular los primeros n números de la serie de Fibonacci

.data
    n:      .word 10    # Cambia este valor para ajustar la cantidad de números de Fibonacci a calcular
    fib:    .space 40   # Espacio para almacenar los números de Fibonacci (40 bytes para 10 números)

.text
    main:
        # Cargar el valor de n desde la memoria
        lw $t0, n

        # Inicializar los dos primeros números de Fibonacci
        li $t1, 0    # F0 = 0
        li $t2, 1    # F1 = 1

        # Iniciar un ciclo para calcular los números de Fibonacci
        loop:
            # Verificar si hemos alcanzado el número deseado de Fibonacci
            beq $t0, $zero, end

            # Calcular el siguiente número de Fibonacci: F2 = F0 + F1
            add $t3, $t1, $t2   # $t3 = F0 + F1

            # Imprimir el número de Fibonacci actual
            # (puedes usar syscall para imprimir en MARS)
            move $a0, $t3
            li $v0, 1
            syscall

            # Actualizar los registros para la próxima iteración
            move $t1, $t2   # F0 = F1
            move $t2, $t3   # F1 = F2

            # Decrementar el contador n
            subi $t0, $t0, 1

            # Volver al inicio del bucle
            j loop

        end:
            # Salir del programa
            li $v0, 10
            syscall
