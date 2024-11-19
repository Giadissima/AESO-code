.data
  @variabili globali qua...
.text
.global scalare @ r0 <- v1
              @ r1 = v2
              @ r2 = size_array
              @ r0 <- risultato - array scalare
.type scalare, %function
scalare:
  push {r4, r5} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  MOV r3, #0 @int i=0;
  for:
    CMP r3, r2 @ i < r1
    BEQ fine
    LDR r4, [r0, r3, LSL #2]  @ v[i]
    LDR r5, [r1, r3, LSL #2]  @ v[i]
    MUL r4, r4, r5
    STR r4, [r0, r3, LSL #2]  @ v[i]=v[i]*x
    ADD r3, r3, #1 @ i++
  B for
fine: 
  @ mettere eventuale mov in r0 per il return ...
  pop {r4, r5} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
