.data
  @variabili globali qua...
.text
.global count_length_string @ r0 <- stringa
              @ r0 <- risultato
.type count_length_string, %function
count_length_string:
  MOV r1, #0
  while:
    ldrb r2, [r0] @ carica un carattere della stringa in r2
    cmp r2, #0 @ null terminated string => se è 0 vuol dire che la stringa è finita
    beq fine
      ADD r1,r1,#1
    add r0, r0, #1     @ per il prossimo carattere l'indirizzo aumenta di 1 (byte)
    b while
fine: 
  mov r0, r1
  mov pc, lr
