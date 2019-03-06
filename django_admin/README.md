# Django admin

Per aggiungere, modificare e cancellare i post che abbiamo appena strutturato useremo Django admin.

Apri il file `blog/admin.py` e sostituisci il suo contenuto con:

{% filename %}blog/admin.py{% endfilename %}
{% pre language="python" %}
from django.contrib import admin
from .models import Post

admin.site.register(Post)
{% endpre %}

Come puoi vedere stiamo importando il modello di Post che abbiamo definito nel capitolo precedente. Per far sì che il nostro modello sia visibile nella pagina di admin, dobbiamo registrare questo modello con `admin.site.register(Post)`.

Ok, è tempo di guardare il nostro modello Post. Ricorda di eseguire `python manage.py runserver` nella console per avviare il web server. Vai nel browser e scrivi l'indirizzo `http://127.0.0.1:8000/admin/` Vedrai una pagina di login come questa:

![Login page](images/login_page2.png)

Per accedere, devi creare un *superuser* - un utente che ha il controllo su tutto nel sito. Torna alla command-line e digita `python manage.py createsuperuser`, e premi invio.


> Ricordati: per scrivere nuovi comandi mentre il web server è attivo, apri una nuova finestra del terminale. Se non ti ricordi come farlo ne abbiamo discusso nelle sezioni **Il tuo primo progetto Django!** e **Introduzione alla command line**.

Quando richiesto, digita il tuo username (minuscole, senza spazi), indirizzo e-mail e password. Non ti preoccupare se non riesci a vedere la password che stai digitando - è così che dovrebbe essere. Basta digitarlo e premere `invio` per continuare. L'output dovrebbe essere così (dove il nome utente e l'email dovrebbero essere i tuoi):

{% filename %}command-line{% endfilename %}
{% pre prompt="$", language="bash", output="2-6" %}
python3 manage.py createsuperuser
Username: admin
Email address: admin@admin.com
Password:
Password (again):
Superuser created successfully.
{% endpre %}

> Nota: Nel caso tu abbia inserito una password molto semplice, potesti ricevere un messaggio tipo `Questa password è troppo corta. Deve contenere almeno 8 caratteri. Bypass password validation and create user anyway? [y/N]:` Ai fini del workshop rispondi tranquillamente `Y`. Su un eventuale sito Django esposto in rete dovresti sempre ricordati di usare password più complesse.

Torna nel tuo browser e fai il log in con le credenziali di superuser che hai scelto, dovresti vedere la dashboard d'amministrazione di Django.

![Django admin](images/django_admin3.png)

Vai su Post e sperimenta un po'. Aggiungi cinque o sei post. Non preoccuparti del contenuto - puoi semplicemente fare il copia-incolla di parti di testo da questo tutorial per risparmiare tempo :).

Assicurati che almeno due o tre post (ma non tutti) abbiano la data in cui sono stati pubblicati. Ti sarà utile più tardi.

![Django admin](images/edit_post3.png)

Se vuoi sapere di più riguardo l'admin di Django, dovresti dare un'occhiata alla documentazione di Django: https://docs.djangoproject.com/en/2.1/ref/contrib/admin/

Questo è un buon momento per andare a prendere un caffè (o un tè) o qualcosa da mangiare per riprendere le forze. Hai creato il tuo primo modello Django - ti meriti una piccola pausa!
