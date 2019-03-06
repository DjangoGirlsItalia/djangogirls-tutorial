# I templates di Django

È ora di visualizzare alcuni dati! Django ci dà alcuni **template tags** pronti all'uso.

## Cosa sono i template tags?

In HTML non puoi scrivere codice Python, perché i browser interpretano solo l'HTML. Noi sappiamo che l'HTML è piuttosto statico, mentre Python è molto più dinamico.

I **Django template tags** ci permettono di trasferire le cose simili a Python in HTML, in modo che tu possa costruire siti web in modo più veloce e facile. Stupendo!

## Mostra il template con la lista di post

Nel capitolo precedente abbiamo dato al nostro template una lista di posts nella variabile `posts`. Adesso lo mostreremo nell'HTML.

Per stampare una variabile nel template Django, usiamo doppie parentesi graffe con il nome della variabile all'interno, così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{{ posts }}
{% endraw %}
{% endpre %}

Prova questo nel tuo template `blog/templates/blog/post_list.html`. Sostituisci tutto dal secondo `<div>` al terzo `</div>` con {% raw %}`{{ posts }}`{% endraw %}. Salva il file e aggiorna la pagina per vedere i risultati:

![Figura 13.1](images/step1.png)

Come vedi, quello che abbiamo è:

```
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Significa che Django vede la QuerySet come una lista di oggetti. Ricordi da **Introduzione a Python** come possiamo rendere visibili le liste? Sì, con i cicli for! In un template Django si fanno così:


{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% for post in posts %}
    {{ post }}
{% endfor %}
{% endraw %}
{% endpre %}

Prova ad inserirlo nel tuo template.

![Figura 13.2](images/step2.png)

Funziona! Ma noi vogliamo che vengano mostrate come i post statici che abbiamo creato prima nel capitolo **Introduzione ad HTML**. Puoi mischiare i tag HTML con quelli di template. Il nostro `body` avrà questo aspetto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
{% endraw %}
{% endpre %}

Tutto quello che hai messo tra {% raw %}`{% for %}`{% endraw %} e {% raw %}`{% endfor %}`{% endraw %} sarà ripetuto per ciascun oggetto della lista. Aggiorna la tua pagina:

![Figura 13.3](images/step3.png)

Ti sei accorta che abbiamo utilizzato una notazione leggermente diversa questa volta {% raw %}`{{ post.title }}`{% endraw %} oppure {% raw %}`{{ post.text }}`{% endraw %}? Stiamo introducendo i dati in ciascuno dei campi definiti nel nostro modello `Post`. Inoltre le `|linebreaksbr` passano il testo dei post attraverso un filtro per trasformare le line-breaks in paragrafi.

## Un'ultima cosa

Sarebbe bello vedere che il tuo sito funzionasse ancora su Internet, giusto? Proviamo a fare il deploy su Heroku di nuovo.

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2,5,7" %}
git status
[...]
git add --all .
git status
[...]
git commit -m "Modifica i template per mostrare i post dal database."
[...]
git push heroku master
{% endpre %}

Congratulazioni! Ora vai avanti e prova ad aggiungere un nuovo post nel tuo Admin Django (ricorda di aggiungere una `published_date`!), sucessivamente aggiorna il tuo sito per vedere se il post compare.

Funziona come un incantesimo? Ne siamo fieri! Staccati dal computer per un po', ti sei guadagnata una pausa. :)

![Figura 13.4](images/donut.png)
