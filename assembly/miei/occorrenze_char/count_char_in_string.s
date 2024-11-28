.data
  @variabili globali qua...
.text
.global count_char_in_string @ r0 <- stringa
              @ r1 <- carattere da cercare
              @ r0 <- risultato - numero di occorrenze di c in s
.type count_char_in_string, %function
count_char_in_string:
  MOV r3, #0
  while:
    ldrb r2, [r0] @ carica un carattere della stringa in r2
    cmp r2, #0 @ null terminated string => se è 0 vuol dire che la stringa è finita
    beq fine
      CMP r1, r2
      ADDEQ r3, r3, #1
    add r0, r0, #1     @ per il prossimo carattere l'indirizzo aumenta di 1 (byte)
    b while
fine: 
  mov r0, r3
  mov pc, lr
