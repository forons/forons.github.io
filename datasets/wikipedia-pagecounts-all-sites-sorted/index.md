---
layout: page
title: "Datasets: Wikipedia pagecounts-all-sites sorted by page (years 2014 – 2016)"
modified: 2018-12-09T02:10:44.777593225+01:00
excerpt: "This dataset contains the pagecounts-all statistics for all the Wikimedia projects sorted by page 2014-2016"
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---

This dataset consists of hourly pagecounts for Wikipedia pages sorted by article, ordered by `(project, page, timestamp)`. It has been created by processing Wikimedia's [`pagecounts-all-sites`](https://dumps.wikimedia.org/other/pagecounts-all-sites) dataset.

The original dataset holds output from September, 2014 to August, 2016 that mimics `pagecounts-raw` files, but gets generated from Hadoop data using Hive. The original dataset holds the desktop sites' pageview data with hourly granularity for all Wikipedia editions. More info about the original dataset are available on [Wikitech](https://wikitech.wikimedia.org/wiki/Analytics/Archive/Data/Pagecounts-all-sites). Note that **these are not unique visits**. Note that this dataset files have a one hour shift later than any other dataset handled by the analytics-team (particularly webrequest, pageview-hourly, projectview-hourly). For instance for data between `2018-09-27T13:00:00` and `2018-09-27T14:00:00`, pagecounts-all-sites uses `2018-09-27T14:00:00` while other dataset uses `2018-09-27T13:00:00`.

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

Here's an excerpt of the file [`pagecounts-20140923-010000.gz`](https://dumps.wikimedia.org/other/pagecounts-all-sites/2014/2014-09/pagecounts-20140923-010000.gz) (lines 1612915--1612924)<a class="collapsible inactive" id='pagecounts-raw_sample' href="#"></a>:
<div class="collapsible" id='pagecounts-raw_sample'>
{% highlight text %}
en Albert_Einstein 505 44692476
en Albert_Einstein%27s_brain 13 259793
en Albert_Einstein%27s_political_views 2 60335
en Albert_Einstein%27s_religious_views 3 101366
en Albert_Einstein's_brain 12 159387
en Albert_Einstein:_The_Practical_Bohemian 1 30429
en Albert_Einstein_(album) 2 37854
en Albert_Einstein_(disambiguation) 1 9232
en Albert_Einstein_ATV 2 142976
en Albert_Einstein_Award 1 14635
{% endhighlight %}
</div>

and in the processed dataset in file `2014-09/part-00082.gz` (lines 9079271--9079280) you can find:<a class="collapsible inactive" id='pagecounts-raw-sorted_sample' href="#"></a>.
<div class="collapsible" id='pagecounts-raw-sorted_sample'>
{% highlight text %}
en Albert_Einstein 20140923-090000 514 50705784
en Albert_Einstein 20140923-230000 493 47997224
en Albert_Einstein 20140925-000000 477 43672460
en Albert_Einstein 20140925-020000 522 47596725
en Albert_Einstein 20140925-190000 840 74566033
en Albert_Einstein 20140926-070000 420 40327383
en Albert_Einstein 20140926-220000 427 38073829
en Albert_Einstein 20140927-140000 577 51050092
en Albert_Einstein 20140928-060000 457 38843362
en Albert_Einstein 20140928-190000 727 61539311
{% endhighlight %}
</div>

## Download

This dataset can be downloaded in two different ways:

### HTTP

You can find the dataset on: [`cricca.disi.unitn.it/datasets/pagecounts-all-sites-sorted/`](http://cricca.disi.unitn.it/datasets/pagecounts-all-sites-sorted/).

You can use the scripts at [`pagecounts-download-tools`](https://github.com/CristianCantoro/pagecounts-download-tools) on GitHub.

#### How-to download a month worth of data

<ol>
  <li>
    clone the repository:
    <pre>
    ╭─ ~
    ╰─$ git clone https://github.com/CristianCantoro/pagecounts-download-tools
    </pre>
  </li>
  <li>
    go to the `sizes` directory and execute the download sizes:
    <pre>
    ╭─ ~/pagecounts-download-tools/sizes
    ╰─$ ./download_sizes.sh http://cricca.disi.unitn.it/datasets/pagecounts-all-sites-sorted/
    </pre>
  </li>
  <li>
    go to the `downloadlists` directory and execute the download sizes:
    <pre>
    ╭─ ~/pagecounts-download-tools/downloadlists
    ╰─$ ./make_lists.sh ../sizes/2014-09.txt http://cricca.disi.unitn.it/datasets/pagecounts-all-sites-sorted/
    </pre>
  </li>
  <li>
    from the repository base directory and dowload files:
    <pre>
    ╭─ ~/pagecounts-download-tools
    ╰─$ ./make_lists.sh ./download.sh -d 2014 9
    </pre>
  </li>
</ol>

### dat (experimental)

You can download the dataset using [`dat`](https://datproject.org/), the dataset is available at [`datbase.org/CristianCantoro/pagecounts-all-sites-sorted`](https://datbase.org/CristianCantoro/pagecounts-all-sites-sorted).

Once you have installed `dat`, you can download the dataset with:
```
dat clone dat://<dat> ~/dat-pagecounts-all-sites-sorted
```

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

The total dataset size is 1.1TB, and it contains ~15,800 files. The average size is 35 MB and the largest file is 1.22GB.

### How are files organized?

Files are divided in directories, one for each month, like this:
{% highlight text %}
.
├── 2014-09
│   ├── part-00000.gz
│   ...
│   └── part-00190.gz
├── 2014-10
│   ├── part-00000.gz
│   ...
│   └── part-00743.gz
├── 2014-11
...
└── 2016-08
    ├── part-00000.gz
    ...
    └── part-00108.gz
{% endhighlight %}
The average directory size is ~45GB, and on average each contains 657 part files.

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
