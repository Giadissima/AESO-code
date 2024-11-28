.data
  @variabili globali qua...
.text
.global conta_strings @ r0 <- array di stringhe
              @ r1 <- size of array of strings
              @ r0 <- risultato
.type conta_strings, %function
conta_strings:
  push {r4, lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  MOV r3, #0 @int i=0;
  MOV r4, #0 @num totale di occorrenze doppie
  for:
    CMP r3, r1 @ i < r1
    BEQ fine
    LDR r2, [r0, r3, LSL #2]  @ v[i] - puntatore a stringa[i] nello stack
    push {r0,r1,r2,r3} @ pusho i registri temporanei del chiamante per poterli ripristinare dopo
    MOV r0, r2 @ in r0 ci deve essere il puntatore alla stringa[i]
    BL conta @ branch and link (call per altre versioni di arm)
    ADD r4, r4, r0 @ sommo il risultato della chiamata della funzione al nostro num totale di occorrenze
    pop {r0,r1,r2,r3} @ ripristino e registri di conta_strings
    ADD r3, r3, #1 @ i++
  B for
fine: 
  MOV r0, r4 @ carico il risultato totale in r0 per poter fare il return
  pop {r4, lr} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
