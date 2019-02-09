---
layout: page
title: "Dataset: WikiLinkGraphs' RawWikilinks"
excerpt: "This dataset contains wikilinks, i.e. links between Wikipedia articles, extracted by processing each revision of each Wikipedia article (namespace 0) from Wikimedia's history dumps for the languages de, en, es, fr, it, nl, pl, ru, sv."
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---

  {% include_relative _wikilinkgraphs/descriptions/rawwikilinks.html %}
  {% include_relative _wikilinkgraphs/wikilinkgraphs.html dataset='rawwikilinks' %}

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
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.tosection.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.anchor.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.section_name.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.section_level.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/wikilink.section_number.html %}
</ul>

### Sample

Extract of the file `enwiki-20180301-pages-meta-history1.xml-p10p2115.7z.revisionlist.csv.gz` in `enwiki/20180301/`:

{% highlight text %}
page_id,page_title,revision_id,revision_parent_id,revision_timestamp,user_type,user_username,user_id,revision_minor,wikilink.link,wikilink.tosection,wikilink.anchor,wikilink.section_name,wikilink.section_level,wikilink.section_number
10,AccessibleComputing,862220,233192,2002-02-25T15:43:11Z,registered,Conversion script,0,1,Accessible Computing,,Accessible Computing,---~--- incipit ---~---,0,0
10,AccessibleComputing,15898945,862220,2003-04-25T22:18:38Z,registered,Ams80,7543,1,Accessible_computing,,Accessible_computing,---~--- incipit ---~---,0,0
10,AccessibleComputing,56681914,15898945,2006-06-03T16:55:41Z,registered,Nzd,516514,1,Computer accessibility,,Computer accessibility,---~--- incipit ---~---,0,0
10,AccessibleComputing,74466685,56681914,2006-09-08T04:16:04Z,registered,Rory096,750223,0,Computer accessibility,,Computer accessibility,---~--- incipit ---~---,0,0
10,AccessibleComputing,133452289,133180268,2007-05-25T17:12:12Z,registered,Gurch,241822,1,Computer accessibility,,Computer accessibility,---~--- incipit ---~---,0,0
10,AccessibleComputing,381202555,381200179,2010-08-26T22:38:36Z,registered,OlEnglish,7181920,1,Computer accessibility,,Computer accessibility,---~--- incipit ---~---,0,0
10,AccessibleComputing,631144794,381202555,2014-10-26T04:50:23Z,registered,Paine Ellsworth,9092818,0,Computer accessibility,,Computer accessibility,---~--- incipit ---~---,0,0
10,AccessibleComputing,767284433,631144794,2017-02-25T00:30:28Z,registered,Godsy,23257138,0,Computer accessibility,,Computer accessibility,---~--- incipit ---~---,0,0
12,Anarchism,18201,332419362,2002-02-25T15:00:22Z,registered,Conversion script,0,1,libertarian socialism,,Libertarian socialists,---~--- incipit ---~---,0,0
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

The total dataset size is 1.2TB, divided among the languages like this:
* 110G    dewiki/
* 638G    enwiki/
* 94G     eswiki/
* 111G    frwiki/
* 77G     itwiki/
* 23G     nlwiki/
* 31G     plwiki/
* 73G     ruwiki/
* 13G     svwiki/

The dataset contains 978 files. The average file size is 1.3GB and the largest file is ~13GB
(the file from svwiki, which is just one chunk).

### How are files organized?

Files are divided in directories, one for each language, like this:
{% highlight text %}
.
├── dewiki
│   └── 20180301
│       ├── dewiki-20180301-pages-meta-history1.xml-p1p3405.7z.features.xml.gz
│       ├── dewiki-20180301-pages-meta-history1.xml-p3406p6349.7z.features.xml.gz
│       ├── ...
│       └── dewiki-20180301-pages-meta-history4.xml-p9990172p10238969.7z.features.xml.gz
├── enwiki
│   └── 20180301
│       ├── enwiki-20180301-pages-meta-history1.xml-p10p2115.7z.features.xml.gz
│       ├── enwiki-20180301-pages-meta-history1.xml-p2116p4236.7z.features.xml.gz
│       ├── ...
│       └── enwiki-20180301-pages-meta-history27.xml-p56237363p56724160.7z.features.xml.gz
├── eswiki
│   └── 20180301
│       ├── eswiki-20180301-pages-meta-history1.xml-p5p3721.7z.features.xml.gz
│       ├── eswiki-20180301-pages-meta-history1.xml-p3722p7536.7z.features.xml.gz
│       ├── ...
│       └── eswiki-20180301-pages-meta-history4.xml-p8089658p8379527.7z.features.xml.gz
├── frwiki
│   └── 20180301
│       ├── frwiki-20180301-pages-meta-history1.xml-p3p3554.7z.features.xml.gz
│       ├── frwiki-20180301-pages-meta-history1.xml-p3555p9507.7z.features.xml.gz
│       ├── ...
│       └── frwiki-20180301-pages-meta-history4.xml-p9743778p10092297.7z.features.xml.gz
├── itwiki
│   └── 20180301
│       ├── itwiki-20180301-pages-meta-history1.xml-p2p12411.bz2.features.xml.gz
│       ├── itwiki-20180301-pages-meta-history1.xml-p12412p29362.bz2.features.xml.gz
│       ├── ...
│       └── itwiki-20180301-pages-meta-history4.xml-p6535051p6847991.bz2.features.xml.gz
├── nlwiki
│   └── 20180301
│       ├── nlwiki-20180301-pages-meta-history1.xml-p1p6842.7z.features.xml.gz
│       ├── nlwiki-20180301-pages-meta-history1.xml-p6843p18427.7z.features.xml.gz
│       ├── ...
│       └── nlwiki-20180301-pages-meta-history4.xml-p4953496p4955587.7z.features.xml.gz
├── plwiki
│   └── 20180301
│       ├── plwiki-20180301-pages-meta-history1.xml-p2p7835.7z.features.xml.gz
│       ├── plwiki-20180301-pages-meta-history1.xml-p7836p27363.7z.features.xml.gz
│       ├── ...
│       └── plwiki-20180301-pages-meta-history4.xml-p3751406p4229714.7z.features.xml.gz
├── ruwiki
│   └── 20180301
│       ├── ruwiki-20180301-pages-meta-history1.xml-p4p5387.7z.features.xml.gz
│       ├── ruwiki-20180301-pages-meta-history1.xml-p5388p15885.7z.features.xml.gz
│       ├── ...
│       └── ruwiki-20180301-pages-meta-history4.xml-p6895239p7350163.7z.features.xml.gz
└── svwiki
    └── 20180301
        └── svwiki-20180301-pages-meta-history.xml.7z.features.xml.gz

{% endhighlight %}


  {% include_relative _wikilinkgraphs/faqs/whoproduced.html %}

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
