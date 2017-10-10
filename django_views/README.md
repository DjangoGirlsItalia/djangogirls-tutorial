# Le views di Django - è arrivata l'ora di creare!

È ora di liberarsi di quel bug che abbiamo creato nel capitolo precedente :)

Una *view* è un posto dove viene messa la "logica" della nostra applicazione. Essa richiederà informazioni dal `modello` che hai creato prima e lo passerà ad un `template`. Creeremo un template nel prossimo capitolo. Le views sono solo metodi di Python un po' più complicati di quelli che abbiamo descritto nel capitolo **Introduzione a Python**.

Le views vengono collocate nel file `views.py`. Noi aggiungeremo le nostre *views* nel file `blog/views.py`.

## blog/views.py

OK, apriamo questo file e scopriamo cosa c'è dentro:

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
from django.shortcuts import render

# Create your views here.
{% endpre %}

Non c'è molto per ora.

Ricordati che le linee iniziano con `#` sono commenti - questo significa che non vengono letti da Python.

La *view* più semplice può essere simile a questa.

{% filename %}blog/views.py{% endfilename %}
{% pre language="python" %}
def post_list(request):
    return render(request, 'blog/post_list.html', {})
{% endpre %}

Come puoi vedere, abbiamo creato un metodo (`def`) chiamato `post_list` che prende `request` e `restituisce` un metodo `render` che ci fornirà (metterà insieme) il nostro template `blog/post_list.html`.

Aggiungila al file, salva, vai su http://127.0.0.1:8000/ e guarda cosa abbiamo ottenuto.

Un altro errore! Leggi cosa sta succedendo adesso:

![Error](images/error.png)

Ci mostra che il server gira di nuovo almeno, ma non ha un bell'aspetto, vero? Non preoccuparti è solo un errore e non dobbiamo averne paura! Come gli errori nella command line sono parecchio utili. Puoi leggere che *TemplateDoesNotExist* (il template non esiste). Sistemiamo il bug e creiamo un template nel prossimo capitolo!

> Impara di più sulle views di Django leggendo la documentazione ufficiale: https://docs.djangoproject.com/en/1.11/topics/http/views/