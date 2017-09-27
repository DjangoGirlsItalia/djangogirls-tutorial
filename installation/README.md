# Installazione

Nel workshop costruirai un blog, e ci sono alcuni task dedicati all'impostazione che sarebbe bello completare in anticipo, in modo che tu sia pronta a scrivere codice in giornata.

Assicurati di avere il tuo coach a disposizione in caso di dubbi o problemi.

Buona fortuna!

# Installare Python

> Questa sezione si basa su un tutorial fatto da Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django è scritto in Python. Abbiamo bisogno di Python per fare qualsiasi cosa in Django. Iniziamo con l'installazione! Vogliamo che sul tuo pc sia installato Python 3.6.2 quindi se hai una versione precedente, dovrai aggiornarlo.

<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

Per prima cosa bisogna controllare se la tua verisione di Windows è a 32-bit o 64-bit, per farlo premi il tasto `Windows + Pausa/Break`, che apriranno le informazioni di sistema e cerca "Tipo sistema". 

![Tipo sitema](/installation/images/sistemtype.jpg)

Puoi scaricare Python per Windows dal sito web https://www.python.org/downloads/windows/. Fai click sul link "Latest Python 3 Release - Python x.x.x". 

Scorri la pagina fino al fondo e se la tua versione di Windows è **64-bit**, scarica **Windows x86-64 executable installer**. Altrimenti, scarica **Windows x86 executable installer**.

Dopo aver scaricato l'installer, lo dovresti eseguire (cliccaci sopra due volte) e segui le istruzioni. È importante ricordare il percorso (la directory) dove ha installato Python. Più tardi sarà necessario!

Una cosa a cui fare **attenzione**: in una schermata dell'installazione guidata, contrassegnata con "Setup", assicurati di scegliere l'opzione "Add Python 3.6 to PATH", come illustrato qui:

![Non dimenticare di aggiungere Python al Path](./images/python-installation-options.png)

Nei prossimi passaggi dovrai usare la **linea di comando** (ne parleremo più avanti nel tutorial). Per adesso, se hai bisogno di aprirla, vai nel menù Start → Windows System → Command Prompt. Puoi anche tenere premuto il tasto `Windows` e premere il pulsante `R` finché la finestra `Run` non compare. Per aprire la linea di comando ti basterà scrivere `cmd` e premere `enter` nella finestra `Run`.
(Nelle nuove versioni di Windows potrebbe essere necessario cercare `Prompt dei comandi` perché a volte è nascosta.)

![Scrivi "cmd" nella finestra "Run"](/installation/images/windows-plus-r.png)

>Nota: se stai usando una vecchia versione di Windows (7, Vista, or any older version) e l'installer di python 3.6.x ti da un errore puoi provare queste cose:

>1. Installa tutti gli update di Windows Updates e riprova; or
2. installa una [vecchia versione Python](https://www.python.org/downloads/windows/), es., [3.4.6](https://www.python.org/downloads/release/python-346/).

>Se installi una vecchia versione di Python, la schermata di installazione potrebbe essere un pochino diversa. **Assicurati** di scrollare per vedere "Add python.exe to Path", quindi fai click sul bottone a sinistra e seleziona "Will be installed on local hard drive":

![Non dimenticare di aggiungere Python al Path](/installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Nota** Prima di installare Python su OS X, devi assicurarti che nelle impostazioni del tuo Mac permettano l'installazione di applicazioni che non provengono dell'App Store. Vai nelle `Preferenze di Sistema` cliccando sulla mela in alto a sinistra, fai click su `Sicurezza & Privacy`, qundi sul tab `Generali`. Se `Consenti app scaricate da:` è impostato su `App Store` cambialo in `App Store e sviluppatori identificati`.

![App Store e sviluppatori identificati](./images/AppStore.png)

Devi andare sul sito https://www.python.org/downloads/mac-osx/. Fai click sul link "Latest Python 3 Release - Python x.x.x" e scarica il programma d'installazione di Python:

* Scarica *Mac OS X 64-bit/32-bit installer*,
* Fai doppio click sul file appena scaricato per iniziare l'installazione.

Nei prossimi passaggi dovrai usare la **linea di comando** (ne parleremo più avanti nel tutorial). Per adesso, se hai bisogno di aprirla, vai nel `Launchpad` e apri l'app `Terminale`. Puoi anche tenere premere contemporanemente il tasto `mela + spazio` e comparirà la barra di ricerca. Per aprire la linea di comando ti basterà scrivere `Terminale` e premere `enter`.

<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

### Linux

Nei prossimi passaggi dovrai usare la **linea di comando** (ne parleremo più avanti nel tutorial). Per adesso, se hai bisogno di aprirla, vai nelle `Applicazioni` e apri l'app `Terminale`. 

È molto probabile che tu abbia Python già installato di default. Per controllare se ce l'hai già installato (e quale versione è), apri linea di comando e digita il seguente comando:

{% filename %}command-line{% endfilename %}
{% pre prompt="$ ", language="bash", output="2" %}
python3 --version
Python 3.6.2
{% endpre %}

Se non hai Python installato o se vuoi una versione diversa, puoi installarla come segue:

#### Debian o Ubuntu

Digita questo comando nella tua console:

{% filename %}command-line{% endfilename %}
{% pre prompt="$ ", language="bash" %}
sudo apt-get install python3.6
{% endpre %}

#### Fedora

Usa questo comando nella tua console:

{% filename %}command-line{% endfilename %}
{% pre prompt="$ ", language="bash" %}
sudo dnf install python3.6
{% endpre %}

#### openSUSE

Usa questo comando nella tua console:

{% filename %}command-line{% endfilename %}
{% pre prompt="$ ", language="bash" %}
sudo zypper install python3
{% endpre %}

<!--endsec-->

Verifica che l'installazione sia andata a buon fine aprendo la command line e scrivi il comando `python3`:

{% filename %}command-line{% endfilename %}
{% pre prompt="$ ", language="bash", output="2" %}
python3 --version
Python 3.6.2
{% endpre %}

**NOTA:** Se usi Windows e ottieni un messaggio di errore tipo `python3` non è stato trovato, prova ad usare solo `python` (senza il `3`) e controlla che sia una versione di Python 3.6 come mostrato sopra.

----

Se hai dubbi o se qualcosa è andato storto e non hai idea di cosa fare dopo - chiedi al tuo insegnante! A volte le cose non vanno come dovrebbero ed è meglio chiedere aiuto a qualcuno con più esperienza.

# Installare Django

> Una parte di questo capitolo si basa sui tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Una parte di questo capitolo di basa sul [django-marcador tutorial](http://django-marcador.keimlink.de/) sotto licenza Creative Commons Attribution-ShareAlike 4.0 International License. Il tutorial di django-marcador è protetto da copyright di Markus Zapke-Gründemann et al.

## Ambiente virtuale

Prima di installare Django, ti vogliamo far installare uno strumento estremamente utile per tenere in ordine l'ambiente in cui programmerai sul tuo computer. Potresti saltare questo passaggio, ma è caldamente consigliato soffermarsi. Se inizi con la migliore configurazione possibile, ti risparmierai un sacco di problemi per il futuro!

Per cui, creiamo ora un **ambiente virtuale** (chiamato anche un *virtualenv*). Virtualenv isolerà la tua configurazione di Python/Django in base ai diversi progetti. Questo significa che qualunque modifica farai su un sito non avrà alcun effetto su tutti gli altri che stai sviluppando. Chiaro ora?

Tutto quello che devi fare è trovare una cartella in cui vuoi creare il `virtualenv`; la tua home directory, ad esempio. Su Windows potrebbe essere `C:\Users\Name` (dove `Name` è il nome del tuo login).

Per questo tutorial useremo una nuova directory `djangogirls` dalla tua home directory:

    mkdir djangogirls
    cd djangogirls
    

Ora creeremo un virtualenv dal nome `myvenv`. Questo è il formato del comando generale:

    python3 -m venv myvenv
    

### Windows

Per creare un nuovo `virtualenv` è necessario aprire la console (ti abbiamo spiegato come fare nei capitoli precedenti, ricordi?) ed esegui `C:\Python34\python -m venv myvenv`. Il risultato somiglierà a questo:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv
    

dove `C:\Python34\python` è la directory in cui precedentemente hai installato Python e `myvenv` è il nome del tuo `virtualenv`. Puoi utilizzare qualsiasi altro nome, ma attieniti a utilizzare le minuscole, a non usare spazi, accenti o caratteri speciali. È meglio usare un nome breve dal momento che dovrai digitarlo spesso!

### Linux e OS X

Creare un `virtualenv` su Linux e OS X è semplice, basta digitare: `python3 -m venv myvenv`. Il risultato sarà simile a questo:

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` è il nome del tuo `virtualenv`. Puoi usare qualsiasi altro nome, ma utilizza solo minuscole e niente spazi. Sarebbe meglio se il nome fosse corto perchè lo dovrai digitare molte volte!

> **NOTA:** Avviare il virtualenv su Ubuntu 14.04 in questa maniera al momento darà il seguente errore:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Per aggirare il problema utilizza, invece del precedente, il comando `virtualenv`.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Lavorare con virtualenv

Il comando sopra specificato, creerà una cartella dal nome `myvenv` (o col nome che hai scelto) che contiene il tuo virtual environment (ovvero un mucchio di files e cartelle).

#### Windows

Avvia il tuo virtualenv digitando:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    


#### Linux e OS X

Avvia il tuo virtualenv digitando:

    ~/djangogirls$ source myvenv/bin/activate
    

Ricordati di sostituire `myvenv` con il nome `virtualenv` che hai scelto!

> **Nota:** a volte il comando `source` potrebbe non essere disponibile. In quel caso prova ad usare questo:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Saprai con certezza che hai avviato `virtualenv` quando vedrai che il prompt dei comandi nella console si presenta così:

    (myvenv) C:\Users\Name\djangogirls>
    

oppure:

    (myvenv) ~/djangogirls$
    

Fai caso al prefisso `(myvenv)`!

Quando si lavora all'interno di un ambiente virtuale, `python` farà automaticamente riferimento alla versione corretta da utilizzare. Per cui puoi digitare `python` invece `python3`.

OK, abbiamo tutte le dipendenze importanti pronte. Finalmente possiamo installare Django!

## Installare Django

Ora che hai iniziato ad utilizzare il tuo `virtualenv`, puoi installare Django usando `pip`. Nella console, esegui `pip install django==1.8` (nota che usiamo un doppio simbolo di uguale: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

Su Windows

> Se ottieni un errore quando chiami pip sulla piattaforma Windows controlla se il pathname del tuo progetto contiene spazi, accenti o caratteri speciali (i.e. `C:\Users\User Name\djangogirls`). Se è così ti conviene spostarlo in un altro path senza spazi, accenti o caratteri speciali (il suggerimento è: `C:\djangogirls`). Dopo averlo spostato, prova ad eseguire di nuovo il comando di cui sopra.

su Linux

> Se ottieni un errore quando esegui il comando pip su Ubuntu 12.04, prova ad eseguire `python -m pip install -U --force-reinstall pip` per risolvere il problema.

Questo è tutto! Sei (finalmente) pronto/a a creare un'applicazione Django!

# Installare un editor di codice

{% include "/code_editor/instructions.md" %}

# Installare Git

{% include "/deploy/install_git.md" %}

# Creare un account su GitHub

Vai su [GitHub.com](https://www.github.com) e iscriviti per un nuovo account gratuito.

# Creare un account su Heroku

{% include "/deploy/signup_pythonanywhere.md" %}

# Inizia la lettura

Complimenti, ora sei pronta! Se hai un po' di tempo prima del workshop, potrebbe essere utile cominciare a leggere i capitoli iniziali:

  * [Come funziona Internet](../how_the_internet_works/README.md)

  * [Introduzione alla command line](../intro_to_command_line/README.md)

  * [Introduzione a Python](../python_introduction/README.md)

  * [Che cos'è Django?](../django/README.md)
