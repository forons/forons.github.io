---
layout: post
title: Analisi dell'evoluzione temporale dei template in Wikipedia
excerpt: "Resoconto del lavoro di tesi triennale svolto da Mattia Lago relativo all'analisi dell'evoluzione temporale dei template su Wikipedia in lingua italiana ed inglese"
modified: 2015-01-12T04:00:00.000000+01:00
tags: [template, Wikipedia, evoluzione temporale]
comments: true
image:
  feature: mountains-6.jpg
  credit: Sella group - Dolomites, Italy - Landscape photography by Giuseppe Milo (CC-BY 2.0)
  creditlink: https://www.flickr.com/photos/giuseppemilo/20056638182/
---

Ospitio come primo post un resoconto fatto da uno studente a cui ho fatto da correlatore per la tesi di laurea
triennale, Mattia Lago.

---

Il lavoro svolto per la mia tesi di laurea è stato sicuramente un'esperienza positiva, che mi ha permesso, tra
le varie cose, di comprendere meglio gli strumenti e le tecniche da utilizzare nella realizzazione di un
progetto in cui sono coinvolte più persone.

Tutto è cominciato dalla scelta del relatore: ["Algoritmi e strutture dati"](http://disi.unitn.it/~montreso/asd/)
era il corso che più ho apprezzato nel mio percorso di  studi, volevo quindi trovare una tesi che si avvicinasse
il più possibile a questa materia.
Per motivi personali ho scelto di fare il tirocinio esterno all'università, questo ha reso più difficile la ricerca
in quanto molti professori propongono come tesi il progetto sviluppato nel periodo di internato, cosa che
non era invece compatibile con la mia scelta.
Infatti quando contattai il professore di Algoritmi, mi disse che era disponibile come tutor universitario per
lo stage, ma per la tesi era già occupato con altri studenti che facevano tirocinio interno.
Lasciai quindi la questione in sospeso. Una volta terminato lo stage però, dopo vari tentativi andati a vuoto,
decisi di ritentare e contattai nuovamente il professore.

Qualche giorno dopo ricevetti la risposta, in cui mi disse che insieme ad un suo dottorando era nata l'idea di
una possibile tesi riguardante Wikipedia, e se quindi fossi stato interessato mi avrebbe aggiornato con i
dettagli.

Accettai senza pensarci due volte e fissammo un incontro a tre per il giorno seguente.

Fu a quell'incontro che conobbi Cristian, che mi spiegò brevemente in cosa consisteva il progetto: si
trattava di ricavare dati dallo storico di Wikipedia per creare grafici che rappresentassero l'utilizzo nel
tempo dei template.

I [template](https://it.wikipedia.org/wiki/Aiuto:Template) sono uno strumento utilizzato da Wikipedia per evitare
la ripetizione dello stesso contenuto su pagine diverse.
Ad esempio, se devo ripetere la stessa frase su due pagine posso procedere in due modi:

1.	modifico le pagine inserendo la frase in entrambe
2.	creo un template che contiene la frase e lo utilizzo nelle pagine

Il vantaggio nell'utilizzo dei template lo si ha una volta che si vuole modificare la frase. Se abbiamo
utilizzato il primo metodo siamo costretti ad andare a modificare entrambe le pagine. Con il secondo
metodo invece basta modificare il template e le pagine in cui esso è inserito cambieranno di conseguenza.

Per la realizzazione del progetto abbiamo scelto gli script Python in ambiente Ubuntu. Questo ha
comportato che un primo periodo fosse adibito all' impratichirmi nell'utilizzo di questi nuovi strumenti.
Successivamente abbiamo cominciato a lavorare sui dati di Wikipedia, scaricando i dump, cioè dei backup
di tutto lo storico delle revisioni delle pagine.

Abbiamo scelto di analizzare le Wikipedie italiana e inglese, questo ha comportato, specialmente per quella
inglese, il doverci confrontare con una quantità di dati molto grande.

Per il calcolo dei dati abbiamo quindi dovuto usufruire di una macchina dell'università che dispone di un
hardware apposito per lavorare con file di grosse dimensioni.

Tramite l'uso di [espressioni regolari](https://it.wikipedia.org/wiki/Espressione_regolare) siamo riusciti a
ricavare dai dump l'utilizzo dei template per ogni singola revisione. Questo ci ha permesso di riassumere
tutti i dati che ci interessavano in un file di dimensioni ridotte, che abbiamo poi utilizzato per la creazione
dei grafici.
Quello che siamo andati a fare in sostanza è consistito nell'individuare le variazioni di utilizzo di un
template nel tempo, una volta trovato ciò, le date di queste variazioni e le somme delle differenze di valore
sono andate a formare l'andamento del grafico.

Il risultato finale è stato quello di produrre i grafici di ogni template di entrambe le Wikipedie, riuscendo
quindi a identificare mutamenti nei trend di utilizzo, operazioni di bot e l'aggiunta di redirect.

Una parte di dati è stata successivamente utilizzata in una [discussione tra gli utenti di Wikipedia](https://it.wikipedia.org/wiki/Wikipedia:Bar/Discussioni/Statistiche_sull%27utilizzo_dei_template_relativi_alle_fonti.) riguardante l'utilizzo dei template di fonti
all'interno della Wikipedia italiana.

Un secondo obiettivo che ci siamo posti è stato quello di suddividerli in categorie, questo per vedere se
riuscivamo ad ottenere similitudini con le tipologie dei template, classi già definite all'interno di Wikipedia.

Abbiamo quindi sottoposto i grafici a 6 diversi fit di curva, per individuare fra 6 tipi di andamento quale
rappresentasse meglio la curva tracciata da ogni singolo grafico. Gli andamenti scelti sono stati: costante,
lineare, polinomiale, esponenziale, logaritmica e di radice.
Per ogni fit è stato calcolato il coefficiente di determinazione per identificare quale fit riuscisse a descrivere
meglio il grafico.
Siamo quindi riusciti ad ottenere una lista di template per ogni categoria.

Il lavoro è disponibile [su GitHub](https://github.com/Tihacker/Wikipedia-Templates-Analysis).
