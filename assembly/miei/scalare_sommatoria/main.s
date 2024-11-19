.data
  v1: .word 1,2,4,5,3,5,1
  v2: .word 1,2,4,5,3,5,1
  n_array: .word 7 
  msg: .asciz "Il risultato e': %d\n"
.text
.global main @ r0 <- argv
              @ r1 <- argc
              @ r0 <- cod di ritorno del main (se ha successo 0)
.type main, %function
main:
  push {lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  LDR r0, =v1
  LDR r1, =v2
  LDR r2, =n_array
  LDR r2, [r2]  @ n_array
  push {r2}
  BL scalare
  pop {r2}
  MOV r1, r0
  ldr r0, =msg
  BL printf
fine: 
  @ mettere eventuale mov in r0 per il return ...
  pop {lr} @ ripristino dei registri persistenti del chiamante
  MOV r0,#0 
  mov pc, lr
