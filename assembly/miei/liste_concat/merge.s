.data
  @variabili globali qua...
.text
.global merge @ r0 <- lista1
              @ r1 <- lista2
              @ r0 <- risultato = lista1 + lista2
.type merge, %function
merge:
  @ If then
  CMP r0, #0
  BNE endif
    MOV r0, r1
    MOV pc, lr
  endif:
  @ If then
  CMP r1, #0
  BNE endif2
    MOV pc, lr
  endif2:

  MOV r3, r0 @ Nodo * iteratore = testa1
  while:
    CMP r3,#0
    BEQ endwhile
      MOV r2, r3 @ r2 = nodo precedente
      LDR r3, [r3, #4]  @ iteratore = iteratore->next
    B while
  endwhile:
  STR r1, [r2, #4]  @ coda = testa2;
  MOV pc, lr
