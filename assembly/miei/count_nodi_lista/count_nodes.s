.data
  @variabili globali qua...
.text
.global count_nodes @ r0 <- lista1
              @ r0 <- risultato = num di nodi
.type count_nodes, %function
count_nodes:
  @ If then
  CMP r0, #0 @ se la lista è vuota, restutuisco zero
  BNE endif
    MOV r0, #0
    MOV pc, lr
  endif:

  MOV r1, #0
  MOV r3, r0 @ Nodo * iteratore = testa1
  while:
    CMP r3,#0
    BEQ endwhile
      ADD r1, r1, #1
      LDR r3, [r3, #4]  @ iteratore = iteratore->next
    B while
  endwhile:
  mov r0, r1
  MOV pc, lr
