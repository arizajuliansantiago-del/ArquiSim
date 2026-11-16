.data
arreglo:   .word 5, -3, 8, -1, 0, -7, 4, -2
resultado: .word 0

.text
    j main

CONTAR:
    move $t0, $a0
    li $t1, 0
    li $t2, 0

CICLO:
    beq $t1, $a1, FIN_CONTAR

    lw $t3, 0($t0)

    slt $t4, $t3, $zero
    beq $t4, $zero, SIGUIENTE

    addi $t2, $t2, 1

SIGUIENTE:
    addi $t0, $t0, 4
    addi $t1, $t1, 1
    j CICLO

FIN_CONTAR:
    move $v0, $t2
    jr $ra

main:
    la $a0, arreglo
    li $a1, 8

    jal CONTAR

    li $t5, 544
    sw $v0, 0($t5)

    li $t5, 0x604
    li $t6, 0
    sw $t6, 0($t5)

    li $t5, 0x608
    li $t6, 0xFF0000

    li $t7, 0

DIBUJAR:
    beq $t7, $v0, FIN

    sw $t6, 0($t5)

    addi $t7, $t7, 1
    j DIBUJAR

FIN:
