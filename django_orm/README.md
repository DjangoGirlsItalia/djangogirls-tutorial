# Django ORM e i QuerySet

In questo capitolo imparerai come Django si collega al database e archivia i dati al suo interno. Tuffiamoci!

## Cos'è un QuerySet?

Un QuerySet, in sostanza, è una lista di oggetti di un determinato Modello. Il QuerySet ti permette di leggere il dato dal database, filtrarlo e ordinarlo.

È più facile impararlo con un esempio. Proviamo, ti va?

## La shell di Django

Apri la tua console locale (non su Heroku) e digita questo comando:

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash" %}
python3 manage.py shell
{% endpre %}

L'effetto dovrebbe essere come questo:

{% filename %}command-line{% endfilename %}
{% pre language="python", output="1-5" %}
Python 3.7.2 (default, Jan 16 2019, 19:49:22)
[GCC 4.2.1 Compatible Apple LLVM 8.1.0 (clang-802.0.42)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>>
{% endpre %}

Ora ti trovi nella console interattiva di Django. È come il prompt di Python ma con un po' di magia di Django in più :). Qui puoi anche utilizzare tutti i comandi Python, ovviamente.

### Tutti gli oggetti

Proviamo a rendere visibili tutti i nostri post prima. Puoi farlo con il seguente comando:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2-4" %}
Post.objects.all()
Traceback (most recent call last):
  File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
{% endpre %}

Ops! È comparso un errore. Ci dice che non c'è nessun Post. È corretto - ci siamo dimenticati di importarlo!

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python" %}
from blog.models import Post
{% endpre %}

È semplice: importiamo il modello `Post` da `blog.models`. Proviamo a vedere di nuovo tutti i post:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
{% endpre %}

È una lista di post che abbiamo creato prima! Abbiamo creato questi post usando l'interfaccia di amministrazione di Django. Comunque sia, ora vogliamo creare nuovi post usando Python, quindi come lo facciamo?

### Creare oggetti

Così è come crea un nuovo oggetto Post nel database:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python" %}
Post.objects.create(author=me, title='Sample title', text='Test')
{% endpre %}

Ma manca un ingrediente qui: `me`. Dobbiamo passare un'istanza del modello `User` come un autore. Come si fa?

Importiamo il modello User prima:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python" %}
from django.contrib.auth.models import User
{% endpre %}

Quali utenti abbiamo nel nostro database? Prova questo:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
User.objects.all()
<QuerySet [<User: ola>]>
{% endpre %}

È il superuser che abbiamo creato prima! Ora prendiamo un'istanza di `User`:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python" %}
me = User.objects.get(username='ola')
{% endpre %}

Come puoi vedere, ora prendiamo (con `get`) un `User` con un `username` che è uguale a 'ola'. Ben fatto, devi cambiarlo con il tuo username.

Adesso possiamo finalmente creare il nostro post:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python" %}
Post.objects.create(author=me, title='Sample title', text='Test')
{% endpre %}

Evviva! Vuoi controllare se funziona?

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
{% endpre %}

Eccolo, un altro post nell'elenco!

### Aggiungi altri post

Ora puoi divertirti un po' ed aggiungere altri post per vedere come funziona. Aggiungene altri 2 o 3 e vai alla prossima parte.

### Filtrare gli oggeti

Uno dei vantaggi dei QuerySet consiste nell'abilità di filtrarli. Diciamo che vogliamo trovare tutti i post che hanno come autore l'uUtente 'ola'. Possiamo usare `filter` invece di `all` in `Post.objects.all()`. Tra parentesi dichiariamo le condizioni che un post deve soddisfare per finire nel nostro QuerySet. Nella nostra situazione è `autore` che è uguale a `me`. Il modo di scriverlo in Django è `autore=me`. Ora il nostro pezzo di codice ha questo aspetto:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
Post.objects.filter(author=me)
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>]>
{% endpre %}

O magari vogliamo vedere tutti i post che contengono la parola 'titolo' nel campo `titolo`?

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
Post.objects.filter(title__contains='title')
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
{% endpre %}

> **Note** ci sono due underscore (`_`) tra `titolo` e `contains`. L'ORM di Django usa questa sintassi per separare i nomi dei campi ("titolo") ed operazioni o filtri ("contiene"). Se usi solo un carattere di sottolineatura, otterrai un errore come "FieldError: non è possibile risolvere la parola chiave title_contains".

Puoi anche ottenere una lista di tutti i post pubblicati. Lo facciamo filtrando tutti i post che hanno una `published_date` impostata in passato:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="3" %}
from django.utils import timezone
Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: my post title>, <Post: another post title>]>
{% endpre %}

Purtroppo, il post che abbiamo aggiunto dalla console Python non è ancora pubblicato. Possiamo modificarlo! In primo luogo ottenere un'istanza di un post che vogliamo pubblicare:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python"%}
post = Post.objects.get(title="Sample title")
{% endpre %}

Ora pubblicalo con il nostro metodo `publish`!

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python"%}
post.publish()
{% endpre %}

Ora cerca di ottenere di nuovo l'elenco dei post pubblicati (premere il pulsante di freccia in su 3 volte e premere `invio`):

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
{% endpre %}

### Ordinare gli oggetti

I QuerySet ti permettono anche di ordinare le liste di oggetti. Proviamo a ordinarli in base al campo `created_date`:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
Post.objects.order_by('created_date')
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
{% endpre %}

Possiamo anche invertire l'ordine aggiungendo `-` all'inizio:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
Post.objects.order_by('-created_date')
<QuerySet [<Post: Sample title>, <Post: another post title>, <Post: my post title>]>
{% endpre %}

### QuerySet di concatenamento

Puoi anche combinare QuerySet **concatenandole** insieme:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python" %}
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
{% endpre %}

È davvero potente e ti permette di scrivere query piuttosto complesse.

Fantastico! Ora sei pronta per la prossima parte! Per chiudere la shell, digita questo:

{% filename %}command-line{% endfilename %}
{% pre prompt=">>>", language="python", output="2" %}
exit()
$
{% endpre %}
