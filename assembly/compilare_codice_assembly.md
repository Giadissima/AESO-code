# Come compilare i file Armv7

## Installazione librerie

digitare questi comandi su macchina linux (Windows non è direttamente compatibile, se si vuole usarlo bisogna installare questi pacchetti sulla WSL)

```shell
sudo apt upgrade
sudo apt-get install qemu-system, qemu-user, gdb-multarch
```

## Utilizzo degli alias

Nella cartella assembly/aliases possiamo trovare due script che ci semplificheranno la compilazione e il debug del codice, quello che dobbiamo fare è **aggungerlo alla variable di ambiente "Path"**. I comandi sottostanti faranno sempre utilizzo di questi aliases.

### Aggiungere un path a "Path" su Zsh

```shell
nano ~/.zshrc
```

e nel file aggiungerci la path dove sono storati gli aliases (in questo caso li possiamo trovare dentro la cartella assembly/aliases nella main root di questa repo):

```shell
export PATH=$PATH:/path/to/add
```

Se sei in una WSL devi aggiungere al path:

```shell
export PATH=$PATH:/mnt/c/path/to/add
```

### Aggiungere un path a "Path" su bash

```shell
nano ~/.bashrc
```

e nel file aggiungerci la path dove sono storati gli aliases (in questo caso li possiamo trovare dentro la cartella assembly/aliases nella main root di questa repo):

```shell
export PATH="$PATH:/path/to/add"
```

Se sei in una WSL devi aggiungere al path:

```shell
export PATH="$PATH:/mnt/c/path/to/add"
```

## Compilazione

Facciamo un esempio: dobbiamo compilare un main in c e un file assembly di una funzione che si chiama conta (i file assembly hanno estensione .s). Per compilarlo usiamo il seguente comando:

```shell
agcc main.c conta.s
```

Stessa operazone la potremmo fare se ho solo file .c o se ho solo file .s, basta cambiare l'estensione.

La compilazione genera un file che si chiama a.out, che sarà il file linkato su cui farci l'esecuzione

## Esecuzione

Scrivere nella cartella di dove è stato compilato il file

```shell
qemu-arm a.out <args>
```

## Debug con GDB

Se si presenta un bug su codice assembly, possiamo debuggarlo facilmente tramite l'uso di gdb, che nel nostro caso sarà richiamato tramite l'alias agdb

### Avvio del debug

Prima di debuggare il codice dobbiamo compilarlo e generare il file a.out, una volta fatto ciò basta avviare gdb con l'alias prestabilito

```bash
agdb <args>
```

### Aggiungere argomenti

Se avviando gdb in questo modo non funziona:

```bash
agdb <args>
```

Allora prova così (soluzione sicura):

```bash
agdb <args>
(gdb) set args argomenti
```

### Creazione dei breakpoint

In qualsiasi momento ma soprattutto da fare come prima operazione, per poter debuggare è necessario mettere dei breakpoint

```bash
(gdb) break main
```

Successivamente dobbiamo arrivare al nostro primo breakpoint avviando il programma e eseguendo il comando continue

```bash
(gdb) run
(gdb) c
```

### Istruzione successiva

Se digitiamo

```bash
(gdb) n
```

passiamo all'istruzione successiva

### Monitorare i registri

Per poter debuggare al meglio avendo una vista completa del codice e dei registri basta eseguire il comando

```bash
(gdb) tui reg general
```
