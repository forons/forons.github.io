---
layout: page
title: "Dataset: WikiLinkGraphs' Snapshots"
excerpt: "This dataset contains wikilink snapshots, i.e. links between Wikipedia articles, extracted by processing each revision of each Wikipedia article (namespace 0) from Wikimedia's history dumps for the languages de, en, es, fr, it, nl, pl, ru, sv. The snapshots were taken on March 1st, for the years between 2001 and 2018 (included)."
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---


  {% include_relative _wikilinkgraphs/descriptions/rawwikilinks-snapshots.html %}
  {% include_relative _wikilinkgraphs/wikilinkgraphs.html dataset='snapshots' %}

## Description

<ul>
  {% include_relative _wikilinkgraphs/descriptions/fields/page_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/page_title.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_parent_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_timestamp.html %}
</ul>

### Sample

Extract of the file `enwiki.link_snapshot.2018-03-01.csv.gz` in `enwiki/20180301/`:

{% highlight text %}
page_id,page_title,revision_id,revision_parent_id,revision_timestamp
10,AccessibleComputing,767284433,631144794,2017-02-25T00:30:28+00:00
12,Anarchism,828135433,827702904,2018-02-28T19:35:35+00:00
13,AfghanistanHistory,783865149,74466652,2017-06-05T04:18:18+00:00
14,AfghanistanGeography,783865160,407008307,2017-06-05T04:18:23+00:00
15,AfghanistanPeople,783865293,616420354,2017-06-05T04:19:42+00:00
18,AfghanistanCommunications,783865299,74466499,2017-06-05T04:19:45+00:00
19,AfghanistanTransportations,783821589,409266982,2017-06-04T21:42:11+00:00
20,AfghanistanMilitary,783821738,558328133,2017-06-04T21:43:11+00:00
21,AfghanistanTransnationalIssues,783821743,46448859,2017-06-04T21:43:14+00:00
23,AssistiveTechnology,783865310,74466798,2017-06-05T04:19:50+00:00
{% endhighlight %}

## Download

This dataset can be downloaded in two different ways:

### HTTP (preferred method)

  {% include_relative _wikilinkgraphs/http.html dataset='snapshots' %}

### dat (experimental)

(coming soon)

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

For each of the 9 languages you will find 18 gzipped files, one for each snapshot from 2001 to 2018 (included).
The total dataset size is 79TB, divided among the languages like this:

* 11G     dewiki/
* 29G     enwiki/
* 5.9G    eswiki/
* 9.2G    frwiki/
* 5.7G    itwiki/
* 4.1G    nlwiki/
* 4.8G    plwiki/
* 6.8G    ruwiki/
* 3.9G    svwiki/

The dataset contains 162 files. The average file size is 0.5GB and the largest file is ~3.8GB (enwiki's snapshot from 2018-03-01).

### How are files organized?

Files are divided in directories, one for each language, each directory contains 18 files, one for each year from 2001 to 2018 (included).
Like this:
{% highlight text %}
.
├── dewiki
│   └── 20180301
│       ├── dewiki.link_snapshot.2001-03-01.csv.gz
│       ├── dewiki.link_snapshot.2002-03-01.csv.gz
│       ├── ---
│       └── dewiki.link_snapshot.2018-03-01.csv.gz
├── enwiki
│   └── 20180301
│       ├── enwiki.link_snapshot.2001-03-01.csv.gz
│       ├── enwiki.link_snapshot.2002-03-01.csv.gz
│       ├── ...
│       └── enwiki.link_snapshot.2018-03-01.csv.gz
├── eswiki
│   └── 20180301
│       ├── eswiki.link_snapshot.2001-03-01.csv.gz
│       ├── eswiki.link_snapshot.2002-03-01.csv.gz
│       ├── ...
│       └── eswiki.link_snapshot.2018-03-01.csv.gz
├── frwiki
│   └── 20180301
│       ├── frwiki.link_snapshot.2001-03-01.csv.gz
│       ├── frwiki.link_snapshot.2002-03-01.csv.gz
│       ├── ...
│       └── frwiki.link_snapshot.2018-03-01.csv.gz
├── itwiki
│   └── 20180301
│       ├── itwiki.link_snapshot.2001-03-01.csv.gz
│       ├── itwiki.link_snapshot.2002-03-01.csv.gz
│       ├── ...
│       └── itwiki.link_snapshot.2018-03-01.csv.gz
├── nlwiki
│   └── 20180301
│       ├── nlwiki.link_snapshot.2001-03-01.csv.gz
│       ├── nlwiki.link_snapshot.2002-03-01.csv.gz
│       ├── ...
│       └── nlwiki.link_snapshot.2018-03-01.csv.gz
├── plwiki
│   └── 20180301
│       ├── plwiki.link_snapshot.2001-03-01.csv.gz
│       ├── plwiki.link_snapshot.2002-03-01.csv.gz
│       ├── ...
│       └── plwiki.link_snapshot.2018-03-01.csv.gz
├── ruwiki
│   └── 20180301
│       ├── ruwiki.link_snapshot.2001-03-01.csv.gz
│       ├── ruwiki.link_snapshot.2002-03-01.csv.gz
│       ├── ...
│       └── ruwiki.link_snapshot.2018-03-01.csv.gz
└── svwiki
    └── 20180301
        ├── svwiki.link_snapshot.2001-03-01.csv.gz
        ├── svwiki.link_snapshot.2002-03-01.csv.gz
        ├── ...
        └── svwiki.link_snapshot.2018-03-01.csv.gz
{% endhighlight %}


  {% include_relative _wikilinkgraphs/faqs/whoproduced.html %}

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
