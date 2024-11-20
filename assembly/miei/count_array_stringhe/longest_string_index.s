.data
  @variabili globali qua...
.text
.global longest_string_index @ r0 <- array di stringhe
              @ r1 <- size of array of strings
              @ r0 <- risultato
.type longest_string_index, %function
longest_string_index:
  push {r4, r5, r6, lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  MOV r3, #0 @int i=0;
  MOV r4, #0 @max lenght string
  MOV r5, #-1 @pointer to max length string
  for:
    CMP r3, r1 @ i < r1
    BEQ fine
    LDR r2, [r0, r3, LSL #2]  @ v[i] - puntatore a stringa nello stack
    push {r0,r1,r2,r3}
    MOV r0, r2
    BL count_length_string
    MOV r6, r0 
    pop {r0,r1,r2,r3}
    CMP r6, r4
    MOVGT r4, r6
    MOVGT r5, r3
    ADD r3, r3, #1 @ i++
  B for
fine: 
  MOV r0, r5
  pop {r4, r5,r6, lr} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
