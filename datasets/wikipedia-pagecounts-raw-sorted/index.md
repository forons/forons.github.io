---
layout: page
title: "Datasets: Wikipedia `pagecounts-raw` sorted by page (years 2007 – 2016)"
modified: 2018-12-06T02:16:21.453254177+01:00
excerpt: "This dataset contains the pagecounts-raw statistics for all the Wikimedia projects sorted by page 2007-2016"
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---

This dataset consists of hourly pagecounts for Wikipedia pages sorted by article, ordered by `(project, page, timestamp)`. It has been created by processing Wikimedia's [`pagecounts-raw`](https://dumps.wikimedia.org/other/pagecounts-raw/) dataset.

The original dataset holds the desktop sites' pageview data (separately for every page) for the period from December 2007 to July 2016, with hourly granularity for all Wikipedia editions. More info about the original dataset are available on [Wikitech](https://wikitech.wikimedia.org/wiki/Analytics/Archive/Data/Pagecounts-raw). Note that **these are not unique visits**.

The CSV uses *spaces* as delimiter, without any form of escaping because it is not needed. It has 5 columns:

* `project`: the project name
* `page`: the page requested, url-escaped
* `timestamp`: the timestamp of the hour (format: `%Y%m%d-%H%M%S`)
* `count`: the number of times the page has been requested (in that hour)
* `bytes`: the number of bytes transferred (in that hour)

The original dataset has been normalized in the following ways:

* the `project` column has been converted to lowercase
* the `page` columns has been unquoted and then re-quoted according to RFC 1308,
using the following equivalent Python 3 code:
{% highlight python %}
import urllib.parse
page_unquoted = urllib.parse.unquote(page, encoding='utf-8',
    errors='replace')
page_requoted = urllib.parse.quote(page_unquoted)
{% endhighlight %}
* if two lines are now equal because of this normalization, their `count` and
`bytes` columns are summed up.

This dataset is split in many gzip'd files, each of them containing 1,000,000 records.

An `index` folder is included: for every month there is a file describing the the first record of every partial file.

Here's an excerpt of the file [`pagecounts-20071210-000000.gz`](https://dumps.wikimedia.org/other/pagecounts-raw/2007/2007-12/pagecounts-20071210-000000.gz) (lines 379737--379752)<a class="collapsible inactive" id='pagecounts-raw_sample' href="#"></a>:
<div class="collapsible" id='pagecounts-raw_sample'>
{% highlight text %}
en Albert_Einstein 540 540
en Albert_Einstein#_note-76 1 1
en Albert_Einstein%27s_brain 23 23
en Albert_Einstein's_brain 14 14
en Albert_Einstein_-_Wikipedia%2C_the_free_encyclopedia_files/shared.css 1 1
en Albert_Einstein_Academy_Charter_School 1 1
en Albert_Einstein_Award 8 8
en Albert_Einstein_Award#_note-tellerbio 1 1
en Albert_Einstein_College_of_Medicine 1 1
en Albert_Einstein_Medal 1 1
en Albert_Einstein_Memorial 5 5
en Albert_Einstein_Peace_Prize 9 9
en Albert_Einstein_Peace_Prize#_note-0 1 1
en Albert_Einstein_Peace_Prize#_note-2 1 1
en Albert_Einstein_Society 1 1
en Albert_Einstein_in_popular_culture 5 5
{% endhighlight %}
</div>

and in the processed dataset in file `2007-12/part-00082.gz` (lines 352686--352695) you can find:<a class="collapsible inactive" id='pagecounts-raw-sorted_sample' href="#"></a>.
<div class="collapsible" id='pagecounts-raw-sorted_sample'>
{% highlight text %}
en Albert_Einstein 20071209-190000 471 471
en Albert_Einstein 20071209-200000 545 545
en Albert_Einstein 20071209-210000 546 546
en Albert_Einstein 20071209-220000 497 497
en Albert_Einstein 20071209-230000 564 564
en Albert_Einstein 20071210-000000 540 540
en Albert_Einstein 20071210-010000 567 567
en Albert_Einstein 20071210-020000 547 547
en Albert_Einstein 20071210-030000 557 557
en Albert_Einstein 20071210-040000 624 624
{% endhighlight %}
</div>

## Download

This dataset can be downloaded in two different ways:

### dat (preferred method)

* coming soon

### HTTP

You can find the dataset on: [`cricca.disi.unitn.it/datasets/pagecounts-raw-sorted/`](http://cricca.disi.unitn.it/datasets/pagecounts-raw-sorted/).

## Code

* This dataset has been produced using [Apache Spark](https://spark.apache.org/)
  on [Microsoft Azure](https://azure.microsoft.com/)
  with [this script](https://gist.github.com/youtux/13353862ac4227c4baf2) by Alessio Bogon.
* The Python module [pagecounts-search](https://github.com/youtux/pagecounts-search)
  provides a command-line utility to query this dataset.
* The repository [wikipedia-pageviews-extraction](https://github.com/NGI4eu/engineroom-wikipedia-pageviews-extraction) contains a collection of utility to extract pageviews
data for groups of articles taking into account the existence of redirects.

## Authors

* Cristian Consonni ([cristian.consonni(at)unitn.it](mailto:cristian.consonni(at)unitn(dot)it)), DISI - University of Trento
* Alberto Montresor, DISI - University of Trento

### License

The [original dataset](https://dumps.wikimedia.org/other/pagecounts-raw/) was
published in the Public Domain ([Public Domain Mark 1.0](http://creativecommons.org/publicdomain/mark/1.0/)).

You can reuse this dataset under the same license.

### How to cite

Please cite this dataset as:

***Cristian Consonni, Alberto Montresor.***
***Wikipedia pagecounts-raw sorted by article.***
***doi coming soon***

This dataset superseedes the previous version with just the data from 2014:
[doi:10.6084/m9.figshare.2085643.v1](https://dx.doi.org/10.6084/m9.figshare.2085643.v1),
see also [datasets/wikipedia-pagecounts-sorted-by-page-year-2014](http://disi.unitn.it/~consonni/datasets/wikipedia-pagecounts-sorted-by-page-year-2014/).

## FAQs

### What is the total size of the dataset, the number of files and the largest file in the dataset?

The total dataset size is 3.5TB, and it contains ~ 76,000 files. The average size is 45 MB and the largest file is 1.4GB.

### How are files organized?

Files are divided in directories, one for each month, like this:
{% highlight text %}
.
├── 2007-12
│   ├── index.2007-12.txt
│   ├── md5sums.2007-12.txt
│   ├── part-00000.gz
│   ├── part-00001.gz
│   ├── ...
│   └── part-00533.gz
├── 2008-01
│   ├── index.2008-01.txt
│   ├── md5sums.2008-01.txt
│   ├── part-00000.gz
│   ├── part-00001.gz
│   ├── ...
│   └── part-00742.gz
├── 2008-02
│   ├── index.2008-02.txt
│   ├── md5sums.2008-02.txt
│   ├── part-00000.gz
│   ├── part-00001.gz
│   ├── ...
│   └── part-00695.gz
├── 2008-03
...
└── 2016-08
{% endhighlight %}
The average directory size is ~34 GB, and on average each contains 731 part files.

### Who produced this dataset and why?

The dataset has been produced by Cristian Consonni and Alberto Montresor, from the Department of Information Engineering and Computer Science (DISI), University of Trento, Trento, Italy.

This research has been supported by Microsoft Azure Research Award CRM:0518942 as part of the ["Azure for Research Award: Data Science" program](https://www.microsoft.com/en-us/research/academic-program/data-science-award/).

This dataset has also been utilized in the research related to the ENGINEROOM project, in collaboration with David Laniado of Eurecat - Centre Tecnològic de Catalunya, Barcelona, Spain. EU ENGINEROOM has received funding from the European Union's Horizon 2020 research and innovation programme under the Grant Agreement no 780643.

### Is this dataset used in currently in-review or future papers that cite it?

This dataset has been used for multiple papers that are currently in-review or in preparation.

This dataset is published as part of the ENGINEROOM project and it will be cited in the related scientific publications.

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
