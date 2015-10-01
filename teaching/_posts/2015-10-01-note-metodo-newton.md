---
layout: post
title: Note sul metodo di Newton per il calcolo della radice quadrata.
excerpt: "Mi è stato segnalato un errore rispetto all'esercizio per il calcolo della radice quadrata di un numero con il metodo di Newton presentato a lezione il 30/09/2015. Condivido qui le risposte"
modified: 2015-10-01
tags: [teaching, informatica, sqrt, Newton]
comments: true
image:
  feature: mountains-2.jpg
  credit: Frisia Orientalis @ Wikimedia Commons (CC-BY-SA 3.0)
  creditlink: https://commons.wikimedia.org/wiki/File:Passo_di_Giau.jpg
---

**Riassunto:** per errore, le slide relative al metodo di Newton riportavano
che la serie convergeva al valore \\(\lim_{n \to \infty} x_{n} = \sqrt{z}\\),
invece la successione converge a \\(\dfrac{1}{\sqrt{z}}\\) ovvero
\\(\lim_{n \to \infty} x_{n} = \dfrac{1}{\sqrt{z}}\\).
{: .notice}

Mi sono state fatte alcune domande e mi è stato segnalato un errore rispetto
all'esercizio per il calcolo della radice quadrata di un numero con il metodo di
Newton presentato a lezione il 30/09/2015. Condivido qui le risposte:

*  per errore le slide relative al metodo di Newton riportavano che la serie convergeva
erroneamente al valore \\(\lim_{n \to \infty} x_{n} = \sqrt{z}\\) invece la successione
converge a \\(\dfrac{1}{\sqrt{z}}\\) ovvero \\(\lim_{n \to \infty} x_{n} = \dfrac{1}{\sqrt{z}}\\).
Mi scuso per la svista, ora le <a id="Slide da scaricare in formato PDF" href="{{ site.url }}/teaching/slides/InfMat_02.pdf">slides</a> sono corrette.

* Per alcuni valori di $z$ del quale calcolare la radice quadrata, partendo dal valore $x_0 =  0.5$
si ottiene un comportamento oscillatorio, ovvero la successione continua a "saltare" tra due valori.
In particolare, per esempio, quando $$z = 20$$ si ha $$\{x_n\} = 1/2, -1/2, 1/2, -1/2, \dots$$.
Questo tipo di problemmiè tipico dei processi iterativi processi iterativi. 
Nello specifico, risolvendo il sistema di equazioni descritto dal metodo per $$z = 20$$

$$
\begin{equation*}
  \left\{\begin{aligned}
  & x_0 =  \dfrac{1}{2} \\
  & x_{n +1} =  \dfrac{1}{2}  \cdot {x_n} (3  - zx^2_n)
  \end{aligned}\right.
\end{equation*}
$$

* Si ottengono le seguenti soluzioni (notate \\([x=\frac{1}{2},y=-\frac{1}{2}]\\))
  * \\([x=-\frac{1}{2\cdot \sqrt{5}},y=-\frac{1}{2\cdot \sqrt{5}}]\\)
  * \\([x=\frac{1}{2\cdot \sqrt{5}},y=\frac{1}{2\cdot \sqrt{5}}]\\)
  * \\([x=-\frac{1}{2},y=\frac{1}{2}]\\)
  * \\([x=\frac{1}{2},y=-\frac{1}{2}]\\)
  * \\([x=\frac{\sqrt{\sqrt{7}\cdot i+3}\cdot \left( \sqrt{2}\cdot \sqrt{5}\cdot \sqrt{7}\cdot i-3\cdot \sqrt{2}\cdot \sqrt{5}\right) }{80},y=-\frac{\sqrt{\sqrt{7}\cdot i+3}}{2\cdot \sqrt{10}}]\\)
  * \\([x=-\frac{\sqrt{\sqrt{7}\cdot i+3}\cdot \left( \sqrt{2}\cdot \sqrt{5}\cdot \sqrt{7}\cdot i-3\cdot \sqrt{2}\cdot \sqrt{5}\right) }{80},y=\frac{\sqrt{\sqrt{7}\cdot i+3}}{2\cdot \sqrt{10}}]\\)
  * \\([x=-\frac{\sqrt{3-\sqrt{7}\cdot i}\cdot \left( \sqrt{2}\cdot \sqrt{5}\cdot \sqrt{7}\cdot i+3\cdot \sqrt{2}\cdot \sqrt{5}\right) }{80},y=-\frac{\sqrt{3-\sqrt{7}\cdot i}}{2\cdot \sqrt{10}}]\\)
  * \\([x=\frac{\sqrt{3-\sqrt{7}\cdot i}\cdot \left( \sqrt{2}\cdot \sqrt{5}\cdot \sqrt{7}\cdot i+3\cdot \sqrt{2}\cdot \sqrt{5}\right) }{80},y=\frac{\sqrt{3-\sqrt{7}\cdot i}}{2\cdot \sqrt{10}}]\\)
  * \\([x=0,y=0]\\)

* Le soluzioni sono i valori per cui la serie oscilla (e per quanto riguarda le
prime due coppie di risultati, come sottocaso, si trovano anche le soluzioni
che sono punto fisso ovvero i \\(z = - 1/\sqrt(20)\\) e \\(z = 1/\sqrt(20)\\)).

* In realtà la cosa più furba da fare non è iniziare da un valore arbitrario
(come \\(0.5\\)) ma da un valore più vicino al risultato di modo da ridurre i
tempi di convergenza e da evitare  questi problemi. Nello specifico è semplice
calcolare la parte intera di una radice quadrata (ovvero l'intero \\(x\\) più
grande tale che \\(x*x < z\\)). In particolare in questo caso \\(\sqrt(20) > 4\\),
quindi è bene partire da \\(1/4 = 0.25\\). 
Quindi, quando scegliete il valore iniziale calcolate (a mente) l'intero più
grande \\(x\\) tale per cui \\(x^2 < z\\) e inizializzate la successione,
ovvero usate come valore di \\(x_0\\) il reciproco di quel numero.
(\\({\lfloor x \rfloor}\\) indica il \\(\texttt{floor}\\) di \\(x\\) ovvero il
valore di \\(x\\) arrotondato all'intero più piccolo).  

$$ x_0 = \dfrac{1}{\lfloor x \rfloor} $$

* Rispetto all'errore compiuto dal metodo, ovvero su come interpretare il
valore di \\(\varepsilon\\) che compare nel metodo si può notare che definendo
\\(r_{n} = \dfrac{1}{x_{n}}\\) la condizione di terminazione si può scrivere
come $$\left|r^{2}_{n} - z\right| = \varepsilon$$ ovvero nella peggiore delle
ipotesi \\(r^{2}_{n} = z \pm \varepsilon\\) e $$r_{n} = \sqrt{z \pm \varepsilon}$$.
Utilizzando gli sviluppi in serie di McLaurin e supponendo \\(\varepsilon\\)
sufficientemente piccolo si ha che:

$$\sqrt{z \pm \varepsilon} = \sqrt{z} \cdot \left( 1 \pm \dfrac{\varepsilon}{2z} + \mathcal{O}(\varepsilon^{2}) \right)$$

* Quindi la differenze in valore assoluto tra \\( r_{n} \\) e \\( \sqrt{z} \\) è al primo ordine $$\mathcal{O}(\varepsilon)$$:

$$ \left|\sqrt{z} - \varepsilon\right| = \dfrac{\varepsilon}{2 \sqrt{z}} < \varepsilon $$