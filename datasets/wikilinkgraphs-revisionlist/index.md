---
layout: page
title: "Dataset: WikiLinkGraphs' RevisionLists"
excerpt: "This dataset contains lists of all revisions for each Wikipedia article from Wikimedia's history dumps for the languages de, en, es, fr, it, nl, pl, ru, sv."
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---

	{% include_relative _wikilinkgraphs/descriptions/revisionlist.html %}

### Descriptions of the data

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
</ul>

### Sample

Extract of the file `enwiki-20180301-pages-meta-history1.xml-p10p2115.7z.revisionlist.csv.gz` in `enwiki/20180301/`:

{% highlight text %}
page_id,page_title,revision_id,revision_parent_id,revision_timestamp,user_type,user_username,user_id,revision_minor
10,AccessibleComputing,233192,,2001-01-21T02:12:21Z,registered,RoseParks,99,0
10,AccessibleComputing,862220,233192,2002-02-25T15:43:11Z,registered,Conversion script,0,1
10,AccessibleComputing,15898945,862220,2003-04-25T22:18:38Z,registered,Ams80,7543,1
10,AccessibleComputing,56681914,15898945,2006-06-03T16:55:41Z,registered,Nzd,516514,1
10,AccessibleComputing,74466685,56681914,2006-09-08T04:16:04Z,registered,Rory096,750223,0
10,AccessibleComputing,133180268,74466685,2007-05-24T14:41:58Z,registered,Ngaiklin,4477979,1
10,AccessibleComputing,133452289,133180268,2007-05-25T17:12:12Z,registered,Gurch,241822,1
10,AccessibleComputing,381200179,133452289,2010-08-26T22:23:51Z,ip,76.28.186.133,-1,0
10,AccessibleComputing,381202555,381200179,2010-08-26T22:38:36Z,registered,OlEnglish,7181920,1
10,AccessibleComputing,631144794,381202555,2014-10-26T04:50:23Z,registered,Paine Ellsworth,9092818,0
{% endhighlight %}

## Download

This dataset can be downloaded in two different ways:

### HTTP (preferred method)

You can find the dataset on: [`cricca.disi.unitn.it/datasets/wikilinkgraphs-revisionlist/`](http://cricca.disi.unitn.it/datasets/wikilinkgraphs-revisionlist/).

You can download the dataset with the following command:
<pre>
adate=20180301; \
langs=( 'dewiki' 'enwiki'  'eswiki'  'frwiki'  'itwiki'  'nlwiki'  'plwiki'  'ruwiki' 'svwiki' ); \
for lang in "${langs[@]}"; do
  lynx \
    -dump \
    -listonly \
      "http://cricca.disi.unitn.it/datasets/wikilinkgraphs-revisionlist/${lang}/${adate}/" | \
  awk '{print $2}' | \
  grep -E '^http://cricca\.disi\.unitn\.it/datasets/wikilinkgraphs-revisionlist/' | \
  xargs -L1 -I{} wget -R '\?C=' {}
done
</pre>

### dat (experimental)

  {% include_relative _wikilinkgraphs/dat.html 
     dat='dat://40b516f8a05d8c207d427a290a76916605ba31a60d7e0aa73d090c1decd9fcdc'
     folder='~/wikilinkgraphs-revisionlist'
  %}

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

The total dataset size is 21GB, and it contains 987 files. The average file size is 21.8MB and the largest file is 588MB.

### How are files organized?

Files are divided in directories, one for each language, like this:
{% highlight text %}
.
├── dewiki
│   └── 20180301
│       ├── dewiki-20180301-pages-meta-history1.xml-p1p3405.7z.revisionlist.csv.gz
│       ├── dewiki-20180301-pages-meta-history1.xml-p3406p6349.7z.revisionlist.csv.gz
│       ├── ...
│       └── dewiki.revisionlist.sha512sums.txt
├── enwiki
│   └── 20180301
│       ├── enwiki-20180301-pages-meta-history1.xml-p10p2115.7z.revisionlist.csv.gz
│       ├── enwiki-20180301-pages-meta-history1.xml-p2116p4236.7z.revisionlist.csv.gz
│       ├── ...
│       └── enwiki.revisionlist.sha512sums.txt
├── eswiki
│   └── 20180301
│       ├── eswiki-20180301-pages-meta-history1.xml-p5p3721.7z.revisionlist.csv.gz
│       ├── eswiki-20180301-pages-meta-history1.xml-p3722p7536.7z.revisionlist.csv.gz
│       ├── ...
│       └── eswiki.revisionlist.sha512sums.txt
├── frwiki
│   └── 20180301
│       ├── frwiki-20180301-pages-meta-history1.xml-p3p3554.7z.revisionlist.csv.gz
│       ├── frwiki-20180301-pages-meta-history1.xml-p3555p9507.7z.revisionlist.csv.gz
│       ├── ...
│       └── frwiki.revisionlist.sha512sums.txt
├── itwiki
│   └── 20180301
│       ├── itwiki-20180301-pages-meta-history1.xml-p2p12411.bz2.revisionlist.csv.gz
│       ├── itwiki-20180301-pages-meta-history1.xml-p12412p29362.bz2.revisionlist.csv.gz
│       ├── ...
│       └── itwiki.revisionlist.sha512sums.txt
├── nlwiki
│   └── 20180301
│       ├── nlwiki-20180301-pages-meta-history1.xml-p1p6842.7z.revisionlist.csv.gz
│       ├── nlwiki-20180301-pages-meta-history1.xml-p6843p18427.7z.revisionlist.csv.gz
│       ├── ...
│       └── nlwiki.revisionlist.sha512sums.txt
├── plwiki
│   └── 20180301
│       ├── plwiki-20180301-pages-meta-history1.xml-p2p7835.7z.revisionlist.csv.gz
│       ├── plwiki-20180301-pages-meta-history1.xml-p7836p27363.7z.revisionlist.csv.gz
│       ├── ...
│       └── plwiki.revisionlist.sha512sums.txt
├── ruwiki
│   └── 20180301
│       ├── ruwiki-20180301-pages-meta-history1.xml-p4p5387.7z.revisionlist.csv.gz
│       ├── ruwiki-20180301-pages-meta-history1.xml-p5388p15885.7z.revisionlist.csv.gz
│       ├── ...
│       └── ruwiki.revisionlist.sha512sums.txt
└── svwiki
    └── 20180301
        ├── svwiki-20180301-pages-meta-history.xml.7z.revisionlist.csv.gz
        └── svwiki.revisionlist.sha512sums.txt
{% endhighlight %}


  {% include_relative _wikilinkgraphs/faqs/whoproduced.html %}
  {% include_relative _wikilinkgraphs/faqs/publications.html %}

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
