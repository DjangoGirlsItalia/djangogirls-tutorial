# I dati dinamici nei templates

Abbiamo diversi pezzi: il modello `Post` è definito in `models.py`, abbiamo `post_list` nel file `views.py` ed abbiamo aggiunto il template. Ma come faremo a far comparire i nostri post nel nostro template HTML? Perché questo è quello che vogliamo: prendere qualche contenuto (modelli salvati nel database) e farlo vedere in modo carino nel nostro template, giusto?

Questo è esattamente il compito delle *views*: collegare i modelli ed i template. Nella nostra *view* `post_list` avremo bisogno di prendere i modelli che vogliamo far vedere e passarli nel template. Quindi praticamente nella *view* decidiamo cosa (modello) renderemo visibile nel template.

Ok, quindi come facciamo a farlo?

Dobbiamo aprire il nostro `blog/views.py`. Per ora *view* `post_list` è così:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
{% endpre %}

Ricordi quando abbiamo parlato di includere codice scritto in diversi file? Ora è il momento di includere il model che abbiamo scritto in `models.py`. Aggiungeremo questa riga `from .models import Post` così:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
from django.shortcuts import render
from .models import Post
{% endpre %}

Il punto dopo il `from` significa *directory attuale* oppure *applicazione attuale*. Dal momento che `views.py` e `models.py` sono nella stessa directory possiamo semplicemente utilizzare `.` ed il nome del file (senza `.py`). Allora importiamo il nome del modello (`Post`).

Cos'altro bisogna fare? Per poter prendere i post del blog dal modello`Post` ci serve una cosa chiamata `QuerySet`.

## QuerySet

Dovresti già sapere come funzionano i QuerySet. Ne abbiamo parlato nel capitolo [ORM di Django (QuerySets)](../django_orm/README.md).

Quindi ora ci interessa una lista di post del blog che sono pubblicati e organizzati da `published_date`, giusto? Lo abbiamo già fatto nel capitolo sui QuerySet!

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
{% endpre %}

Adesso mettiamo questo pezzo di codice nel file `blog/views.py` aggiungendolo alla funzione `def post_list(request)`, ma non dimenticarti di aggiungere `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
{% endpre %}

L'ultima cosa che ci manca da fare è aggiungere il QuerySet `posts` al contesto del template. Non preccuparti, ora vediamo di cosa si tratta.

Nota che abbiamo creato una variabile per il nostro QuerySet: `posts`. Vedila come il nome del nostro QuerySet. Da qui in avanti possiamo riferirci ad esso con questo nome.

Nella funzione `render` abbiamo già un parametro con `request` (quindi tutto quello che riceviamo dal nostro utente via internet) e un file template `'blog/post_list.html'`. Nell'ultimo parametro, che è simile a questo: `{}` possiamo aggiungere i dati che il template può utilizzare per mostrare i nostri contenuti nel browser. Dobbiamo dargli un nome (ci atterremo a `'posts'` per il momento :)). La forma è: `{'posts': posts}`. Nota che la parte prima di `:` è una stringa; devi metterla tra virgolette `''`.

Il nostro file `blog/views.py` sara così:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
{% endpre %}

È tutto! Ora di tornare al nostro template e rendere visibile questo QuerySet!

Se vuoi leggere di più sui QuerySets in Django dovresti dare un'occhiata qui: https://docs.djangoproject.com/en/2.1/ref/models/querysets/
