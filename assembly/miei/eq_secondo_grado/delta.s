.data
  @variabili globali qua...
.text
.global delta @ r0 <- a
              @ r1 <- b
              @ r2 <- c
              @ r0 <- risultato calcolo delta
.type delta, %function
delta:
  push {r3} @ preservo r3 perchè voglio usarlo e non so cosa ho dentro
  MUl r1,r1,r1 @ b^2
  MUL r3, r0, #4
  MUL r3, r3, r2 @ 4*a*c
  SUB r1, r1, r3 @ b^2-4*a*c
fine: 
  mov r0, r3
  pop {r3}
  mov pc, lr
