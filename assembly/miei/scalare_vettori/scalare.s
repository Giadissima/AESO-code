.data
  @variabili globali qua...
.text
.global scalare @ r0 <- array
              @ r1 = size_array
              @ r2 = x scalare
              @ r0 <- risultato (funzione void)
.type scalare, %function
scalare:
  push {r4} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  MOV r3, #0 @int i=0;
  for:
    CMP r3, r1 @ i < r1
    BEQ fine
    LDR r4, [r0, r3, LSL #2]  @ v[i]
    MUL r4, r4, r2
    STR r4, [r0, r3, LSL #2]  @ v[i]=v[i]*x
    ADD r3, r3, #1 @ i++
  B for
fine: 
  @ mettere eventuale mov in r0 per il return ...
  pop {r4} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
