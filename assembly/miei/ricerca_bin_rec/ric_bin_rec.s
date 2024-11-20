.data
  @variabili globali qua...
.text
.global ricerca_bin_rec @ r0 <- v
              @ r1 <- size (sarà il nostro i)
              @ r2 <- x
              @ r0 <- risultato - indice dell'elemento trovato, -1 se non trovato
.type ricerca_bin_rec, %function
ricerca_bin_rec:
  push {lr}
  CMP r1, #0 @ i > 0?
  BEQ nontrovato
  SUB r1, r1, #1 @ i--
  LDR r3, [r0, r1, LSL #2]  @ v[i]
  CMP r3, r2
  BEQ trovato
  BL ricerca_bin_rec
  B fine
nontrovato:
  MOV r0, #-1
  B fine
trovato:
  MOV r0, r1
fine: 
  pop {lr}
  mov pc, lr
