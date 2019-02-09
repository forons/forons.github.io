---
layout: page
title: "Dataset: WikiLinkGraphs' Redirects"
excerpt: "This dataset contains redirects in Wikipedia, i.e. alias names for Wikipedia articles, extracted by processing Wikimedia's history dumps for the languages de, en, es, fr, it, nl, pl, ru, sv."
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
  {% include_relative _wikilinkgraphs/descriptions/fields/revision_minor.html %}

  {% include_relative _wikilinkgraphs/descriptions/fields/redirect.target.html %}
  {% include_relative _wikilinkgraphs/descriptions/fields/redirect.tosection.html %}
</ul>

### Sample

Extract of the file `enwiki-20180301-pages-meta-history1.xml-p10p2115.7z.revisionlist.csv.gz` in `enwiki/20180301/`:

{% highlight text %}
page_id,page_title,revision_id,revision_parent_id,revision_timestamp,revision_minor,redirect.target,redirect.tosection
10,AccessibleComputing,862220,233192,2002-02-25T15:43:11Z,1,Accessible Computing,
10,AccessibleComputing,15898945,862220,2003-04-25T22:18:38Z,1,Accessible_computing,
10,AccessibleComputing,56681914,15898945,2006-06-03T16:55:41Z,1,Computer accessibility,
10,AccessibleComputing,74466685,56681914,2006-09-08T04:16:04Z,0,Computer accessibility,
10,AccessibleComputing,133180268,74466685,2007-05-24T14:41:58Z,1,#NOREDIRECT,
10,AccessibleComputing,133452289,133180268,2007-05-25T17:12:12Z,1,Computer accessibility,
10,AccessibleComputing,381200179,133452289,2010-08-26T22:23:51Z,0,#NOREDIRECT,
10,AccessibleComputing,381202555,381200179,2010-08-26T22:38:36Z,1,Computer accessibility,
10,AccessibleComputing,631144794,381202555,2014-10-26T04:50:23Z,0,Computer accessibility,
10,AccessibleComputing,767284433,631144794,2017-02-25T00:30:28Z,0,Computer accessibility,
{% endhighlight %}

## Download

This dataset can be downloaded in two different ways:

### HTTP (preferred method)

  {% include_relative _wikilinkgraphs/http.html dataset='redirects' %}

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


### How are files organized?

Files are divided in directories, one for each language, like this:
{% highlight text %}


{% endhighlight %}


  {% include_relative _wikilinkgraphs/faqs/whoproduced.html %}

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
