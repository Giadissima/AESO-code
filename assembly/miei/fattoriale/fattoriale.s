.data
  messaggio: .asciz "ERROR: Overflow detected\n"
.text
.global fattoriale @ r0 <- numero da fattorizzare
              @ r0 <- risultato (numero di elementi nulli)
              @ restituisce 0 se ha fatto un overflow
.type fattoriale, %function

fattoriale:
  MOV r1, r0 @ inserisco il numero di iterazioni da fare in r1
  MOV r0, #1 @ invariante della moltiplicazione.
for:  CMP r1,#0
  beq fine
  muls r0, r1, r0
  BVS error
  SUB r1, r1, #1 @ i--
  b for
error: LDR r0, =messaggio
  push {lr}
  LDR r0, =messaggio
  BL printf
  mov r0, #0
  pop {lr}
fine: mov pc, lr
