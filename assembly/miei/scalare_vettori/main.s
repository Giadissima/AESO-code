.data
  array: .word 1,2,4,5,3,5,32
  n_array: .word 7 
  x: .word 7 @ scalare 
  msg: .asciz "%do numero: %d\n"
.text
.global main @ r0 <- argv
              @ r1 <- argc
              @ r0 <- cod di ritorno del main (se ha successo 0)
.type main, %function
main:
  push {lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  LDR r0, =array
  LDR r1, =n_array
  LDR r1, [r1]  @ n_array
  LDR r2, =x  @ x scalare
  LDR r2, [r2]  @ x scalare
  push {r0, r1}
  BL scalare
  pop {r0, r1}
  MOV r3, #0 @int i=0;
  for:
    CMP r3, r1 @ i < r1
    BEQ fine
    LDR r2, [r0, r3, LSL #2]  @ v[i]
    push {r0,r1, r2, r3}
    ldr r0, =msg
    MOV r1, r3
    ADD r1, r1, #1
    BL printf
    pop {r0,r1, r2, r3}
    ADD r3, r3, #1 @ i++
  B for
fine: 
  @ mettere eventuale mov in r0 per il return ...
  pop {lr} @ ripristino dei registri persistenti del chiamante
  MOV r0,#0 
  mov pc, lr
