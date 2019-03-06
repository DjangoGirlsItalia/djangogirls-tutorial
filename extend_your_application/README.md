# Estendi la tua applicazione

Abbiamo completato i passi necessari per la creazione del nostro sito: sappiamo come scrivere un modello, un URL, una view ed un template. Sappiamo anche come far diventare carino il nostro sito.

È ora di far pratica!

La prima cosa di cui abbiamo bisogno nel nostro blog è, ovviamente, una pagina per rendere visibile un post, vero?

Abbiamo già un modello dei `Post`, quindi non abbiamo bisogno di aggiungere niente in `models.py`.

## Creare un link di template verso la pagina di dettaglio di un post

Cominceremo aggiungendo un link all'interno del file `blog/templates/blog/post_list.html`. Per ora dovrebbe avere questo aspetto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
{% endraw %}
{% endpre %}


Vogliamo creare un link che dal titolo di un post facente parte dell'elenco di articoli porti alla pagina di dettaglio. Cambiamo `<h1><a href="">{{ post.title }}</a></h1>` così che linki alla pagina di dettaglio del post:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
{% endraw %}
{% endpre %}

È arrivata l'ora di spiegare il misterioso {% raw %}`{% url 'post_detail' pk=post.pk %}`{% endraw %}. Come avrai capito, il simbolo {% raw %}`{% %}`{% endraw %} significa che stiamo usando i template tag di Django. Questa volta ne useremo uno che creerà un URL per noi!

La parte `post_detail` significa che Django si aspetterà un URL in `blog/urls.py` con `name='post_detail'`

E invece `pk=post.pk`? `pk` è un abbreviazione per **primary key**, che è un nome univoco per ogni oggetto presente nel database. Siccome non abbiamo creato una primary key nel nostro modello di Post, Django ne crea una per noi (di default è un numero che viene incrementato di uno per ogni record: es. 1, 2, 3) e la aggiunge come un campo chiamato `pk` per ognuno dei nostri post. Possiamo usare la primary key scrivendo `post.pk`, esattamente come facciamo per tutti gli altri campi (`title`, `autore`, ecc.) nel nostro oggetto Post.

Adesso quando andremo all'indirizzo: http://127.0.0.1:8000/ avremo un errore (come sapevamo, dal momento che non abbiamo una URL e neppure una **view** per `post_detail`). Avrà questo aspetto:

![Errore: nessuna corrispondenza inversa](images/no_reverse_match2.png)

## Crea una URL per i dettagli di un post

Creiamo una URL in `urls.py` per la nostra __view__ `post_detail`!

Vogliamo che il nostro primo post venga visualizzato a questo **URL**: http://127.0.0.1:8000/post/1/

Facciamo sì che l'URL nel file `blog/urls.py` punti Django ad una *view* chiamata `post_detail`, che mostrerà un intero post. Il file dovrebbe assomigliare a questo:

{% filename %}blog/urls.py{% endfilename %}
{% pre language="python" %}
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail')
]
{% endpre %}

Questa parte `post/<int:pk>/` sembra complicata ma in realtà:

- `post/` significa che dopo l'inizio, l'URL dovrebbe contenere la parola `post` **e** `/`.
- `<int:pk>/` invece significa che Django prenderà tutto quello che hai messo qui e lo trasferirà ad una view come variabile denominata `pk` (nota che è lo stesso nome che abbiamo usato in `blog/templates/blog/post_list.html!`). `int` ci dice anche che la variabile può essere solo un numero, non una lettera (quindi tutto tra 0 e 9). Qualcosa di simile a `http://127.0.0.1:8000/post//` non è valido ma `http://127.0.0.1:8000/post/1234567890/` è perfetto!
- `/` - Quindi ci serve `/` di nuovo

Ciò significa che se digiti `http://127.0.0.1:8000/post/5/` nel tuo browser, Django capirà che stai cercando una __view__ chiamata `post_detail` e trasferirà l'informazione che "`pk` è uguale a `5`" a quella __view__.

Ok, abbiamo aggiunto un nuovo schema di URL a `blog/urls.py`! Aggiorniamo la pagina: http://127.0.0.1:8000/ Boom! Ancora un altro errore! Come previsto!

![Errore attributo](images/attribute_error2.png)

Ti ricordi di quale è il prossimo passo? Ma certo: aggiungere una view!

## Aggiungi una view del post

Questa volta alla nostra *view* viene data un altro parametro `pk`. La nostra *view* deve prenderlo, vero? Quindi definiremo la nostra funzione come `def post_detail(request, pk):`. Dobbiamo utilizzare esattamente lo stesso nome che abbiamo specificato in urls (`pk`). Omettere questa variabile è sbagliato e genererà un errore!

Ora, noi vogliamo ottenere un unico post. Per farlo possiamo utilizzare le queryset così:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
Post.objects.get(pk=pk)
{% endpre %}

Ma questo codice presenta un problema. Se non c'è `Post` con la `primary key` (`pk`) data, otterremo un errore bruttissimo!

![Errore: non esiste](images/does_not_exist2.png)

Noi non lo vogliamo! Ma, senza dubbio, Django ha qualcosa che si occuperà del problema per noi: `get_object_or_404`. Nel caso in cui non ci sia `Post` con la data `pk` mostrerà una pagina molto più carina (chiamata `Page Not Found 404`).

![Pagina non trovata](images/404_2.png)

La buona notizia è che in realtà puoi creare la tua pagina `Page not found` modificarla come vuoi e darle un bell'aspetto. Ma non è importantissimo in questo momento, quindi salteremo questa parte.

Ok, è arrivata l'ora di aggiungere una *view* al nostro file `views.py`!

In `blog/urls.py` abbiamo creato un URL chiamata `post_detail` che si riferisce ad una view chiamata `views.post_detail`. Questo significa che Django si aspetta una view chiamata `post_detail` nel file `blog/views.py`.

Dovremo aprire `blog/views.py` ed aggiungere il seguente codice vicino alle altre linee che iniziano con `from`:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
from django.shortcuts import render, get_object_or_404
{% endpre %}

Alla fine del file aggiungeremo la nostra *view*:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
{% endpre %}

Si. È giunta l'ora di aggiornare la pagina: http://127.0.0.1:8000/

![Visualizzazione elenco post][5]

 [5]: images/post_list2.png

Ha funzionato! Ma cosa succede se clicchi su un link nel titolo del post?

![Errore: il template non esiste](images/template_does_not_exist2.png)

Oh no! Un altro errore! Ma sappiamo già come occuparcene, giusto? Dobbiamo aggiungere un template!

## Crea un template per il post detail

Creeremo un file in `blog/templates/blog` chiamato `post_detail.html`.

Il risultato somiglierà a questo:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
{% endraw %}
{% endpre %}

Stiamo estendendo ancora una volta il template di base `base.html`. Nel blocco `content` vogliamo mostrare una published_date del post (se esiste), un titolo ed il testo. Ma dovremmo discutere di alcune cose importanti, vero?

{% raw %}`{% if ... %} ... {% endif %}`{% endraw %} è un tag di template che possiamo utilizzare quando vogliamo controllare qualcosa (ricordi `if ... else ..` dal capitolo **Introduzione a Python**?). In questo caso vogliamo controllare che la `published_date` di un post non sia vuota.

Ok, possiamo aggiornare la nostra pagina e vedere se `Page not found` non c'è più.

![Pagina di dettaglio del post](images/post_detail2.png)

Si! Ha funzionato!

## Ultima cosa: ora di fare il deploy!

Sarebbe bello vedere se il tuo sito Web sarà ancora funzionante in Heroku, vero? Proviamo a fare un altro deploy.

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2,5,7" %}
git status
[...]
git add --all .
git status
[...]
git commit -m "Aggiungiamo la vista e il template per il singolo post e il CSS per il sito"
[...]
git push heroku master
{% endpre %}

Fatto! Congratulazioni :)
