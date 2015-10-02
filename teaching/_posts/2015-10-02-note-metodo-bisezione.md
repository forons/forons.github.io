---
layout: post
title: Note sul metodo della bisezione per trovare gli zeri di una funzione continua.
excerpt: "Una precisazione sul del metodo della bisezione."
modified: 2015-10-02
tags: [teaching, informatica, sqrt, Newton]
comments: true
image:
  feature: mountains-2.jpg
  credit: Frisia Orientalis @ Wikimedia Commons (CC-BY-SA 3.0)
  creditlink: https://commons.wikimedia.org/wiki/File:Passo_di_Giau.jpg
---

Approfitto di una domanda che ho ricevuto rispetto al metodo della bisezione per
elaborare meglio un dettaglio che ho omesso a lezione.


Lo pseudocodice fornito nelle <a id="Slide da scaricare in formato PDF" href="{{ site.url }}/teaching/slides/InfMat_02.pdf">slides</a>
riporta alla linea 5 il controllo:

$$\mathit{\mathbf{if}} \; ( f(c) = 0) \lor ((b - a)/2) < \varepsilon ) \; \mathit{\mathbf{then}} \dots$$

in particolare viene controllato se $$f(c) = 0$$. Questo è teoricamente
corretto, ma da un punto di vista computazionale è una richiesta molto stringente.
Il problema è che, in generale, si possono compiere degli errori di
arrotondamento (perché comunque qualsiasi valore è salvato in una cella di memoria
composta da un numero finito di byte (bit) e quindi non è possibile rappresentare
numeri arbitrari) mentre con quel controllo si sta richiedendo che il valore di
$$f(c)$$ sia *esattamente* zero.

Diciamo che se il valore di f(c) fosse rappresentato con 4 bit[^1] questo equivarrebbe
a controllare che in memoria sia rappresentata la sequenza di bit $$\texttt{0000}$$.

Per semplificare questo vincolo si può introdurre un nuovo valore di tolleranza,
chiamato $$\varepsilon_y$$, e controllare, invece che $$f(c) == 0$$, se[^2]

$$|f(c)| < \varepsilon_y$$

il primo epsilon, che possiamo chiamare $$\varepsilon_x$$, stabilisce qual è la
tolleranza all'errore rispetto alle $$x$$, $$\varepsilon_y$$  ha lo stesso ruolo
rispetto alle $$y$$.

Si tratta comunque di un dettaglio perché:

1. come detto sopra, è un errore di computazione dovuto al fatto che i computer
   reali hanno una quantità finita di memoria.
2. In alcuni casi è possibile esprimere $$\varepsilon_y$$ in funzione di $$\varepsilon_x$$
cioè è possibile scegliere un valore di $$\varepsilon_y$$ tale per cui si può
essere sicuri che l'errore sulle $$x$$ sia comunque più piccolo di $$\varepsilon_x$$.
In pratica, con la funzione $$f(x) = x^3 - x -2$$ data per esercizio era possibile
usare $$\varepsilon_y = \varepsilon_x$$, quindi controllare se:

$$|f(c)| < \varepsilon_x$$


[^1]: Questa è una semplificazione, per sapere più dettagli su come un numero con la virgola viene rappresentato consultate la pagina "<a href="https://it.wikipedia.org/wiki/Numero_in_virgola_mobile">Numero in virgola mobile</a>" su Wikipedia e <a href="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/IEEE_754r_Half_Floating_Point_Format.svg/1024px-IEEE_754r_Half_Floating_Point_Format.svg.png">questa immagine</a>.

[^2]: Bisogna usare il valore assoluto perché si sta calcolando la distanza di $$f(c)$$ da zero, altrimenti questo check passerebbe se f(c) < 0).