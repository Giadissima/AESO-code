.data
.text
.global calcolo_eq_secondo_grado @ r0 <- a
              @ r1 <- b
              @ r2 <- c
              @ r3 <- x
              @ r0 <- risultato
.type calcolo_eq_secondo_grado, %function
calcolo_eq_secondo_grado:
  @r4 = risultato temporaneo
  MUl r4, r3, r3 @ r4 = x^2
  MUL r4, r4, r0 @ ax^2

  MUL r5, r1, r3 @ bx

  ADD r4, r4, r5
  ADD r4, r4, r2

fine: 
  mov r0, r4
  mov pc, lr
