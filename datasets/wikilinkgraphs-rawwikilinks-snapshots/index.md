---
layout: page
title: "Dataset: WikiLinkGraphs' RawWikilinks Snapshots"
excerpt: "This dataset contains wikilink snapshots, i.e. links between Wikipedia articles, extracted by processing each revision of each Wikipedia article (namespace 0) from Wikimedia's history dumps for the languages de, en, es, fr, it, nl, pl, ru, sv. The snapshots were taken on March 1st, for the years between 2001 and 2018 (included)."
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---


  {% include_relative _wikilinkgraphs/descriptions/rawwikilinks-snapshots.html %}
  {% include_relative _wikilinkgraphs/wikilinkgraphs.html dataset='rawwikilinks-snapshots' %}

## Description

<ul>
  {% include_relative _wikilinkgraphs/descriptions/fields/page_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/page_title.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_parent_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_timestamp.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/user_type.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/user_username.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/user_id.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_minor.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.link.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.anchor.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.section_name.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.section_level.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.section_number.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.is_active.html %}
</ul>

### Sample

Extract of the file `enwiki.link_snapshot.2018-03-01.csv.gz` in `enwiki/20180301/`:

{% highlight text %}
page_id,page_title,revision_id,revision_parent_id,revision_timestamp,user_type,user_username,user_id,revision_minor,wikilink.link,wikilink.tosection,wikilink.anchor,wikilink.section_name,wikilink.section_level,wikilink.section_number,wikinlink.is_active
10,AccessibleComputing,767284433,631144794,2017-02-25T00:30:28Z,registered,Godsy,23257138,0,Computer accessibility,Computer accessibility,---~--- incipit ---~---,0,0,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,6 February 1934 crisis,February 1934 riots, Conflicts with European fascist regimes ,3,8,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,abstentionism,abstentionism, First International and the Paris Commune ,3,4,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,Adolf Brand,Adolf Brand, Individualist anarchism ,3,18,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,Adolf Hitler,Hitler, Spanish Revolution ,3,9,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,Adolphe Thiers,Versailles, Propaganda of the deed and illegalism ,3,6,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,affinity group,affinity group, Contemporary anarchism ,3,11,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,affinity group,affinity group, Post-classical anarchist schools of thought ,3,19,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,Age of Enlightenment,Enlightenment, Origins ,3,3,1
12,Anarchism,828135433,827702904,2018-02-28T19:35:35Z,registered,Hydrargyrum,291919,0,agriculture,agrarian, Spanish Revolution ,3,9,1
{% endhighlight %}

## Download

This dataset can be downloaded in two different ways:

### HTTP (preferred method)

You can find the dataset on: [`cricca.disi.unitn.it/datasets/wikilinkgraphs-rawwikilinks/`](http://cricca.disi.unitn.it/datasets/wikilinkgraphs-rawwikilinks/).

You can download the dataset with the following command:
<pre>
adate=20180301; \
langs=( 'dewiki' 'enwiki'  'eswiki'  'frwiki'  'itwiki'  'nlwiki'  'plwiki'  'ruwiki' 'svwiki' ); \
for lang in "${langs[@]}"; do
  lynx \
    -dump \
    -listonly \
      "http://cricca.disi.unitn.it/datasets/wikilinkgraphs-rawwikilinks-snapshots/${lang}/${adate}/" | \
  awk '{print $2}' | \
  grep -E '^http://cricca\.disi\.unitn\.it/datasets/wikilinkgraphs-rawwikilinks/' | \
  xargs -L1 -I{} wget -R '\?C=' {}
done
</pre>

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
11G     dewiki/
29G     enwiki/
5.9G    eswiki/
9.2G    frwiki/
5.7G    itwiki/
4.1G    nlwiki/
4.8G    plwiki/
6.8G    ruwiki/
3.9G    svwiki/

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
