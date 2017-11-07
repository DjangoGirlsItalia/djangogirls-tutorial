# Django URL

Stiamo per costruire la nostra pagina web: una homepage per il tuo blog! Ma prima, impariamo un po' di più sulle url di Django.

## Che cos'è un URL?

Un URL è semplicemente un indirizzo web. Puoi vedere un URL ogni volta che visiti un sito web - si vede nella barra degli indirizzi del tuo browser. (sì! `127.0.0.1:8000` è un URL! Anche `https://djangogirls.org` è un URL):

![Url](images/url.png)

Ogni pagina internet ha bisogno del suo URL. In questo modo la tua applicazione sa cosa deve mostrare ad un utente che visita una URL. In Django usiamo qualcosa chiamato `URLconf` (configurazione dell'URL). `URLconf` è un insieme di modelli che Django cercherà di far corrispondere con l'URL ricevuto per trovare la view giusta.

## Come funzionano le URL in Django?

Apriamo il file `mysite/urls.py` nel code editor che hai scelto e vediamo com'è:

{% filename %}mysite/urls.py{% endfilename %}
{% pre language="python" %}
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
{% endpre %}

Come puoi vedere, Django ha già predisposto qualcosa per noi in questo file.

Le righe che iniziano con i tripli apici (`'''` or `"""`) sono chiamate docstring e funzionano come i commenti, puoi scriverli all'inizio del file, delle classi o delle funzioni per descriverne il funzionamento e non verranno lette da Python. Comodo, non è vero?

L'admin URL, che hai visto nel capitolo precedente è già qui:

{% filename %}mysite/urls.py{% endfilename %}
{% pre language="python" %}
    url(r'^admin/', admin.site.urls),
{% endpre %}

Questo significa che per ogni URL che comincia con `admin/` Django troverà la corrispondente *view*. In questo caso stiamo includendo un sacco di URL di così che non sia tutto imballato in questo piccolo file - è più leggibile e più pulito.

## Regex

Per caso ti stai chiedendo come fa Python a far corrispondere URL e view? Django usa `regex`, abbreviazione di "espressioni regolari". Regex ha molte (moltissime!) regole che costituiscono un modello di ricerca. Dal momento che le regex sono un argomento avanzato, non analizzeremo nel dettaglio come funzionano.

Se vuoi capire come abbiamo creato i patterns, eccoti un esempio del procedimento - ci servirà solo un sottoinsieme limitato di regole per esprimere il modello che stiamo cercando, vale a dire:

- `^` per l'inizio del testo
- `$` per la fine del testo
- `\d` per una cifra
- `+` per indicare che l'elemento precedente dovrebbe essere ripetuto almeno una volta
- `()` per catturare parte del pattern

Il resto nella definizione dell'url sarà preso alla lettera.

Ora immagina di avere un sito Web con un indirizzo così: `http://www.mysite.com/post/12345/`, dove `12345` è il numero del tuo post.

Scrivere view separate per ogni numero del post sarebbe veramente noioso. Con l'espressione regolare possiamo creare un modello che corrisponde all'url ed estrae il numero per noi: `^post/(\d+)/$`. Scomponiamo pezzo per pezzo per vedere che cosa stiamo facendo:

- **^post/** sta dicendo a Django di prendere tutto ciò che ha `post/` all'inizio dell'url (subito dopo `^`)
- **(\d+)** significa che ci sarà un numero (composto da una o più cifre) e che noi vogliamo che il numero venga catturato ed estratto
- **/** dice a django che ci dovrebbe essere un altro carattere a seguire `/`
- infine, **$** indica la fine dell'URL. Significa che solo le stringhe che terminano con `/` corrisponderanno a questo modello

## La tua prima Url Django!

È ora di creare la tua prima URL. Vogliamo usare http://127.0.0.1:8000/ come homepage per il nostro blog e visualizzare il nostro elenco di post.

Vogliamo anche mantenere il file di `mysite/urls.py` pulito, quindi importeremo le url dalla nostra applicazione `blog` sul file principale `mysite/urls.py`.

Vai avanti, aggiungi una riga che importerà `blog.urls`. Nota che qui useremo la funzione `include` qundi **avrai bisogno** di importarla nella prima linea del file.

Il tuo file `mysite/urls.py` ora dovrebbe avere questo aspetto:

{% filename %}mysite/urls.py{% endfilename %}
{% pre language="python" %}
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
{% endpre %}

Django reindirizzerà ora tutto ciò che viene da 'http://127.0.0.1:8000/' verso `blog.urls` e cercherà ulteriori istruzioni in questo file.

Quando si scrivono espressioni regolari in Python lo si fa sempre con `r` davanti alla stringa. Questo è un suggerimento utile per Python che la stringa possa contenere caratteri speciali che non sono destinati per lo stesso Python, ma per l'espressione regolare.

## blog.urls

Crea un nuovo file `blog/urls.py`. Perfetto! Ora aggiungi queste prime due righe:

{% filename %}blog/urls.py{% endfilename %}
{% pre language="python" %}
from django.conf.urls import url
from . import views
{% endpre %}

Stiamo solo importando il metodo `url` di Django e **tutte** le nostre `views` dalla nostra app `blog` (non abbiamo ancora nulla all'interno, ma rimedieremo a questo in un minuto!)

Dopo di che, possiamo aggiungere il nostro primo modello di URL:

{% filename %}blog/urls.py{% endfilename %}
{% pre language="python" %}
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
{% endpre %}

Come vedi, stiamo assegnando una `view` nominata `post_list` alla URL `^$`. Questa espressione regolare combinerà`^` (un inizio) seguito da `$` (una fine) - cosicché solo una stringa vuota possa combaciare. È giusto, perché nei resolver di URL di Django, ' http://127.0.0.1:8000 /' non è una parte dell'URL. Questo schema dirà a Django che `views.post_list` è il posto giusto dove andare se qualcuno entra nel tuo sito all'indirizzo 'http://127.0.0.1:8000/'.

L'ultima parte `name='post_list'` è il nome dell'URL che verrà usata per identificare la view. Può avere lo stesso nome della view, ma può anche essere qualcosa di completamente diverso. Useremo le URL rinominate successivamente nel progetto quindi è importante dare un nome a ciascuna URL nell'app. Inoltre dovremmo cercare di mantenere i nomi delle URL unici e facili da ricordare.

Tutto fatto? Apri `http://127.0.0.1:8000/` nel tuo browser per vedere il risultato.

![Errore](images/error1.png)

Non funziona, vero? Non ti preoccupare, è solo una pagina di errore, niente di cui spaventarsi! In realtà sono molto utili:

Leggerai che **non c'è un attributo `post_list`**. Il `post_list` ti ricorda qualcosa? Abbiamo chiamato la nostra view proprio così! Questo significa che è tutto a posto. Semplicemente non abbiamo ancora creato la nostra *view*. Non ti preoccupare, ci arriveremo.

> Se vuoi sapere di più sulla configurazione di URL Django, vai alla documentazione ufficiale: https://docs.djangoproject.com/en/1.11/topics/http/urls/
