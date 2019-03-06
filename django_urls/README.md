# Django URL

Stiamo per costruire la nostra pagina web: una homepage per il tuo blog! Ma prima, impariamo un po' di più sulle url di Django.

## Che cos'è un URL?

Un URL è semplicemente un indirizzo web. Puoi vedere un URL ogni volta che visiti un sito web, si vede nella barra degli indirizzi del tuo browser. (Si `127.0.0.1:8000` è un URL! Anche `https://djangogirls.org` è un URL):

![Url](images/url.png)

Ogni pagina internet ha bisogno del suo URL. In questo modo la tua applicazione sa cosa deve mostrare ad un utente che visita una URL. In Django usiamo qualcosa chiamato `URLconf` (configurazione dell'URL). `URLconf` è un insieme di modelli che Django cercherà di far corrispondere con l'URL ricevuto per trovare la view giusta.

## Come funzionano le URL in Django?

Apriamo il file `mysite/urls.py` nel code editor che hai scelto e vediamo com'è:

{% filename %}mysite/urls.py{% endfilename %}
{% pre language="python" %}
"""mysite URL Configuration
...
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
]
{% endpre %}

Come puoi vedere, Django ha già predisposto qualcosa per noi in questo file.

Le righe che iniziano con i tripli apici (`'''` or `"""`) sono chiamate docstring e funzionano come i commenti, puoi scriverli all'inizio del file, delle classi o delle funzioni per descriverne il funzionamento e non verranno lette da Python. Comodo vero?

L'admin URL, che hai visto nel capitolo precedente è già qui:

{% filename %}mysite/urls.py{% endfilename %}
{% pre language="python" %}
    path('admin/', admin.site.urls),
{% endpre %}

Questo significa che per ogni URL che comincia con `admin/` Django troverà la corrispondente *view*. In questo caso stiamo includendo molti URL con una singola riga di codice rendendo tutto più leggibile e pulito.

## La tua prima Url Django!

È ora di creare la tua prima URL. Vogliamo usare http://127.0.0.1:8000/ come homepage per il nostro blog e visualizzare il nostro elenco di post.

Vogliamo anche mantenere il file di `mysite/urls.py` pulito, quindi importeremo le url dalla nostra applicazione `blog` sul file principale `mysite/urls.py`.

Vai avanti, aggiungi una riga che importerà `blog.urls`. Il tuo file `mysite/urls.py` ora dovrebbe avere questo aspetto:

{% filename %}mysite/urls.py{% endfilename %}
{% pre language="python" %}
"""mysite URL Configuration
...
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls'))
]
{% endpre %}

Django reindirizzerà ora tutto ciò che viene da 'http://127.0.0.1:8000/' verso `blog.urls` e cercherà ulteriori istruzioni in questo file.

## blog.urls

Crea un nuovo file `urls.py` dentro la directory `blog`. Perfetto! Ora aggiungi queste prime due righe:

{% filename %}blog/urls.py{% endfilename %}
{% pre language="python" %}
from django.urls import path
from . import views
{% endpre %}

Stiamo importando il metodo `path` di Django e **tutte** le nostre `views` dalla nostra app `blog` (non abbiamo ancora nulla all'interno, ma rimedieremo a questo in un minuto!)

Dopo di che, possiamo aggiungere il nostro primo modello di URL:

{% filename %}blog/urls.py{% endfilename %}
{% pre language="python" %}
urlpatterns = [
    path('', views.post_list, name='post_list')
]
{% endpre %}

Come vedi stiamo assegnando una `view` denominata `post_list` alla URL `''`. Questo schema dirà a Django che `views.post_list` è il posto giusto dove andare se qualcuno entra nel tuo sito all'indirizzo 'http://127.0.0.1:8000/'.

L'ultima parte `name='post_list'` è il nome dell'URL che verrà usata per identificare la view. Può avere lo stesso nome della view, ma può anche essere qualcosa di completamente diverso. Useremo le URL rinominate successivamente nel progetto quindi è importante dare un nome a ciascuna URL nell'app. Inoltre dovremmo cercare di mantenere i nomi delle URL unici e facili da ricordare.

Tutto fatto? Apri `http://127.0.0.1:8000/` nel tuo browser per vedere il risultato.

![Errore](images/error1.png)

> ** Note **: In alcuni casi l'errore potrebbe comparire nel prompt quando lanci il comando `runserver`. In ogni caso potremo correggerlo nel prossimo passo.

Non funziona, vero? Non ti preoccupare, è solo una pagina di errore! In realtà sono molto utili:

Leggerai che **non c'è un attributo `post_list`**. Il `post_list` ti ricorda qualcosa? Abbiamo chiamato la nostra view proprio così! Questo significa che è tutto a posto. Semplicemente non abbiamo ancora creato la nostra *view*. Non ti preoccupare, ci arriveremo.

> Se vuoi sapere di più sulla configurazione di URL Django, vai alla documentazione ufficiale: https://docs.djangoproject.com/en/2.1/topics/http/urls/
