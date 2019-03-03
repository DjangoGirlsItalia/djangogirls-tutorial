# Il tuo primo progetto Django!

> Parte di questo capitolo è basato su esercitazioni di Geek Girls (https://github.com/ggcarrots/django-carrots).
>
> Parti di questo capitolo sono basate sul [django-marcador tutorial](http://django-marcador.keimlink.de/) sotto la licenza Creative Commons Attributions-ShareAlike 4.0 International License. Il tutorial di django-marcador è protetto da copyright di Markus Zapke-Gründemann et al.

Creeremo un semplice blog!

Il primo passo è quello di iniziare un nuovo progetto di Django. Fondamentalmente, questo significa che eseguiremo alcuni script forniti da Django che creerà per noi lo scheletro di un progetto Django. Si tratta solo di un insieme di directory e file che verranno utilizzati dopo.

I nomi di alcuni file e cartelle sono molto importanti per Django. Non dovresti modificare i nomi dei file che stiamo per creare. Neanche spostarli in un altro posto è una buona idea. Django deve mantenere una determinata struttura per essere in grado di trovare le cose importanti.

La prima cosa è assicurarsi di essere nella cartella `djangogirls` che abbiamo creato prima.

Per verificare puoi digitare un comando che ti dirà in quale directory sei attualmente:

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
pwd
/Users/olasitarska/djangogirls
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="2" %}
cd
C:\Users\olasitarska\djangogirls
{% endpre %}

<!--endsec-->

Se dovessi vedere un percorso diverso (a parte il nome `olasitarska`), puoi accedere alla cartella con questi comandi

<!--sec data-title="macOS e Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
cd
cd djangogirls
{% endpre %}

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell", output="2" %}
cd %HOMEPATH%
cd djangogirls
{% endpre %}

<!--endsec-->

Ecco fatto, ora puoi procedere a creare il tuo primo progetto Django:

<!--sec data-title="Creare un Progetto: macOS o Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Dovresti eseguire nella tua console macOS o Linux il seguente comando **(non dimenticarti di aggiungere il punto `.` alla fine)**:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
python -m django startproject --template=https://github.com/simobasso/startproject/archive/master.zip --name=Procfile mysite .
{% endpre %}

> Il punto `.` è cruciale perchè dice allo script di installare Django nella cartella corrente (della quale il periodo `.` è una comoda reference).

> **Note** Quando scrivi il comando qui sopra, ricordati di scrivere solo quello che c'è dopo il simbolo `$`.

<!--endsec-->

<!--sec data-title="Creare un Progetto: Windows" data-id="django_start_project_windows" data-collapse=true ces-->


Su Windows devi lanciare il comando che segue. **(non dimenticarti di aggiungere il punto `.` alla fine)**:

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
python -m django startproject --template=https://github.com/simobasso/startproject/archive/master.zip --name=Procfile mysite .
{% endpre %}


> Il punto `.` è criuciale perchè dice allo script di installare Django nella cartella corrente (della quale il periodo `.` è una comoda reference).

> **Note** Quando scrivi il comando qui sopra, ricordati di scrivere solo quello che c'è dopo il simbolo `>`.

<!--endsec-->

`django-admin.py` è uno script che creerà le cartelle ed i file per te.

Se apri il programma di gestione file e apri la cartella `djangogirls`, dovresti vedere una struttura di directory simile a questa:

{% filename %}command-line{% endfilename %}
{% pre language="bash", output="1-7" %}
djangogirls
├── LICENSE
├── Procfile
├── manage.py
├── mysite
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── requirements.txt
├── requirements_base.txt
└── runtime.txt
{% endpre %}

`LICENSE` contiene la licenza con la quale condividi il tuo codice sorgente online. Questo file è molto importante perché indica alle altre programmatrici come possono utilizzare il codice che **tu** hai scritto.

`Procfile` e `runtime.txt` sono 2 configurazioni importanti per Heroku e indicano rispettivamente come il nostro blog deve essere avviato e sotto quale versione di Python deve girare. Sentiti libera di curiosarci dentro e chiedere maggiori informazioni al tuo coach.

I file come `requirements.txt` contengono le dipendenze del nostro blog, come ad esempio Django.

`manage.py` è uno script che aiuta a gestire il sito. Usandolo saremo in grado, oltre ad altre cose, di avviare un web server sul nostro computer senza dover installare nient'altro.

Il file `settings.py` contiene la configurazione del tuo sito web.

Ricordi quando abbiamo parlato di un postino che controlla dove rilasciare la lettera? il file `urls.py` contiene una lista di schemi usati da `urlresolver`.

Ignoriamo gli altri file per ora dal momento che non li modificheremo. L'unica cosa da ricordare è di non cancellarli per sbaglio!

## Installare i pacchetti

Per poter lanciare il nostro nuovo progetto Django abbiamo però bisogno di installare altre librerie.

Per fortuna abbiamo tutte le informazioni che ci servono raccolte nel file `requirements_base.txt` e quindi ci è sufficiente usare il comando `pip` per installare le librerie:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
pip install --user -r requirements_base.txt
{% endpre %}

## Modificare le impostazioni

Facciamo qualche cambiamento in `mysite/settings.py`. Apri il file usando il code editor che hai installato prima.

> **Note**: Tieni a mente che `mysite/settings.py` è un file come tutti gli altri. Puoi aprirlo con il tuo editor usando il menù in altro a sinistra "File -> Apri...". Questo dovrebbe farti vedere la classica finestra da cui puoi navigare e scegliere il file `settings.py`. Oppure puoi aprire il file aprendo la cartella e cliccandoci sopra col tasto destro, a questo punto seleziona l'editor dalla lista.

Sarebbe bello avere l'ora corretta sul nostro sito Web. Vai alla [lista di fusi orari di wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) e copia il tuo fuso orario (TZ). (Come ad esempio `Europe/Berlin`)

In `mysite/settings.py`, trova la riga che contiene `TIME_ZONE` e modificala per scegliere il tuo fuso orario:

{% filename %}mysite/settings.py{% endfilename %}
{% pre language="python" %}
TIME_ZONE = 'Europe/Rome'
{% endpre %}

Un'altra cosa molto utile da avere è il sito nella tua lingua e per farlo, come per l'orario, esiste un'opzione che ci permette di settare il codice della lingua.
Il codice della lingua è un identificativo univoco per le lingue ed è composto da due parti: una per la lingua, come ad esempio `en` per l'inglese o `de` per il tedesco, l'altra con il paese come `uk` per l'Inghilterra. [Django ha già pronto un serie di traduzioni pronte](https://docs.djangoproject.com/en/2.1/ref/settings/#language-code).

Scegli il codice che ti interessa dal link qui sopra e modifica l'opzione di conseguenza:

{% filename %}mysite/settings.py{% endfilename %}
{% pre language="python" %}
LANGUAGE_CODE = 'it-it'
{% endpre %}

## Imposta un database

Ci sono un sacco di software di database diversi che possono immagazzinare dati per il tuo sito. Noi useremo quello di default, `sqlite3`.

È già impostato in questa parte del file `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}
{% pre language="python" %}
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
{% endpre %}

Per creare un database per il nostro blog, eseguiamo questo nella console: `python manage.py migrate` (abbiamo bisogno di essere nella directory `djangogirls` che contiene il file `manage.py`). Se funziona, dovresti vedere qualcosa di simile:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-17" %}
python3 manage.py migrate
Operations to perform:
  Apply all migrations: auth, admin, contenttypes, sessions
Running migrations:
  Rendering model states... DONE
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying sessions.0001_initial... OK
{% endpre %}

E abbiamo finito! Tempo di avviare il server web e vedere se il nostro sito Web funziona!

Devi essere nella directory che contiene il file di `manage.py` (la directory `djangogirls`). Nella console, possiamo avviare il server web eseguendo `python manage.py runserver`:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
python3 manage.py runserver
{% endpre %}

Se sei su Windows e fallisce con `UnicodeDecodeError`, usa questo comando:

{% filename %}command-line{% endfilename %}
{% pre prompt=">", language="powershell" %}
python manage.py runserver 0:8000
{% endpre %}

Ora tutto quello che devi fare è controllare che il tuo sito sia in esecuzione. Apri il tuo browser (Firefox, Chrome, Safari, Internet Explorer o qualsiasi altro usi) e digita l'indirizzo:

{% filename %}browser{% endfilename %}
{% pre language="bash" %}
http://127.0.0.1:8000/
{% endpre %}

Congratulazioni! Hai appena creato il tuo primo sito e l'hai avviato usando un web server! Non è fantastico?

![Ha funzionato!!](images/it_worked2.png)

Mentre il web server gira, non vedrai nuovi prompt della command line per inserire nuovi comandi. Il terminale accetterà il testo ma non eseguirà i nuovi comandi. Questo perché il web server deve continuare a girare in continuzione per rimanere in ascolto di nuove richieste.

> Abbiamo visto come funzionano i web server nel capitolo **Come funziona internet**. Se non ti ricordi torna a dare un'occhiata.

Per fermare il server web, torna alla finestra dove è in esecuzione e premi i pulsanti CTRL+C insieme (su Windows, è probabile che tu deva premere Ctrl+Break).

Pronta per il prossimo passo? È ora di creare un po' di contenuti!
