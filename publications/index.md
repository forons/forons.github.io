---
layout: page
title: Publications
modified: 2021-11-05
excerpt: "Publications"
---

Here are some recent publications. For more details, see also [my Google Scholar][scholar] and [ResearchGate profile][researchgate].


<div class="grid-x articleSummary">
    <a>
        <h4 style="margin-bottom: 0;">Topology-Preserving Simplification of OpenStreetMap Network Data for Large-scale Simulation in SUMO</h4>
        <span>Z. Meng, X. Du, P. Sottovia, <b>D. Foroni</b>, C. Axenie, A. Wieder, D. Eckhoff, S. Bortoli, A. Knoll, and C. Sommer</span>
    </a>
    <p style="margin-top: 10px">
        Existing data quality works have so far focused on the computation of many data characteristics as a mean of quantifying different quality dimensions, like freshness, consistency, accuracy, or completeness, that are all defined about some ideal (clean) dataset. We claim that this approach falls short in providing a full specification of the quality of the data since it does not take into consideration the task for which the data is to be used, neither any future instances of the dataset. We argue that apart from the difference from the clean dataset, it is equally important to know the degree to which such difference affects the results of the task at hand. Thus, we extend the existing data quality definition to include that degree. Our approach, not only allows data quality to be considered in the context of the intended task, but can also provide useful information even in the absence of the clean dataset, and proffer an understanding of the effect of data quality in future dataset instances. We describe a system and its implementation that computes this extended form of data quality through a principled approach of systematic noise generation and task result evaluation. We perform numerous experiments illustrating the effectiveness of the approach and how this allows contextualizing traditional data quality measures.
    </p>
    <p class="links">
        [<a href="">SUMO User Conference 2022</a>]
        [<a href="">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a>
        <h4 style="margin-bottom: 0;">Estimating the Extent of the Effects of Data Quality through Observations</h4>
        <span><b>D. Foroni</b>, M. Lissandrini, and Y. Velegrakis</span>
    </a>
    <p style="margin-top: 10px">
    </p>
    <p class="links">
        [<a href="https://doi.org/10.1109/ICDE51399.2021.00176">ICDE 2021</a>]
        [<a href="/files/f4u-2021.pdf">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a>
        <h4 style="margin-bottom: 0;">The F4U System for Understanding the Effects of Data Quality</h4>
        <span><b>D. Foroni</b>, M. Lissandrini, and Y. Velegrakis</span>
    </a>
    <p style="margin-top: 10px">
        We demonstrate a system that enables a data-centric approach in understanding data quality. Instead of directly quantifying data quality as traditionally done, it disrupts the quality of the dataset and monitors the deviations in the output of an analytic task at hand. It computes the correlation factor between the disruption and the deviation and uses it as the quality metric. This allows users to understand not only the quality of their dataset but also the effect that present and future quality issues have to the intended analytic tasks. This is a novel data-centric approach aimed at complementing existing solutions. On top of the new information that it provides, and in contrast to existing techniques of data quality, it neither requires knowledge of the clean datasets, nor of the constraints on which the data should comply.
    </p>
    <p class="links">
        [<a href="https://doi.org/10.1109/ICDE51399.2021.00312">ICDE 2021</a>]
        [<a href="/files/f4u_demo-2021.pdf">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a>
        <h4 style="margin-bottom: 0;">OBELISC: Oscillator-Based Modelling and Control using Efficient Neural Learning for Intelligent Road Traffic Signal Calculation</h4>
        <span><em>C. Axenie, <b>D. Foroni</b>, A. Wieder, M. Al Hajj Hassan, P. Sottovia, M. Grossi, R. Shi, S. Bortoli, and G. Brasche</em></span>
    </a>
    <p style="margin-top: 10px">
        Traffic congestion poses serious challenges to urban infrastructures through the unpredictable dynamical loading of their vehicular arteries. Despite the advances in traffic light control systems, the problem of optimal traffic signal timing is still resistant to straightforward solutions. Fundamentally nonlinear, traffic flows exhibit both locally periodic dynamics and globally coupled correlations under deep uncertainty. This paper introduces Oscillator-Based modelling and control using Efficient neural Learning for Intelligent road traffic Signal Calculation (OBELISC), an end-to-end system capable of modelling the cyclic dynamics of traffic flow and robustly compensate for uncertainty while still keeping the system feasible for real-world deployments. To achieve this goal, the system employs an efficient representation of the traffic flows and their dynamics in populations of spiking neural networks. Such a computation and learning framework enables OBELISC to model and control the complex dynamics of traffic flows in order to dynamically adapt the green light phase. In order to emphasize the advantages of the proposed system, an extensive experimental evaluation on real-world data completes the study.
    </p>
    <p class="links">
        [<a href="https://doi.org/10.1007/978-3-030-86514-6_27">ECML-PKDD 2021</a>]
        [<a href="/files/obelisc-2021.pdf">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a>
        <h4 style="margin-bottom: 0;">TRAMESINO: Traffic Memory System for Intelligent Optimization of Road Traffic Control</h4>
        <span><em>C. Axenie, <b>D. Foroni</b>, A. Wieder, M. Al Hajj Hassan, P. Sottovia, M. Grossi, R. Shi, S. Bortoli, and G. Brasche</em></span>
    </a>
    <p style="margin-top: 10px">
        Whether efficient road traffic control needs accurate modelling is still an open question. Additionally, whether complex models can dynamically adapt to traffic uncertainty is still a design challenge when optimizing traffic plans. What is certain is that the highly non-linear and unpredictable real-world road traffic situations need timely actions. This study introduces TRAMESINO (TRAffic Memory System INtelligent Optimization). This novel approach to traffic control models only relevant causal action-consequence pairs within traffic data (e.g. green time - car count) in order to store traffic patterns and retrieve plausible decisions. Multiple such patterns are then combined to fully describe the traffic context over a road network and recalled whenever a new, but similar, traffic context is encountered. The system acts as a memory, encoding and manipulating traffic data using high-dimensional vectors using a spiking neural network learning substrate. This allows the system to learn temporal regularities in traffic data and adapt to abrupt changes, while keeping computation efficient and fast. We evaluated the performance of TRAMESINO on real-world data against relevant state-of-the-art approaches in terms of traffic metrics, robustness, and run-time. Our results emphasize TRAMESINO’s advantages in modelling traffic, adapting to disruptions, and timely optimizing traffic plans.
    </p>
    <p class="links">
        [<a>AALTD 2021 (Av. Upon Request)</a>]
        [<a href="/files/tramesino-2021.pdf">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a>
        <h4 style="margin-bottom: 0;">Real-time Traffic Jam Detection and Congestion Reduction Using Streaming Graph Analytics</h4>
        <span><em>Z. Abbas, P. Sottovia, M. Al Hajj Hassan, <b>D. Foroni</b>, S. Bortoli</em></span>
    </a>
    <p style="margin-top: 10px">
        Traffic congestion is a problem in day to day life, especially in big cities. Various traffic control infrastructure systems have been deployed to monitor and improve the flow of traffic across cities. Real-time congestion detection can serve for many useful purposes that include sending warnings to drivers approaching the congested area and daily route planning. Most of the existing congestion detection solutions combine historical data with continuous sensor readings and rely on data collected from multiple sensors deployed on the road, measuring the speed of vehicles. While in our work we present a framework that works in a pure streaming setting where historic data is not available before processing. The traffic data streams, possibly unbounded, arrive in real-time. Moreover, the data used in our case is collected only from sensors placed on the intersections of the road. Therefore, we investigate in creating a real-time congestion detection and reduction solution, that works on traffic streams without any prior knowledge. The goal of our work is 1) to detect traffic jams in real-time, and 2) to reduce the congestion in the traffic jam areas.In this work, we present a real-time traffic jam detection and congestion reduction framework: 1) We propose a directed weighted graph representation of the traffic infrastructure network for capturing dependencies between sensor data to measure traffic congestion; 2) We present online traffic jam detection and congestion reduction techniques built on a modern stream processing system, i.e., Apache Flink; 3) We develop dynamic traffic light policies for controlling traffic in congested areas to reduce the travel time of vehicles. Our experimental results indicate that we are able to detect traffic jams in real-time and deploy new traffic light policies which result in 27% less travel time at the best and 8% less travel time on average compared to the travel time with default traffic light policies. Our scalability results show that our system is able to handle high-intensity streaming data with high throughput and low latency.
    </p>
    <p class="links">
        [<a href="https://doi.org/10.1109/BigData50022.2020.9378068">IEEE Big Data 2020</a>]
        [<a href="/files/jam_detection-2020.pdf">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a href="/files/starlord-2018.pdf">
        <h4 style="margin-bottom: 0;">STARLORD: Sliding Window Temporal Accumulate-Retract Learning for Online Reasoning on Datastreams</h4>
        <span><em>C. Axenie, R. Tudoran, S. Bortoli, M. Al Hajj Hassan, <b>D. Foroni</b>, and G. Brasche</em></span>
    </a>
    <p style="margin-top: 10px">
        Nowadays, data sources, such as IoT devices, financial markets, and online services, continuously generate large amounts of data. Such data is usually generated at high frequencies and is typically described by non-stationary distributions. Querying these data sources brings new challenges for machine learning algorithms, which now need to be considered from the perspective of an evolving stream and not a static dataset. Under such scenarios, where data flows continuously, the challenge is how to transform the vast amount of data into information and knowledge, and how to adapt to data changes (i.e. drifts) and accumulate experience over time to support online decision-making. In this paper, we introduce STARLORD, a novel incremental computation method and system acting on data streams and capable of achieving low-latency (millisecond level) and high-throughput (thousands events/second/core) when learning from data streams. Moreover, the approach is able to adapt to data drifts and accumulate experience over time, and to use such knowledge to improve future learning and prediction performance, with resource usage guarantees. This is proven by our preliminary experiments where we built-in the framework in an open source stream engine (i.e. Apache Flink).
    </p>
    <p class="links">
        [<a href="https://ieeexplore.ieee.org/abstract/document/8614206">ICMLA 2018</a>]
        [<a href="/files/starlord-2018.pdf">PDF</a>]
    </p>
</div>

<div class="grid-x articleSummary">
    <a href="/files/moira-2018.pdf">
        <h4 style="margin-bottom: 0;">Moira: A goal-oriented incremental machine learning approach to dynamic resource cost estimation in distributed stream processing systems</h4>
        <span><em><b>D. Foroni</b>, C. Axenie, S. Bortoli, M. Al Hajj Hassan, R. Acker, R. Tudoran, G. Brasche, and Y. Velegrakis</em></span>
    </a>
    <p style="margin-top: 10px">
        The need for real-time analysis is still spreading and the number of available streaming sources is increasing. The recent literature has plenty of works on Data Stream Processing (DSP). In a streaming environment, the data incoming rate varies over time. The challenge is how to efficiently deploy these applications in a cluster. Several works have been conducted on improving the latency of the system or to minimize the allocated resources per application through time. However, to the best of our knowledge, none of the existing works takes into consideration the user needs for a specific application, which is different from one user to another. In this paper, we propose Moria, a goal-oriented framework for dynamically optimizing the resource allocation built on top of Apache Flink.
    </p>
    <p class="links">
        [<a href="https://dl.acm.org/doi/abs/10.1145/3242153.3242160">BIRTE @ VLDB 2018</a>]
        [<a href="/files/moira-2018.pdf">PDF</a>]
    </p>
</div>
<div class="grid-x articleSummary">
    <a href="/files/whitepaper-2019.pdf">
        <h4 style="margin-bottom: 0;">Data Management and Smart Cities</h4>
        <span><em>M. Brugnara, C. Consonni, <b>D. Foroni</b>, S. Pasupathipillai, G. Preti, P. Sottovia, and Y. Velegrakis</em></span>
    </a>
    <p style="margin-top: 10px">
        Modern cities use information and communication technologies to obtain deep insights on the different aspects of the way they operate, which can allow officials to make informed decisions to improve the operational efficiency of different operations and improve the life of their citizens. Analyzing the data about the different activities poses significant challenges. It is not merely the volume that recent hardware and software advancements have helped to achieve, but also challenges regarding the variety, velocity, and veracity of the data. All this is often known as the Big Data paradigm. In this document, we analyze some of these challenges, which we believe have not yet received considerable attention, we explain their value, and we describe some of the advanced solutions we have developed.
    </p>
    <p class="links">
        [<a href="https://smartcities.ieee.org/images/files/pdf/2019-01_SCWhitePaper-DataManagementinSC.pdf">IEEE Smart Cities Whitepaper</a>]
        [<a href="https://event.unitn.it/smartcities-trento/Trento_WP_Brugnara1.pdf">PDF</a>]
    </p>
</div>

---

### Editorial Activity

* Program Committee for the following conferences:
  * [SEA Data 2020][sea2020]
  * [SEA Data 2021][sea2020]
  * [EDBT 2021][edbt2021]

* Reviewing - including external reviewing - for the following journals
  and conferences:
  * [3PGCIC - International Conference on P2P, Parallel, Grid, Cloud and Internet Computing][3pgcic]
  * [EDBT - International Conference on Extending Database Technology][edbt]
  * [ECML-PKDD - European Conference on Machine Learning and Principles and Practice of Knowledge Discovery in Databases][ecmlpkdd]
  * [JPDC - Journal of Parallel and Distributed Computing, Elsevier][jpdc]
  * [IEEE Big Data - International Conference on Big Data][bigdata]
  * [IEEE ICDE - International Conference on Data Engineering][icde]
  * [IEEE ICMLA - International Conference on Machine Learning and Applications][icmla]
  * [VLDB - International Conference on Very Large Data Bases][vldb]
  * [KDD - SIGKDD Conference on Knowledge Discovery and Data Mining][kdd]
  * [SIGMOD Record][sigrec]

---

[sea2020]: https://sea-data.ml/
[edbt2021]: https://edbticdt2021.cs.ucy.ac.cy/committees/
[icmla]: https://www.icmla-conference.org/
[ecmlpkdd]: https://2021.ecmlpkdd.org/
[bigdata]: https://bigdataieee.org/
[vldb]: https://www.vldb.org/
[kdd]: https://www.kdd.org/
[sigrec]: https://sigmodrecord.org/
[jpdc]: https://www.journals.elsevier.com/journal-of-parallel-and-distributed-computing
[edbt]: https://www.edbt.org/
[icde]: http://tab.computer.org/tcde/icde_conf.html
[3pgcic]: https://link.springer.com/book/10.1007/978-3-030-02607-3


[scholar]: https://scholar.google.com/citations?user=5bzegdkAAAAJ
[researchgate]: https://www.researchgate.net/profile/Daniele_Foroni
