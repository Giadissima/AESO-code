.data
.text
.global count_zero @ r0 <- array
              @ R1 = size array
              @ r0 <- risultato
.type count_zero, %function
count_zero:
  mov r2, #0 @ int i = 0
  mov r4, #0 @ int n_zeri = 0
for:
  CMP r2, r1 @ i < size(v)?
  BEQ fine
  LDR r3, [r0, r2, LSL #2]  @ v[i]
  CMP r3, #0
  ADDEQ r4,r4,#1
  ADD r2, r2, #1
  b for
fine: 
  MOV r0, r4
  mov pc, lr
