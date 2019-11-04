# Introduzione alla linea di comando

Eccitante, vero? Scriverai la tua prima riga di codice in pochi minuti :)

**Ti presentiamo il tuo primo nuovo amico: la linea di comando!**

I prossimi passaggi ti mostreranno come utilizzare quella 'finestra nera' che tutti gli hacker utilizzano. Ti potrà sembrare un po' allarmante all'inizio, ma è solamente un prompt in attesa dei tuoi comandi.

> **Nota bene** : in tutto questo tutorial usiamo sia il termine *directory* che *cartella* ma sono la stessa cosa.

## Cos'è la linea di comando?

La finestra solitamente chiamata **linea di comando** o **interfaccia della linea di comando** è un'applicazione basata su testo che ti permette di visualizzare, gestire e manipolare i file sul tuo computer. Molto simile a Windows Explorer o al Finder su Mac, ma senza l'interfaccia grafica. Altri nomi per la command line sono: *cmd*, *CLI*, *prompt*, *console*, *command-line*, *prompt dei comandi*  o *terminale*.

## Aprire l'interfaccia della linea di comando

Per cominciare a sperimentare dobbiamo aprire l'interfaccia della nostra linea di comando.

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Vai in Start menu → Accessori → Prompt dei comandi.

> Per le vecchie versioni di windows, guarda in Start menu → Windows System → Command Prompt.

<!--endsec-->

<!--sec data-title="macOS" data-id="OSX_prompt" data-collapse=true ces-->

Vai in Applicazioni → Utilità → Terminale.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

Probabilmente è sotto Applicazioni → Accessori → Terminal, ma quello potrebbe dipendere dal tuo sistema. Se non è lì cercalo su Google :)

<!--endsec-->

## Prompt

Ora dovresti essere in grado di vedere una finestra bianca o nera che è in attesa di ricevere un comando.

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Se sei su Mac o Linux, probabilmente vedi `$`, proprio come questo:

{% filename %}command-line{% endfilename %}
```
$
```

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

Su Windows, è un segno `>`, come questo:

{% filename %}command-line{% endfilename %}
```
>
```

<!--endsec-->

Ogni comando sarà preceduto da questo simbolo e da uno spazio, ma tu non hai bisogno di digitarlo. Il computer lo farà per te :)

> Solo una piccola nota: nel tuo caso ci dovrebbe essere qualcosa come `C:\Users\ola>` oppure `Olas-MacBook-Air:~ ola$` prima del segno di prompt. È corretto al 100%. In questo tutorial lo semplificheremo al massimo.

La parte fino a `$` o a `>` è chiamata *command line prompt*, o *prompt* per comodità. Ti richiede di inserire qualcosa.

Nel tutorial, quando dovrai scrivere qualche comando, noi lo mostreremo con incluso `$` o `>` e a volte con altre cose alla sua sinistra. Ignora quella parte e scrivi semplicemente il comando che inizia dopo il prompt.

## Il tuo primo comando (YAY!)

Cominciamo con qualcosa di veramente semplice. Digita questo comando:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
whoami
{% endpre %}

<!--endsec-->


<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
whoami
{% endpre %}

<!--endsec-->

Premi `invio`. Questo è il nostro risultato:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
whoami
olasitarska
{% endpre %}

Come puoi vedere, il computer ha appena stampato il tuo nome utente. Bello, eh?:)

> **Prova a digitare ogni comando, non copiare ed incollare. Ti ricorderai di più in questo modo!**

## Nozioni di base

Ogni sistema operativo ha un insieme di comandi leggermente diverso per la command line, per cui assicurati di seguire le istruzioni per il tuo sistema operativo. Proviamo questo, ti va?

### Cartella corrente

Sarebbe bello sapere dove siamo adesso, vero? Vediamo. Digita questo commando e premi `invio`:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
pwd
/Users/olasitarska
{% endpre %}

> Nota: `pwd` sta per 'print working directory'.

<!--endsec-->  

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="2" %}
cd
C:\Users\olasitarska
{% endpre %}

> Note: `cd` sta per 'change directory'. Con powershell puoi usare `pwd` esattamente come su Linux o su macOS.

<!--endsec-->  

Probabilmente vedrai qualcosa di simile sul tuo computer. Quando apri la command-line normalmente inizi sulla tua directory home.

---

### Elenco di file e cartelle

Cosa c'è dentro? Sarebbe bello scoprirlo. Vediamo come:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-6" %}
ls
Applications
Desktop
Downloads
Music
...
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="2-7" %}
dir
Directory of C:\Users\olasitarska
05/08/2014 07:28 PM <DIR>      Applications
05/08/2014 07:28 PM <DIR>      Desktop
05/08/2014 07:28 PM <DIR>      Downloads
05/08/2014 07:28 PM <DIR>      Music
...
{% endpre %}

> Nota: In powershell puoi anche usare 'ls' come su Linux e macOS.
<!--endsec-->

---

### Cambiare cartella corrente

Ora, andiamo nella nostra directory Desktop:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
cd Desktop
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
cd Desktop
{% endpre %}

<!--endsec-->

Controlla ora se ti sei veramente spostata:


<!--sec data-title="macOS e Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
pwd
/Users/olasitarska/Desktop
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="2" %}
cd
C:\Users\olasitarska\Desktop
{% endpre %}

<!--endsec-->

Ecco fatto!

> Suggerimento PRO: se digiti `cd D` e poi premi `tab` sulla tastiera, la command-line completerà automaticamente il resto del nome per cui puoi navigare più velocemente. Se c'è più di una cartella che comincia con "D", premi `tab` due volte per ottenere la lista con tutte le opzioni.

---

### Creare una directory

Che ne dici di creare una directory di pratica sul tuo desktop? Puoi farlo in questo modo:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
mkdir practice
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
mkdir practice
{% endpre %}

<!--endsec-->

Questo breve comando creerà una cartella con il nome `practice` sul tuo desktop. Puoi controllare se è lì semplicemente guardando sul tuo desktop oppure eseguendo i comandi `ls` e `dir`! Provalo :)

> Suggerimento PRO: se non vuoi digitare lo stesso comando tutte le volte, prova a premere ` freccia in su ` e `freccia in giù` sulla tua tastiera per scorrere tutti i comandi che hai usato fin ora.

---

### Esercizio!

Piccola sfida per te: nella tua directory appena creata `practice` crea una directory chiamata `test`. Usa i comandi `cd` e `mkdir`.

#### Soluzione:
<!--sec data-title="macOS e Linux" data-id="OSX_Linux_es" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="4" %}
cd practice
mkdir test
ls
test
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_es" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="4" %}
cd practice
mkdir test
dir
05/08/2014 07:28 PM <DIR>      test
{% endpre %}

<!--endsec-->

Congratulazioni! :)

---

### Facciamo ordine

Non vogliamo lasciare un pasticcio, per cui rimuoviamo tutto quello che abbiamo fatto fino a questo punto.

Per prima cosa dobbiamo tornare al Desktop:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_desktop" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
cd ..
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_desktop" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
cd ..
{% endpre %}

<!--endsec-->

Usando `..` con il comando `cd` cambierai la tua directory attuale alla directory padre (si tratta della cartella che contiene la tua directory attuale).

Controlla dove ti trovi ora:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_desktop_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
pwd
/Users/olasitarska/Desktop
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_desktop_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="2" %}
cd
C:\Users\olasitarska\Desktop
{% endpre %}

<!--endsec-->

Adesso è l'ora di cancellare la directory `practice`:

> **Attenzione**: cancellare un file usando `del`, `rmdir` o `rm` è irreversibile, *i file cancellati andranno perduti per sempre*! Per cui sii molto prudente nell'utilizzare questi comandi.

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
rm -r practice
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="2" %}
rmdir /S practice
practice, Procedere con l'operazione <S/N>? S
{% endpre %}

<!--endsec-->

Fatto! Per essere sicuri che sia stata effettivamente cancellata, controlliamo:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_check" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
ls
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_check" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
dir
{% endpre %}

<!--endsec-->

### Uscire dalla command line

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
exit
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
exit
{% endpre %}

<!--endsec-->

Figo, eh? :)

## Indice

Questo è un riepilogo di alcuni comandi utili:

| Comandi (Windows)  | Comandi (macOS / Linux) | Descrizione                 | Esempio                                           |
| ----------------  | ------------------------ | --------------------------- | ------------------------------------------------- |
| `exit`            | `exit`                   | chiudi la finestra          | **exit**                                          |
| `cd`              | `cd`                     | cambiare directory          | **cd test**                                       |
| `cd`              | `pwd`                    | mostra la cartella attuale  | **cd test**                                       |
| `dir`             | `ls`                     | elenco directory/file       | **dir**                                           |
| `copy`            | `cp`                     | copia un file               | **copy c:\test\test.txt c:\windows\test.txt**     |
| `move`            | `mv`                     | spostare un file            | **move c:\test\test.txt c:\windows\test.txt**     |
| `mkdir`           | `mkdir`                  | creare una nuova directory  | **mkdir testdirectory**                           |
| `rmdir` (o `del`) | `rm`                     | eliminare un file           | **del c:\test\test.txt**                          |
| `rmdir /S`        | `rm -r`                  | eliminare una directory     | **rm -r testdirectory**                           |

Questi sono solo alcuni dei comandi che puoi eseguire sulla tua command line, ma non ne userai altri oltre a quelli spiegati oggi.

Se sei curioso/a, [ss64.com][1] contiene una guida completa ai comandi per tutti i sistemi operativi.

 [1]: https://ss64.com

## Fatto?

Tuffiamoci in Python!
