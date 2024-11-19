.data
  @variabili globali qua...
.text
.global to_upper @ r0 <- string v[]
              @ r1 <- size of v
              @ r0 <- risultato
.type to_upper, %function
to_upper:

  MOV r3, #0 @int i=0;
  while:
    LDRB r2, [r0, r3]  @ v[i]
    CMP r2, #0 @ null terminated string => se è 0 vuol dire che la stringa è finita
    BEQ fine
    CMP r2, #96
    bhi true_if
    endif:  ADD r3, r3, #1 @ i++
  B while

true_if:
  CMP r2, #123
  blt convert_it_and_store
  b endif

convert_it_and_store:
  SUBLT r2, r2, #32
  STRB r2, [r0, r3]  @ v[i]
  b endif
  
fine: 
  mov pc, lr
