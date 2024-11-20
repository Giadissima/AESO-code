.data
  @variabili globali qua...
.text
.global ricerca_bin_rec @ r0 <- v
              @ r1 <- size
              @ r2 <- x
              @ r0 <- risultato - indice dell'elemento trovato, -1 se non trovato
.type ricerca_bin_rec, %function
ricerca_bin_rec:
  push {r4} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  MOV r3, #0 @int i=0;
  for:
    CMP r3, r1 @ i < r1
    BEQ nontrovato
    LDR r4, [r0, r3, LSL #2]  @ v[i]
    CMP r4, r2
    BEQ trovato
    ADD r3, r3, #1 @ i++
  B for
nontrovato:
  MOV r0, #-1
  B fine
trovato:
  MOV r0, r4
fine: 
  @ mettere eventuale mov in r0 per il return ...
  pop {r4} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
