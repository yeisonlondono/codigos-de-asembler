# Programa para calcular los primeros n n�meros de la serie de Fibonacci

.data
    n:      .word 10    # Cambia este valor para ajustar la cantidad de n�meros de Fibonacci a calcular
    fib:    .space 40   # Espacio para almacenar los n�meros de Fibonacci (40 bytes para 10 n�meros)

.text
    main:
        # Cargar el valor de n desde la memoria
        lw $t0, n

        # Inicializar los dos primeros n�meros de Fibonacci
        li $t1, 0    # F0 = 0
        li $t2, 1    # F1 = 1

        # Iniciar un ciclo para calcular los n�meros de Fibonacci
        loop:
            # Verificar si hemos alcanzado el n�mero deseado de Fibonacci
            beq $t0, $zero, end

            # Calcular el siguiente n�mero de Fibonacci: F2 = F0 + F1
            add $t3, $t1, $t2   # $t3 = F0 + F1

            # Imprimir el n�mero de Fibonacci actual
            # (puedes usar syscall para imprimir en MARS)
            move $a0, $t3
            li $v0, 1
            syscall

            # Actualizar los registros para la pr�xima iteraci�n
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
