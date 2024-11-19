.data
  v1: .word 1,2,4,5,3,5,32
  v2: .word 1,2,4,5,3,5,32
  n_array: .word 7 
  msg: .asciz "%do numero: %d\n"
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
  MOV r3, #0 @int i=0;
  for:
    CMP r3, r2 @ i < r2
    BEQ fine
    LDR r1, [r0, r3, LSL #2]  @ v[i]
    push {r0,r1, r2,r3}
    ldr r0, =msg
    MOV r2, r1
    MOV r1, r3
    ADD r1, r1, #1
    BL printf
    pop {r0,r1, r2,r3}
    ADD r3, r3, #1 @ i++
  B for
fine: 
  @ mettere eventuale mov in r0 per il return ...
  pop {lr} @ ripristino dei registri persistenti del chiamante
  MOV r0,#0 
  mov pc, lr
