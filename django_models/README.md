# Modelli Django

Vogliamo creare un qualcosa che raccoglierà tutti i post del nostro blog. Per farlo, però, dobbiamo prima introdurre i cosiddetti `oggetti`.

## Oggetti

Esiste un concetto nella programmazione chiamato `programmazione orientata agli oggetti`. L'idea è che invece di scrivere tutto come una noiosa sequenza di istruzioni di programmazione, possiamo modellare le cose e definire come esse interagiscono fra di loro.

Quindi cos'è un oggetto? È un insieme di proprietà ed azioni. Suona strano, ma ti faremo un esempio.

Se vogliamo modellare un gatto creeremo un oggetto `Gatto` che ha qualche proprietà, per esempio `colore`, `età`, `umore` (es. bravo, cattivo, sonnolento ;) ), `padrone` (che è un oggetto `Persona` oppure, nel caso di un gatto randagio, questa proprietà è vuota).

E poi il `Gatto` ha alcune azioni: `fusa`, `graffiare` oppure `mangiare` (nella quale daremo al gatto un po' di `Cibo per gatti`, che potrebbe essere un oggetto diverso con delle proprietà, per esempio `gusto`).

```
Gatto
--------
colore
età
umore
padrone
fare_le_fusa()
graffiare()
mangiare(CiboPerGatti)
```

```
CiboPerGatti
--------
gusto
```

Quindi in pratica l'idea è quella di descrivere cose vere in codice con delle proprietà (chiamate `proprietà di oggetti`) e azioni (chiamate `metodi`).

Quindi come faremo a modellare i post del blog? Vogliamo costruire un blog, giusto?

Dobbiamo rispondere alla domanda: cos'è un post? Quali proprietà dovrebbe avere?

Beh, sicuramente il nostro post ha bisogno di qualche testo con il suo contenuto ed un titolo, vero? Sarebbe bello sapere chi l'ha scritto - quindi abbiamo bisogno di un autore. Infine, vogliamo sapere quando il post è stato creato e pubblicato.

```
Post
--------
titolo
testo
autore
data_creazione
data_pubblicazione
```

Che tipo di cose si potrebbero fare con un post? Sarebbe bello avere qualche metodo che pubblica il post, vero?

Quindi avremo bisogno di un metodo `pubblicare`.

Dal momento che sappiamo già cosa vogliamo ottenere, iniziamo a modellarlo in Django!

## Modello Django

Sapendo cos'è un oggetto, possiamo creare un modello Django per il nostro post.

Un modello in Django è uno speciale tipo di oggetto - è salvato nel `database`. Un database è un insieme di dati. È un posto in cui archivierai informazioni sui tuoi utenti, sui tuoi post, ecc. Useremo un database SQLite per archiviare i nostri dati. Questo è l'adattatore Django di database predefinito -- ci basterà per adesso.

Puoi pensare ad un modello nel database come ad un foglio elettronico con colonne (campi) e righe (dati).

### Creazione di un'applicazione

Per mantenere tutto ordinato, creeremo un'applicazione diversa all'interno del nostro progetto. È molto bello avere tutto organizzato fin dall'inizio. Per creare un'applicazione abbiamo bisogno di eseguire il seguente comando nella console (dalla cartella `djangogirls` dove si trova il file `manage.py`):

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
python3 manage.py startapp blog
{% endpre %}

Noterai che si è creata una nuova cartella `blog` e che ora contiene alcuni file. Le nostre cartelle ed i nostri file nel nostro progetto si dovrebbero vedere così:

{% filename %}command-line{% endfilename %}
{% pre language="bash", output="1-7" %}
djangogirls
├── mysite
|   ├── __init__.py
|   ├── settings.py
|   ├── urls.py
|   └── wsgi.py
├── manage.py
└── blog
    ├── migrations
    |   └── __init__.py
    ├── __init__.py
    ├── admin.py
    ├── models.py
    ├── tests.py
    └── views.py
{% endpre %}

Dopo aver creato un'applicazione dobbiamo dire a Django che dovrebbe utilizzarla. Lo facciamo nel file `mysite/settings.py`. Dobbiamo trovare `INSTALLED_APPS` ed aggiungere una riga che contenga `'blog',` appena sopra`]`. Quindi il prodotto finale dovrebbe assomigliare a questo:

{% filename %}mysite/settings.py{% endfilename %}
{% pre language="python" %}
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
{% endpre %}

### Creazione di un modello blog post

Nel file `blog/models.py` definiamo tutti gli oggetti chiamati `Models` - questo è il posto dove definiremo il nostro blog post.

Apriamo `blog/models.py`, cancella tutto quello che è lì e scrivi un codice come questo:

{% filename %}blog/models.py{% endfilename %}
{% pre language="python" %}
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
        default=timezone.now
    )
    published_date = models.DateTimeField(
        blank=True,
        null=True
    )

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
{% endpre %}

> Ricontrolla se stai utilizzando due underscore (`_`) su ciascun lato di `str`. Questa convenzione viene utilizzata spesso in Python e a volte li chiamiamo anche "dunder" (abbreviazione di "doppio underscore").

Sembra spaventoso, vero? Ma non ti preoccupare, ti spiegheremo cosa significano queste righe!

Tutte le righe che iniziano con `from` oppure con `import` sono righe che aggiungono alcuni pezzi da altri file. Quindi invece di copiare e incollare le stesse cose in ogni file, possiamo includere alcune parti con `from ... import ...`.

`class Post(models.Model):` - questa riga definisce il nostro modello (è un `oggetto`).

- `class` è una parola chiave speciale che indica che stiamo definendo un oggetto.
- `Post` è il nome del nostro modello. Possiamo dargli un nome diverso (ma dobbiamo evitare caratteri speciali e spazi). Inizia sempre il nome di una classe con un lettera maiuscola.
- `models.Model` significa che il Post è un modello Django, quindi Django sa che dovrebbe essere salvato nel database.

Ora definiamo le proprietà di cui stavamo parlando: `titolo`, `testo`, `data_creazione`, `data_pubblicazione` e `autore`. Per fare ciò dobbiamo definire un tipo per ogni campo (è un testo? Un numero? Una data? Una relazione con un altro oggetto, per esempio un utente?).

- `models.CharField` - così si definisce un testo con un numero limitato di lettere.
- `models.TextField` - questo è il codice per definire un testo senza un limite. Sembra l'ideale per i contenuti di un post, vero?
- `models.DateTimeField` - questo per la data e l'ora.
- `models.ForeignKey` - questo è un link ad un altro modello.

Non spiegheremo ogni pezzo di codice perchè ci vorrebbre troppo tempo. Dovresti dare un'occhiata alla documentazione di Django se vuoi saperne di più sui campi di un modello e come definire altre cose rispetto a quelle descritte sopra (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

Che dire di `def publish(self):`? È esattamente il metodo `pubblicare` di cui stavamo parlando prima. `def` significa che questa è una funzione/metodo e `publish` è il nome del metodo. Puoi modificare il nome del metodo, se vuoi. La regola per la denominazione è usare lettere minuscole e caratteri di sottolineatura al posto degli spazi. Per esempio, un metodo che calcola il prezzo medio potrebbe essere chiamato `calculate_average_price`.

I metodi spesso *restituiscono* qualcosa. C'è un esempio nel metodo `__str__`. In questo caso, quando chiamiamo `__str__()` otterremo un testo (**stringa**) con il titolo del Post.

> Nota che entrambi `def publish(self):` e `def __str__(self):` sono indentati all'interno della nostra classe. Dato che Python è sensibile agli spazi, dobbiamo indentare i nostri metodi all'interno della classe. Altrimenti, i metodi non faranno parte della nostra classe e potresti ottenere dei comportamenti strani.

Se c'è qualcosa di poco chiaro sui modelli, sentiti libera di chiedere al tuo coach! Sappiamo che è complicato, soprattutto quando impari cosa sono gli oggetti e le funzioni allo stesso tempo. Ma speriamo che sembri un po' meno magico per te per adesso!

### Crea tabelle per i modelli nel tuo database

L'ultimo passo è quello di aggiungere un nuovo modello al nostro database. Prima dobbiamo far sapere a Django che ci sono alcuni cambiamenti nel nostro modello (l'abbiamo appena creato!).

**Nota:** Ricordati di salvare i file che hai appena modificato. Altrimenti il tuo computer eseguirà la versione precedente e potresti ottenere degli errori.

Digita `python manage.py makemigrations blog`. Il risultato somiglierà a questo:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-4"  %}
python3 manage.py makemigrations blog
Migrations for 'blog':
  blog/migrations/0001_initial.py:
  - Create model Post
{% endpre %}

Django ci ha preparato un file di migrazione che dobbiamo applicare nel nostro database. Digita `python manage.py migrate blog` e l'output dovrebbe essere:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-6" %}
python3 manage.py migrate blog
Operations to perform:
  Apply all migrations: blog
Running migrations:
  Rendering model states... DONE
  Applying blog.0001_initial... OK
{% endpre %}

Evviva! Il nostro modello Post ora è nel database! Sarebbe bello poterlo vedere, vero? Vai al prossimo capitolo per vedere com'è il tuo Post!
