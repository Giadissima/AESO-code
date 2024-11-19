.data
  msg1: .asciz "Uso: qemu-arm a.out <num1>\n"
  msg2: .asciz "Il fattoriale di %d e' %d\n"
.text
.global main  @ r0 <- argc
              @ r1 <- argv
              @ r0 <- risultato
.type main, %function
main:
  push {lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione

  CMP r0, #1
  BEQ argc_error

  LDR r0, [r1, #4] @ r0 = num inserito in stringa (argv[1])
  BL atoi @ ora r0 contiene il numero da fattorizzare
  push {r0}
  BL fatt_rec
  
  mov r2, r0 @ r2 = fattoriale(n)
  pop {r1} @ r1 = n
  LDR r0, =msg2
  Bl printf
  MOV r0, #0
  B fine
argc_error:
  LDR r0, =msg1
  BL printf
  MOV r0, #1
fine: 
  pop {lr} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
