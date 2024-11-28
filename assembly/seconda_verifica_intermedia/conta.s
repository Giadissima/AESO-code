.data
  @variabili globali qua...
.text
.global conta @ r0 <- string
              @ r0 <- risultato - numero di occorrenze di caratteri ASCII consecutivi (es "ab" "12")
.type conta, %function
conta:
  MOV r3, #0 @ risultato

  ldrb r2, [r0] @ r2 = char prec
  CMP r2, #0 @ caso sia stata passata una stringa vuota
  BEQ fine
  add r0, r0, #1     @ per il prossimo carattere l'indirizzo aumenta di 1 (byte)
  
  while:
    ldrb r1, [r0] @ carica un carattere della stringa in r1
    cmp r1, #0 @ null terminated string => se è 0 vuol dire che la stringa è finita
    beq fine
    ADD r2,r2,#1 @ se il carattere è il precedente nella scala ascii, posso sommarci uno e confrontare se sono uguali
    CMP r1, r2
    ADDEQ r3,r3, #1
    MOV r2, r1 @ car precedente = car attuale
    add r0, r0, #1 @ per il prossimo carattere l'indirizzo aumenta di 1 (byte)
    b while
fine: 
  MOV r0, r3
  mov pc, lr
