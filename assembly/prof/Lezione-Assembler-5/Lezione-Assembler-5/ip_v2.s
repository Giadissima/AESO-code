      .text
      .global ip @ r0 <- indirizzo base di x
                 @ r1 <- indirizzo base di y
                 @ r2 <- dimensione n di x e y
                 @ r0 <- valore di ritorno
      .type ip, %function

  ip: push {r4, r5}
      mov r3, #0 @ accumulatore
      cmp r2, #0
      beq fine
loop: ldr r4, [r0], #4 @ carica x[i]
      ldr r5, [r1], #4 @ carica y[i]
      mla r3, r4, r5, r3 @ multiply and add
      subs r2, r2, #1 @ un elemento in meno, setta i flag
      bne loop
fine: pop {r4, r5}
      mov r0, r3
      mov pc, lr