# Estendere il template

Un'altra cosa bella di Django è l'**estensione dei template**. Cosa significa? Significa che puoi usare le stesse parti del tuo HTML per pagine diverse del sito.

Così non hai bisogno di ripetere le stesse informazioni o il layout in ogni file. E se vuoi cambiare qualcosa, non devi cambiarlo in ogni templates, ma soltanto una volta!

## Crea un template di base

Un template base è il template più semplice. Lo puoi estendere su ogni pagina del tuo sito.

Creiamo un file `base.html` in `blog/templates/blog/`:

{% pre language="bash", output="1-5" %}
djangogirls
├─── blog
│    └─── templates
│         └─── blog
|              ├─── base.html
|              └─── post_list.html
└── mysite
{% endpre %}

Poi aprilo e copia tutto da `post_list.html` e incollalo sul file `base.html`, così:

{% filename %}blog/templates/blog/base.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
{% endraw %}
{% endpre %}

Poi nel `base.html`, rimpiazza tutto il tuo `<body>` (tutto quello che si trova tra `<body>` e `</body>`) con questo:

{% filename %}blog/templates/blog/base.html{% endfilename %}
{% pre language="html" %}
{% raw %}
<body>
    <div class="page-header">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
    <div class="content container">
        <div class="row">
            <div class="col-md-8">
            {% block content %}
            {% endblock %}
            </div>
        </div>
    </div>
</body>
{% endraw %}
{% endpre %}

Abbiamo praticamente rimpiazzato tutto quello da {% raw %}`{% for post in posts %}`{% endraw %} a {% raw %}`{% endfor %}`{% endraw %} con:

{% filename %}blog/templates/blog/base.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% block content %}
{% endblock %}
{% endraw %}
{% endpre %}

Ma... Perchè? Hai appena creato un `blocco`! Hai usato il **template tag** {% raw %}`{% block %}`{% endraw %} per creare una zona che avrà dell'HTML al suo interno. Quell'HTML arriverà da __un altro__ template che estende questo template (`base.html`). Vedremo come fare tra un momento.

Ora salva `blog/templates/blog/base.html` e apri il tuo `blog/templates/blog/post_list.html` di nuovo. Cancella tutto quello che sta prima di {% raw %}`{% for post in posts %}`{% endraw %} e dopo {% raw %}`{% endfor %}`{% endraw %}.

Quando hai finito il tuo file dovrebbe essere così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
{% endraw %}
{% endpre %}

Vogliamo usare questo template come contenuto del nostro {% raw %}`{% block content %}`{% endraw %} creato prima. Quindi dobbiamo aggiungere il template tag `block` a questo file.

Dobbiamo fare in modo che il template tag `block` in questo file combaci con quello in `base.html`. Dobbiamo anche far in modo che tutto il codice sia all'interno del nostro template tag `block`. Per farlo, metti tutto tra {% raw %}`{% block content %}`{% endraw %} and {% raw %}`{% endblock %}`{% endraw %}. Così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
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

Rimane solo una cosa da fare. Dobbiamo collegare questi due template tra loro. Questo è esattamente ciò che significa estendere i template! Lo faremo usando un nuovo **template tag** chiamato `extend` e lo metteremo all'inizio del file. 

Così:

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

È tutto! Controlla se il tuo sito sta ancora funzionando correttamente :)

> Se hai un errore `TemplateDoesNotExists` che dice che non c'è un file `blog/base.html` e hai `runserver` in esecuzione nella console, prova a fermarlo (premendo Ctrl+C - I tasti Control e C insieme) e riavvialo mettendo in esecuzione il comando `python manage.py runserver`.
