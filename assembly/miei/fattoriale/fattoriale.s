.text
.global fattoriale @ r0 <- numero da fattorizzare
              @ r0 <- risultato (numero di elementi nulli)
.type fattoriale, %function

fattoriale:
  MOV r1, r0 @ inserisco il numero di iterazioni da fare in r1
  MOV r0, #1 @ invariante della moltiplicazione.
for:  CMP r1,#0
  beq fine
  mul r0, r1, r0
  SUB r1, r1, #1 @ i--
  b for
fine: mov pc, lr