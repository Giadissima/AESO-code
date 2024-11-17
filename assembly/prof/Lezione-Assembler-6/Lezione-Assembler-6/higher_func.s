             .text
             .global higher_func @ r0 <- puntatore array
                                 @ r1 <- size array
                                 @ r2 <- puntatore a funzione
                                 @ r0 <- valore di ritorno (niente)
             .type higher_func, %function

higher_func: push {lr}
       loop: cmp r1, #0
             beq fine
             ldr r3, [r0] @ r3 = A[i]
             push {r0-r2}
             mov r0, r3
             mov lr, pc @ quando si legge PC si legge sempre il suo valore + 8 (è così ARMv7)
             mov pc, r2 @ salto alla funzione
             mov r12, r0
             pop {r0-r2}
             str r12, [r0], #4
             sub r1, r1, #1
             b loop
       fine: mov r0, #0
             pop {lr}
             mov pc, lr
