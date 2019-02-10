---
layout: page
title: "Dataset: WikiLinkGraphs - A complete, longitudinal and multi-language dataset of the Wikipedia link networks"
excerpt: "WikiLinkGraphs is a dataset of the network of internal Wikipedia links for 9 language editions: de, en, es, fr, it, nl, pl, ru, sv. This dataset spans over 17 years, from the creation of Wikipedia in 2001 to March 2018."
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---


  {% include_relative _wikilinkgraphs/descriptions/wikilinkgraphs.html %}
  {% include_relative _wikilinkgraphs/wikilinkgraphs.html dataset='wikilinkgraphs' %}

## Description

<ul>
  {% include_relative _wikilinkgraphs/descriptions/fields/page_id_from.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/page_title_from.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/page_id_to.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/page_title_to.html %}
</ul>

### Sample

Extract of the file `enwiki.wikilink_graph.2018-03-01.csv.gz`:

{% highlight text %}
page_id_from    page_title_from page_id_to      page_title_to
10      AccessibleComputing     411964  Computer accessibility
12      Anarchism       5013592 6 February 1934 crisis
12      Anarchism       2181459 Abstentionism
12      Anarchism       839656  Adolf Brand
12      Anarchism       2731583 Adolf Hitler
12      Anarchism       192008  Adolphe Thiers
12      Anarchism       729048  Affinity group
12      Anarchism       30758   Age of Enlightenment
12      Anarchism       627     Agriculture
12      Anarchism       710931  AK Press
{% endhighlight %}

## Download

This dataset can be downloaded from [Zenodo](https://www.zenodo.org):
[doi:10.5281/zenodo.2539424](http://doi.org/10.5281/zenodo.2539424).

## Code

  {% include_relative _wikilinkgraphs/code.html %}

## Authors

  {% include_relative _wikilinkgraphs/authors.html %}

### License

  {% include_relative _wikilinkgraphs/license.html %}

### How to cite

  {% include_relative _wikilinkgraphs/howtocite.html %}


## FAQs

### What is the total size of the dataset, the number of files and the largest file in the dataset?

* 5.7G    `dewiki.wikilink_graph.*.csv.gz`
* 17G     `enwiki.wikilink_graph.*.csv.gz`
* 3.0G    `eswiki.wikilink_graph.*.csv.gz`
* 4.8G    `frwiki.wikilink_graph.*.csv.gz`
* 3.1G    `itwiki.wikilink_graph.*.csv.gz`
* 2.0G    `nlwiki.wikilink_graph.*.csv.gz`
* 2.3G    `plwiki.wikilink_graph.*.csv.gz`
* 3.2G    `ruwiki.wikilink_graph.*.csv.gz`
* 2.0G    `svwiki.wikilink_graph.*.csv.gz`

The total dataset size is 42GB, and it contains ~ 172 files. The average size is 244 MB and the largest file is ~ 2.4GB.

  {% include_relative _wikilinkgraphs/faqs/whoproduced.html %}

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
