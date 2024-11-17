       .data
 mess: .string "Il fattoriale di %d è %d\n"
 scan: .string "%127s"
 erms: .string "La lettura da stdin non è andata bene\n"
  buf: .fill 128 @ spazio per stringa da 128 caratteri (compreso \0)

       .text
       .global main @ r0 <- valore di ritorno al preambolo GCC
       .type main, %function

 main: push {lr}
       ldr r0, =scan @ r0 contiene indirizzo stringa scan
       ldr r1, =buf @ r1 contiene indirizzo inziale del buffer
       bl scanf
       cmp r0, #0 @ scanf è fallita?
       ble bad
       ldr r0, =buf @ r0 contiene indirizzo inziale del buffer
       bl atoi @ dopo questa, r0 contiene il numero di cui calcolare il fattoriale
       push {r0} @ mi salvo il numero n di cui calcolare il fattoriale
       bl fact @ dopo questa, r0 contiene il fattoriale
       mov r2, r0 @ salvo Fact(n) in r2
       pop {r1} @ recupero in r1 il valore n
       ldr r0, =mess @ r0 contiene indirizzo stringa mess
       bl printf
       pop {lr}
       mov r0, #0
       mov pc, lr

 bad: ldr r0, =erms
      bl printf
      pop {lr}
      mov r0, #0
      mov pc, lr
