# CSS - dagli un bell'aspetto!

Il nostro blog sembra ancora un pochino brutto, vero? È arrivato il momento di abbellirlo! Per fare ciò useremo CSS.

## Che cos'è CSS?

Cascading Style Sheets (CSS) è un linguaggio usato per descrivere l'aspetto e la formattazione di un sito scritto in un linguaggio di markup (come HTML). Vedilo come il trucco del nostro sito ;).

Ma non vogliamo ricominciare da capo, giusto? Ancora una volta useremo qualcosa preparato da altri programmatori disponibile su Internet gratuitamente per tutti. Si sa, re-inventare la ruota non è molto divertente.

## Usiamo Bootstrap!

Bootstrap è uno dei più popolari framework HTML e CSS per costruire bellissimi siti internet: https://getbootstrap.com/

È stato scritto da programmatori che lavoravano per Twitter ed è ora sviluppato da volontari da ogni parte del mondo.

## Installa Bootstrap

Per installare Bootstrap, avrai bisogno di aggiungere questo nel tag `<head>` del tuo file `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
{% endpre %}

Le due linee sopra riportate non aggiungono nessun file al tuo progetto. Stanno solo reindirizzando ad alcuni files the esistono in internet. Ma non ti preoccupare troppo, vai avanti e apri la tua pagina web e ricarica la pagina. Eccolo qui!

![Figura 14.1](images/bootstrap1.png)

Sembra già più carino!

## File statici in Django

Infine, daremo uno sguardo più approfondito a quelli che abbiamo chiamato **file statici**. I file statici sono tutti i tuoi CSS e le immagini - file che non sono dinamici, il loro contenuto non dipende dal contesto della richiesta e sarà lo stesso per ogni utente.

### Dove mettere i file statici in Django

Django sa già dove trovare i file statici per l'app "admin". Ora dobbiamo solo aggiungere alcuni file statici per la nostra app, `blog`.

Lo facciamo creando una cartella denominata `static` all'interno della nostra app blog:

{% pre language="bash", output="1-5" %}
djangogirls
├── blog
│   ├── migrations
│   └── static
└── mysite
{% endpre %}

Django troverà automaticamente tutte le cartelle chiamate "static" dentro le cartelle delle tua app, e sarà in grado di utilizzare il loro contenuto come file statici.

## Il tuo primo file CSS!

Ora, creiamo un file CSS, per poter aggiungere il tuo stile personale al tuo sito. Crea una nuova cartella dal nome `css` all'interno della tua cartella `static`. Poi, crea un nuovo file all'interno della tua cartella `css` e chiamalo `blog.css`. Fatto?

{% pre language="bash", output="1-5" %}
djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
{% endpre %}

È giunto il momento di scrivere un po' di CSS! Apri il file `blog/static/css/blog.css` nel tuo editor di codice.

Non ci dilungheremo troppo sul come personalizzare e imparare CSS in questo momento, dal momento che è abbastanza facile e puoi impararlo da sola alla fine di questo workshop. Troverai alcuni corsi gratuiti dove imparare di più al fondo di questa pagina.

Facciamo comunque un esempio. Perché non cambiare il colore della nostra intestazione? Per decifrare i colori, i computer usano dei codici speciali. Questi codici cominciano con `#` a cui fanno seguito 6 caratteri, sia lettere (A-F) che numeri (0-9). Per esempio, il codice per il blu è `#0000FF`. Puoi trovare vari esempi di codici colore qui: https://www.colorpicker.com/. Puoi anche usare [colori predefiniti](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) come ad esempio `red` e `green`.

Aggiungi il seguente codice nel tuo file `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}
{% pre language="css" %}
h1 a {
    color: #FCA205;
}
{% endpre %}

`h1 a` è un esempio di selettore CSS. Questo significa che stiamo cercando di cambiare lo stile su tutti gli elementi `a` all'interno di un elemento `h1` (in questo caso, abbiamo una linea di codice così strutturata: `<h1><a href="">link</a></h1>`). In questo caso, stiamo cercando di cambiare il colore con `#FCA205`, che corrisponde all'arancione. Ovviamente puoi mettere il codice di qualsiasi altro colore tu preferisca!

In un file CSS definiamo lo stile degli elementi presenti nel file HTML. Dovresti ricordarti dei tag dalla lezione sull'HTML. Gli elementi in questione vengono identificati con il nome (ad esempio `a`, `h1`, `body`) oppure con l'attributo `class` o l'attributo `id`. `class` e `id` sono i nomi che assegni agli elementi. Le classi definiscono gruppi di elementi mentre gli id indicano uno specifico elemento. Ad esempio, il seguente elemento può essere identificato nel CSS utilizzando il nome del tag `a`, la classe `external_link` oppure l'id ` link_to_wiki_page`:

{% pre language="html" %}
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
{% endpre %}

Per saperne di più puoi leggere [CSS Selectors in W3Schools](http://www.w3schools.com/cssref/css_selectors.asp).

Infine, dobbiamo anche far sapere al nostro template in HTML che abbiamo effettivamente aggiunto un po' di CSS. Apri il file `blog/templates/blog/post_list.html` e aggiungi la seguente riga di testo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% load staticfiles %}
{% endraw %}
{% endpre %}

Per ora stiamo solamente caricando tutti i nostri file statici :). Aggiungi questa riga di testo tra `<head>` e `</head>`, subito dopo il link al file CSS di Bootstrap aggiungi:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
{% endraw %}
{% endpre %}

Il browser legge i file nell'ordine in cui sono dati, per cui il codice nei nostri files può sovrascrivere il codice presente nei files di Bootstrap e quindi dobbiamo assicurarci che siano nell'ordine corretto. Stiamo dicendo al nostro template dove trovare i nostri file CSS.

Il tuo file dovrebbe avere questo aspetto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
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
    </body>
</html>
{% endraw %}
{% endpre %}

Ok, salviamo il file e ricarichiamo la pagina web!

![Figura 14.2](images/color2.png)

Ben fatto! Adesso potremmo dare un po' più d'aria alla nostra pagina web e aumentare il margine nella parte sinistra. Proviamo!

{% filename %}blog/static/css/blog.css{% endfilename %}
{% pre language="css" %}
body {
    padding-left: 15px;
}
{% endpre %}

Aggiungi questo al tuo CSS, salva il file e guarda il risultato!

![Figura 14.3](images/margin2.png)

Potremmo anche personalizzare lo stile calligrafico nella nostra intestazione. Incolla quanto segue all'interno del tag `<head>` che si trova nel file `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
{% endpre %}

Come prima, controlla l'ordine e mettilo prima del link a `blog/static/css/blog.css`. Questa riga consente di importare un font chiamato *Lobster* da Google Fonts (https://www.google.com/fonts).

Ora aggiungi `font-family: 'Lobster';` nel file CSS `static/css/blog.css` all'interno del blocco `h1 a` (il codice tra le due parentesi graffe, `{` e `}`) e ricarica la pagina:

{% filename %}blog/static/css/blog.css{% endfilename %}
{% pre language="css" %}
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
{% endpre %}

![Figura 14.3](images/font.png)

Grandioso!

Come già accennato, il CSS utilizza il concetto di 'classe' che in pratica ti permette di assegnare uno specifico nome ad una parte del tuo documento HTML e di applicare uno stile solo a questa parte senza cambiare il resto. È di grande aiuto quando hai due `div` che hanno funzioni differenti (ad esempio uno è un header e l'altro un post), e non vuoi che appaiano uguali.

Prova a dare dei nomi ad alcune parti dell'HTML. Aggiungi una classe chiamta `page-header` al tuo `div` che contiene l'intestazione così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
{% endpre %}

E ora aggiungi una classe `post` al tuo `div` che contiene un articolo del blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
{% endraw %}
{% endpre %}

Ora aggiungiamo dei blocchi di codice ai nostri nuovi selettori. I selettori che iniziano con `.` indicano una classe. Online ci sono molti tutorial e spiegazioni su CSS che possono aiutarti a comprendere il codice che stiamo per scrivere. Per ora, copia e incolla quanto segue nel tuo file `mysite/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}
{% pre language="css" %}
.page-header {
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h1 a, .post h1 a:visited {
    color: #000000;
}
{% endpre %}

Ora aggiungi all'esterno del codice HTML riguardante i post all'interno del blog alcuni elementi con definizione di classi. Sostituisci questo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
{% endraw %}
{% endpre %}

nel file `blog/templates/blog/post_list.html` con quanto segue:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
{% pre language="html" %}
{% raw %}
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
{% endraw %}
{% endpre %}

Salva entrambi i file e ricarica la pagina web.

![Figura 14.4](images/final.png)

Woohoo! È fantastico, vero? Guarda il codice che hai appena incollato per cercare dove abbiamo aggiunto le classi nell'HTML e come le abbiamo usate nel CSS. Dove dovresti fare qualche cambiamento per avere le date in turchese?

Non farti spaventare, sperimenta con i CSS e prova a cambiare alcune cose. Se rompi qualcosa, non ti preoccupare, puoi sempre farlo tornare come era prima!

Ti consigliamo caldamente di seguire il corso su [HTML](https://www.codecademy.com/learn/learn-html) & [CSS](https://www.codecademy.com/learn/learn-css) di [Codeacademy](https://www.codecademy.com/). Così potrai imparare tutto ciò di cui hai bisogno per rendere i tuoi siti web più belli con CSS.

Pronta per il prossimo capitolo?! :)
