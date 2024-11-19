@ int fattoriale(int n){
@   if(n==0) return 1
@   else return n*fattoriale(n-1)
@ }

.data
  @variabili globali qua...
.text
.global fatt_rec @ r0 <- n
              @ r0 <- risultao fattoriale
.type fatt_rec, %function
fatt_rec:
  push {lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  mov r1, r0 @  r1 = copia di n
  
  @ caso base
  cmp r1, #0
  moveq r0, #1
  beq fine

  @ caso iterativo
  sub r0, r0, #1 @ n--
  push {r1}
  BL fatt_rec @ fatt_rec(n-1)
  pop {r1}
  UMULL r0, r2,r1,r0 @ fatt_rec(n-1) * n
  CMP r2, #0
  MOVNE r0, #0
fine: 
  pop {lr} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
