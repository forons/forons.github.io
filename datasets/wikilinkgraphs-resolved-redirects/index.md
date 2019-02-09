---
layout: page
title: "Dataset: WikiLinkGraphs' ResolvedRedirects"
excerpt: "This dataset contains Wikipedia snapshots with resolved redirects, i.e. list of pages (with a particular revision) of Wikipedia on March, 1st for each year from 2001 to 2018 (included), with redirects indicating which page was pointed at the moment. It has been produced by processing Wikimedia's history dumps for the languages de, en, es, fr, it, nl, pl, ru, sv."
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---

  {% include_relative _wikilinkgraphs/descriptions/resolved-redirects.html %}
  {% include_relative _wikilinkgraphs/wikilinkgraphs.html dataset='resolved-redirects' %}

## Description

<!--
1:  page_id
2:  page_title
3:  revision_id
4:  revision_parent_id
5:  revision_timestamp
6:  redirect_id
7:  redirect_title
8:  redirect_revision_id
9:  redirect_revision_parent_id
10: redirect_revision_timestamp
-->
<ul>
  {% include_relative _wikilinkgraphs/descriptions/fields/page_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/page_title.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_parent_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_timestamp.html %}

  {% include_relative _wikilinkgraphs/descriptions/fields/redirect_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/redirect_title.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/redirect_revision_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/redirect_revision_parent_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/redirect_revision_timestamp.html %}
</ul>

### Sample

Extract of the file `enwiki.snapshot.resolve_redirect.2018-03-01.csv.gz` in `enwiki/20180301/`:

{% highlight text %}
page_id,page_title,revision_id,revision_parent_id,revision_timestamp,redirect_id,redirect_title,redirect_revision_id,redirect_revision_parent_id,redirect_revision_timestamp
10,AccessibleComputing,767284433,631144794,2017-02-25T00:30:28+00:00,10,AccessibleComputing,767284433,631144794,2017-02-25T00:30:28+00:00
12,Anarchism,828135433,827702904,2018-02-28T19:35:35+00:00,12,Anarchism,828135433,827702904,2018-02-28T19:35:35+00:00
13,AfghanistanHistory,783865149,74466652,2017-06-05T04:18:18+00:00,13,AfghanistanHistory,783865149,74466652,2017-06-05T04:18:18+00:00
14,AfghanistanGeography,783865160,407008307,2017-06-05T04:18:23+00:00,14,AfghanistanGeography,783865160,407008307,2017-06-05T04:18:23+00:00
15,AfghanistanPeople,783865293,616420354,2017-06-05T04:19:42+00:00,15,AfghanistanPeople,783865293,616420354,2017-06-05T04:19:42+00:00
18,AfghanistanCommunications,783865299,74466499,2017-06-05T04:19:45+00:00,18,AfghanistanCommunications,783865299,74466499,2017-06-05T04:19:45+00:00
19,AfghanistanTransportations,783821589,409266982,2017-06-04T21:42:11+00:00,19,AfghanistanTransportations,783821589,409266982,2017-06-04T21:42:11+00:00
20,AfghanistanMilitary,783821738,558328133,2017-06-04T21:43:11+00:00,20,AfghanistanMilitary,783821738,558328133,2017-06-04T21:43:11+00:00
21,AfghanistanTransnationalIssues,783821743,46448859,2017-06-04T21:43:14+00:00,21,AfghanistanTransnationalIssues,783821743,46448859,2017-06-04T21:43:14+00:00
23,AssistiveTechnology,783865310,74466798,2017-06-05T04:19:50+00:00,23,AssistiveTechnology,783865310,74466798,2017-06-05T04:19:50+00:00
{% endhighlight %}

## Download

This dataset can be downloaded in two different ways:

### HTTP (preferred method)

  {% include_relative _wikilinkgraphs/http.html dataset='resolved-redirects' %}

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

The total dataset size is 8.4GB, divided among the languages like this:

* 924M    dewiki/
* 3,5G    enwiki/
* 662M    eswiki/
* 844M    frwiki/
* 483M    itwiki/
* 512M    nlwiki/
* 416M    plwiki/
* 659M    ruwiki/
* 528M    svwiki/

The dataset contains 162 files. The average file size is 56.1MB and the largest file is 451MB
(enwiki's latest snapshot on 2018-03-01).

### How are files organized?

Files are divided in directories, one for each language, like this:
{% highlight text %}
.
├── dewiki
│   └── 20180301
│       ├── dewiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── dewiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── dewiki.snapshot.resolve_redirect.2018-03-01.csv.gz
├── enwiki
│   └── 20180301
│       ├── enwiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── enwiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── enwiki.snapshot.resolve_redirect.2018-03-01.csv.gz
├── eswiki
│   └── 20180301
│       ├── eswiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── eswiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── eswiki.snapshot.resolve_redirect.2018-03-01.csv.gz
├── frwiki
│   └── 20180301
│       ├── frwiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── frwiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── frwiki.snapshot.resolve_redirect.2018-03-01.csv.gz
├── itwiki
│   └── 20180301
│       ├── itwiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── itwiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── itwiki.snapshot.resolve_redirect.2018-03-01.csv.gz
├── nlwiki
│   └── 20180301
│       ├── nlwiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── nlwiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── nlwiki.snapshot.resolve_redirect.2018-03-01.csv.gz
├── plwiki
│   └── 20180301
│       ├── plwiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── plwiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── plwiki.snapshot.resolve_redirect.2018-03-01.csv.gz
├── ruwiki
│   └── 20180301
│       ├── ruwiki.snapshot.resolve_redirect.2001-03-01.csv.gz
│       ├── ruwiki.snapshot.resolve_redirect.2002-03-01.csv.gz
│       ├── ...
│       └── ruwiki.snapshot.resolve_redirect.2018-03-01.csv.gz
└── svwiki
    └── 20180301
        ├── svwiki.snapshot.resolve_redirect.2001-03-01.csv.gz
        ├── svwiki.snapshot.resolve_redirect.2002-03-01.csv.gz
        ├── ...
        └── svwiki.snapshot.resolve_redirect.2018-03-01.csv.gz
{% endhighlight %}


  {% include_relative _wikilinkgraphs/faqs/whoproduced.html %}

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
