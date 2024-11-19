.data
  msg1: .asciz "uso: qemu-system a.out <n>\n"
  msg2: .asciz "La seq di fibo del numero %d e' %d\n"
.text
.global main  @ r0 <- argc
              @ r1 <- argv
              @ r0 <- risultato
.type main, %function
main:
  push {lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  
  CMP r0, #1
  BEQ argc_error

  LDR r0, [r1, #4] @ r0 = argv[1] = n
  bl atoi
  push {r0}
  BL fibo
  pop {r1}
  mov r2, r0
  LDR r0, =msg2
  BL printf
  B fine

argc_error:
  LDR r0, =msg1
  BL printf
  MOV r0, #1
fine: 
  MOV r0, #0
  pop {lr} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
