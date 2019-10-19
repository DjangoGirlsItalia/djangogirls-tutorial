# Deploy!

> **Note** Il seguente capitolo può essere difficile in alcuni passaggi. Non mollare e cerca di portarlo a termine; deployment (termine abbastanza complicato da tradurre, ma indica tutto ciò che tu rendi LIVE, accessibile sul web e non più solo dal tuo computer) è una parte importante nel processo di costruzione di un sito web. Questo capitolo è inserito a metà del tutorial per far sì che il tuo tutor possa aiutarti con il processo leggermente più complesso di messa online del sito. Questo significa che puoi ancora finire il tutorial da sola se sei a corto di tempo.

Fino ad ora il tuo sito è accessibile solo dal tuo computer, ma ora imparerai come metterlo online! Deploying è il processo di pubblicazione online del tuo progetto in modo tale che sia visibile anche da altre persone :).

Come hai già visto ogni sito internet deve essere ospitato su un server. Ci sono tantissimi server provider disponibili su internet. Noi ne useremo uno che ha un processo di deployment relativamente semplice: [Heroku](https:/heroku.com). Questo provider è gratuito per piccole applicazioni che non hanno troppi visitatori. Sarà quindi perfetto per te al momento.

# Git

Git è un "sistema di controllo versione" utilizzato da molti programmatori. Questo software può tracciare le modifiche nel corso del tempo ad i file, in questo modo puoi ripristinare successivamente una specifica versione. Un po' come l'opzione "traccia modifiche" in Microsoft Word, ma molto più potente.

## Inizializzare un repository Git

Git tiene traccia delle modifiche a un particolare insieme di file in quello che è chiamato repository di codice (o "repo" in breve). Iniziamone uno per il nostro progetto. Apri la console ed esegui questi comandi nella directory `djangogirls`:

> **Note** controlla la directory su cui stai lavorando adesso con il comando `pwd`(OSX/Linux) oppure `cd`(Windows) prima di iniziare il repository. Dovresti essere nella cartella `djangogirls`.

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
git init
Initialized empty Git repository in ~/djangogirls/.git/
git config --global user.name "Il tuo nome"
git config --global user.email tu@example.com
{% endpre %}

Dobbiamo inizializzare il repository git solo una volta per ogni progetto (e non dovrai più reinserire il nome utente e l'email).

Git memorizzerà le modifiche a tutti i file e le cartelle in questa directory, ma ci sono alcuni file che vogliamo ignorare. Si fa creando un file chiamato `.gitignore` nella directory di base. Apri il tuo editor e crea un nuovo file con questo contenuto:

{% filename %}.gitignore{% endfilename %}
{% pre language="python" %}
*.pyc
__pycache__
myvenv
db.sqlite3
/static
.DS_Store
{% endpre %}

E salvalo come `.gitignore` all'interno della cartella "djangogirls".

> **Note** Il punto all'inizio del nome del file è importante! Se hai difficoltà nel crearlo (ad esempio, ai Mac non piace quando crei file che iniziano con un punto tramite il Finder), allora usa la funzionalità "Salva con nome" nel tuo editor, è a prova di bomba.

> **Note** Uno dei file che hai inserito nel tuo `.gitignore` è `db.sqlite3`. Quello è il tuo database locale dove tutti i tuoi post sono salvati. Non lo vogliamo aggiungere al tuo repository perchè Heroku userà un altro database. Il database può essere SQLite, come sulla tua macchina locale, ma generalmente userai PostgreSQL che può gestire molti più visitatori di SQLite. In ogni caso, ignorando il tuo database SQLite per la copia remota, ogni post che hai creato fino a questo punto continuerà ad essere visibile in locale, ma dovrai aggiungerne di nuovi in produzione. Devi pensare al tuo database locale come un posto sicuro dove testare cose nuove senza dover proccuparti di eliminare i tuoi veri post dal tuo blog.

È una buona idea usare il comando `git status` prima di `git add` oppure ogni volta che non sei sicura di cosa sia cambiato. Questo aiuterà ad evitare eventuali brutte sorprese, come file sbagliati che vengono aggiunti o a cui viene fatto il commit. Il comando `git status` restituisce informazioni riguardanti qualsiasi file non tracciato/modificato/in staging, lo stato del branch e molto altro. L'output dovrebbe essere simile a:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-14" %}
git status
On branch master

Initial commit

Untracked files:
    (use "git add <file>..." to include in what will be committed)

        .gitignore
        blog/
        manage.py
        mysite/

nothing added to commit but untracked files present (use "git add" to track)
{% endpre %}

E finalmente salviamo le nostre modifiche. Vai alla tua console ed esegui questi comandi:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="3-7" %}
git add --all .
git commit -m "La mia app Django Girls, primo commit"
 [...]
 13 files changed, 200 insertions(+)
 create mode 100644 .gitignore
 [...]
 create mode 100644 mysite/wsgi.py
{% endpre %}

## Carichiamo il nostro codice su Heroku

Per portare il nostro codice su Heroku la prima cosa che dobbiamo fare è autenticarci tramite la `toolbelt` di Heroku che hai installato durante il party:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-5" %}
heroku login
Enter your Heroku credentials:
Email: tu@example.com
Password: **********
Logged in as tu@example.com
{% endpre %}

Adesso abbiamo tutto quello che ci serve per gestire il nostro account da remoto!

Dobbiamo creare l'app che sarà il contenitore del nostro blog online, tutto ciò che ti serve è un nome originale:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2" %}
heroku create <nome-del-blog>
Creating app... done, ⬢ <nome-del-blog>
{% endpre %}

> **Note** Sostituisci a <nome-del-blog> (**comprese le parentesi <>**) un nome per il tuo blog considerando che sarà quello che apparirà nella url come ad esempio `https://<nome-del-blog>.herokuapp.com`.

> **Warning** Ricordati che il nome deve essere composto solo di caratteri minuscoli, numeri, caratteri `-` e `_`. Non sono ammessi altri caratteri, e in particolare non sono ammessi spazi nel nome.

L'ultima cosa che ci rimane da fare è caricare il nostro codice su Heroku e per farlo utilizzeremo `git`. Il prossimo comando che digiterai oltre a caricare il nostro codice sulla nostra app installerà Python, installerà per noi le dipendenze, raccoglierà i file statici e avvierà la nostra applicazione.

Quando sei pronta vai sulla command line e digita:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-43" %}
git push heroku master
Counting objects: 19, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (15/15), done.
Writing objects: 100% (19/19), 10.42 KiB | 2.61 MiB/s, done.
Total 19 (delta 1), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Python app detected
remote: -----> Installing python-3.6.2
remote: -----> Installing pip
remote: -----> Installing requirements with pip
remote:        Collecting dj-database-url==0.4.2 (from -r /tmp/build_10f2f2109257430611f95e8fba905d52/requirements_base.txt (line 1))
remote:          Downloading dj_database_url-0.4.2-py2.py3-none-any.whl
remote:        Collecting Django==1.11.6 (from -r /tmp/build_10f2f2109257430611f95e8fba905d52/requirements_base.txt (line 2))
remote:          Downloading Django-1.11.6-py2.py3-none-any.whl (6.9MB)
remote:        Collecting gunicorn==19.7.1 (from -r /tmp/build_10f2f2109257430611f95e8fba905d52/requirements_base.txt (line 3))
remote:          Downloading gunicorn-19.7.1-py2.py3-none-any.whl (111kB)
remote:        Collecting whitenoise==3.3.1 (from -r /tmp/build_10f2f2109257430611f95e8fba905d52/requirements_base.txt (line 4))
remote:          Downloading whitenoise-3.3.1-py2.py3-none-any.whl
remote:        Collecting psycopg2==2.7.3.1 (from -r /tmp/build_10f2f2109257430611f95e8fba905d52/requirements.txt (line 2))
remote:          Downloading psycopg2-2.7.3.1-cp36-cp36m-manylinux1_x86_64.whl (2.6MB)
remote:        Collecting pytz (from Django==1.11.6->-r /tmp/build_10f2f2109257430611f95e8fba905d52/requirements_base.txt (line 2))
remote:          Downloading pytz-2017.2-py2.py3-none-any.whl (484kB)
remote:        Installing collected packages: dj-database-url, pytz, Django, gunicorn, whitenoise, psycopg2
remote:        Successfully installed Django-1.11.6 dj-database-url-0.4.2 gunicorn-19.7.1 psycopg2-2.7.3.1 pytz-2017.2 whitenoise-3.3.1
remote:
remote: -----> $ python manage.py collectstatic --noinput
remote:        61 static files copied to '/tmp/build_10f2f2109257430611f95e8fba905d52/mysite/static', 77 post-processed.
remote:
remote: -----> Discovering process types
remote:        Procfile declares types -> web
remote:
remote: -----> Compressing...
remote:        Done: 51.2M
remote: -----> Launching...
remote:        Released v4
remote:        https://<nome-del-blog>.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/<nome-del-blog>.git
 * [new branch]      master -> master
{% endpre %}

Se il comando precedente ti ha dato un errore prova a dare il seguente comando prima di riprovare:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
heroku git:remote <nome-del-blog>
{% endpre %}

## Creare il database su Heroku

Ecco un'altra differenza tra il tuo computer ed il server: usa un database diverso. Quindi gli account utente ed i post possono essere diversi sul server rispetto a come appaiono sul tuo computer.

Possiamo creare il database sul server proprio come abbiamo fatto sul tuo computer, con `migrate`:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-18" %}
heroku run python manage.py migrate
Running python manage.py migrate on ⬢ <nome-del-blog>... up, run.1386 (Free)
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, sessions
Running migrations:
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
  Applying auth.0008_alter_user_username_max_length... OK
  Applying sessions.0001_initial... OK
{% endpre %}

E creiamo anche il nostro account per il blog con `createsuperuser`:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-7" %}
heroku run python manage.py createsuperuser
Running python manage.py createsuperuser on ⬢ <nome-del-blog>... up, run.8163 (Free)
Username (leave blank to use 'u20668'): <nome-utente-blog>
Email address: tu@example.com
Password:
Password (again):
Superuser created successfully.
{% endpre %}

# Sei live!

Tutto pronto! Non ti resta che verificare: prova ad andare con il tuo browser su:

{% filename %}browser{% endfilename %}
{% pre language="bash" %}
https://<nome-del-blog>.herokuapp.com
{% endpre %}

La pagina predefinita per il tuo sito dovrebbe dire "Welcome to Django", esattamente come sul tuo Pc locale. Prova ad aggiungere `/admin/` alla fine della URL, e verrai portata al sito di amministrazione. Accedi con il tuo username e password, e vedrai che puoi aggiungere nuovi Post sul server.

Da' a te stessa un'*ENORME* pacca sulla schiena! Il deploy dei server è tra le parti più complicate dello sviluppo web e di solito le persone ci impiegano svariati giorni prima di farli funzionare. Ma hai pubblicato il tuo sito su internet senza sforzo!
