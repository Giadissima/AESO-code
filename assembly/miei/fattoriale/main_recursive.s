.data
  msg1: .asciz "Dammi il numero di cui vuoi calcolare il fattoriale\n"
  msg2: .asciz "errore sconosciuto nella scanf\n"
  msg3: .asciz "Il fattoriale di %d e' %d\n"
  msg4: .asciz "%d\n"
  scanf_format: .asciz "%10s"
  buf: .fill 10 
.text
.global main  @ r0 <- par1
              @ r0 <- risultato
.type main, %function
main:
  push {lr} @ i registri r4-r11,r13-15 (SP, LR, PC) devono mantenere i valori precedenti alla chiamata di funzione
  LDR r0, =msg1
  BL printf

  LDR r0, =scanf_format
  LDR r1, =buf
  BL scanf @ r0 = num di elementi memorizzati, r1 = puntatore al buffer
  CMP r0, #0
  BLE scanf_error

  LDR r0, =buf @ r0 = num inserito
  BL atoi @ ora r0 contiene il numero da fattorizzare
  push {r0}
  BL fatt_rec
  mov r2, r0 @ r2 = fattoriale(n)
  pop {r1} @ r1 = n
  LDR r0, =msg3
  Bl printf
  MOV r0, #0
  B fine
scanf_error:
  LDR r0, =msg2
  MOV r0, #1
fine: 
  pop {lr} @ ripristino dei registri persistenti del chiamante
  mov pc, lr
