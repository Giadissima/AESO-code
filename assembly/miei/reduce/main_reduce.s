.data
  array: .word 1,2,3,4,7,19
  n_elementi: .word 6
  messaggio: .asciz "Il risultato è %d\n"
.text
.global main @ r0 <- numero da fattorizzare
              @ r0 <- codice di ritorno del main
.type main, %function

main: 
  ldr r0, =array
  ldr r1, =n_elementi
  ldr r1, [r1]
  mov r4, #0
  mov r5, #0
for: CMP R1, r5
  BEQ FINE
  LDR R3, [R0, R5, LSL #2] 
  ADD r4, R3, r4
  add r5, r5, #1 
  B for @ ripete il ciclo FOR
FINE: 
ldr r0, =messaggio
mov r1, r4
push {lr}
bl printf
mov r0, #0
pop {lr}
mov pc, lr
