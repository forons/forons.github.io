---
layout: page
title: Bio
modified: 2020-06-12
excerpt: "Bio"
---

Daniele Foroni, Ph.D., is a big data research scientist at the Huawei ERC
(European Research Center) of Munich, Germany.
Daniele obtained his Ph.D. in Computer Science from the University
of Trento with a thesis on the evaluation and the path to possibly improve the
quality of the data at hand.

### Publications

Here are some recent publications. For more details, see also [my Google Scholar][scholar] and [ResearchGate profile][researchgate].

<div class="grid-x articleSummary">
    <a href="/files/starlord-2018.pdf">
        <h4>STARLORD: Sliding Window Temporal Accumulate-Retract Learning for Online Reasoning on Datastreams</h4>
    </a>
    <p>
        Nowadays, data sources, such as IoT devices, financial markets, and online services, continuously generate large amounts of data. Such data is usually generated at high frequencies and is typically described by non-stationary distributions. Querying these data sources brings new challenges for machine learning algorithms, which now need to be considered from the perspective of an evolving stream and not a static dataset. Under such scenarios, where data flows continuously, the challenge is how to transform the vast amount of data into information and knowledge, and how to adapt to data changes (i.e. drifts) and accumulate experience over time to support online decision-making. In this paper, we introduce STARLORD, a novel incremental computation method and system acting on data streams and capable of achieving low-latency (millisecond level) and high-throughput (thousands events/second/core) when learning from data streams. Moreover, the approach is able to adapt to data drifts and accumulate experience over time, and to use such knowledge to improve future learning and prediction performance, with resource usage guarantees. This is proven by our preliminary experiments where we built-in the framework in an open source stream engine (i.e. Apache Flink).
    </p>
    <p class="links">
        [<a href="https://ieeexplore.ieee.org/abstract/document/8614206">ICMLA 2018</a>]
        [<a href="/files/starlord-2018.pdf">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a href="/files/moira-2018.pdf">
        <h4>Moira: A goal-oriented incremental machine learning approach to dynamic resource cost estimation in distributed stream processing systems</h4>
    </a>
    <p>
        The need for real-time analysis is still spreading and the number of available streaming sources is increasing. The recent literature has plenty of works on Data Stream Processing (DSP). In a streaming environment, the data incoming rate varies over time. The challenge is how to efficiently deploy these applications in a cluster. Several works have been conducted on improving the latency of the system or to minimize the allocated resources per application through time. However, to the best of our knowledge, none of the existing works takes into consideration the user needs for a specific application, which is different from one user to another. In this paper, we propose Moria, a goal-oriented framework for dynamically optimizing the resource allocation built on top of Apache Flink.
    </p>
    <p class="links">
        [<a href="https://dl.acm.org/doi/abs/10.1145/3242153.3242160">BIRTE @ VLDB 2018</a>]
        [<a href="/files/moira-2018.pdf">PDF</a>]
    </p>
</div>
<div class="grid-x articleSummary">
    <a href="/files/whitepaper-2019.pdf">
        <h4>Data Management and Smart Cities</h4>
    </a>
    <p>
        Modern cities use information and communication technologies to obtain deep insights on the different aspects of the way they operate, which can allow officials to make informed decisions to improve the operational efficiency of different operations and improve the life of their citizens. Analyzing the data about the different activities poses significant challenges. It is not merely the volume that recent hardware and software advancements have helped to achieve, but also challenges regarding the variety, velocity, and veracity of the data. All this is often known as the Big Data paradigm. In this document, we analyze some of these challenges, which we believe have not yet received considerable attention, we explain their value, and we describe some of the advanced solutions we have developed.
    </p>
    <p class="links">
        [<a href="https://consonni.dev/publications/files/data_management_smart_cities_whitepaper_dbtrento.pdf">IEEE Smart Cities Whitepaper</a>]
    </p>
</div>

---

### Editorial Activity

* Program Committee for the following conferences:
  * [SEA Data 2020][sea2020]

* Reviewing - including external reviewing - for the following journals
  and conferences:
  * [3PGCIC - International Conference on P2P, Parallel, Grid, Cloud and Internet Computing][3pgcic]
  * [EDBT - International Conference on Extending Database Technology][edbt]
  * [JPDC - Journal of Parallel and Distributed Computing, Elsevier][jpdc]
  * [IEEE ICMLA - International Conference on Machine Learning and Applications][icmla]
  * [VLDB - International Conference on Very Large Data Bases][vldb]
  * [KDD - SIGKDD Conference on Knowledge Discovery and Data Mining][kdd]
  * [SIGMOD Record][sigrec]

---

### Teaching

* from a. y. 2015/2016 to 2019/2020 - Big Data, M.Sc. in Computer Science @ University of Trento; prof. Yannis Velegrakis
* a. y. 2014/2015 - Informatica, B.Sc. in Mathematics @ University of Trento;
  prof. Roberto Zunino

[sea2020]: https://sea-data.ml/
[icmla]: https://www.icmla-conference.org/
[vldb]: https://www.vldb.org/
[kdd]: https://www.kdd.org/
[sigrec]: https://sigmodrecord.org/
[jpdc]: https://www.journals.elsevier.com/journal-of-parallel-and-distributed-computing
[edbt]: https://www.edbt.org/
[3pgcic]: https://link.springer.com/book/10.1007/978-3-030-02607-3


[scholar]: https://scholar.google.com/citations?user=5bzegdkAAAAJ
[researchgate]: https://www.researchgate.net/profile/Daniele_Foroni
