.data
  @variabili globali qua...
.text
.global fibo  @ r0 <- n
              @ r0 <- risultato
.type fibo, %function
fibo:
  push {lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione

  @ CASI BASE
  @ If then
  CMP r0, #0
  BNE endif
    b fine
  endif:
  @ If then
  CMP r0, #1
  BNE endif2
    b fine
  endif2:

  SUB r0, r0, #1
  push {r0} @ n-1, mi serve per la seconda chiamata ricorsiva
  BL fibo @ r0 ris fibo(n-1)
  mov r1, r0 @ r1 = ris fibo(n-1)
  pop {r0} @ n-1
  SUB r0, r0, #1
  push {r1}
  BL fibo
  pop {r1}
  ADD r0, r0, r1
fine: 
  @ mettere eventuale mov in r0 per il return ...
  pop {lr} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
