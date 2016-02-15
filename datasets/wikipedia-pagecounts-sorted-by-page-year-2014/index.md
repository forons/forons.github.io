---
layout: page
title: Datasets: Wikipedia pagecounts sorted by page (year 2014)
modified: 2016-02-15T17:43:02.362000+01:00
excerpt: "This dataset contains the page view statistics for all the Wikimedia projects in the year 2014"
image:
  feature: mountains-7.jpg
  credit: Dolomites, Monte Paterno by Robert J. Heath @ Flickr (CC-BY 2.0)
  creditlink: http://bit.ly/1ZbMlDJ
---

The reference page for this dataset is also available at:
[doi:10.6084/m9.figshare.2085643.v1](https://dx.doi.org/10.6084/m9.figshare.2085643.v1)

This dataset contains the page view statistics for all the Wikimedia projects
in the year 2014, ordered by (project, page, timestamp). It has been generated
starting from the Wikimedia's
[pagecounts-raw](https://dumps.wikimedia.org/other/pagecounts-raw/) dataset.

The CSV uses *spaces* as delimiter, without any form of escaping because it is
not needed. It has 5 columns:

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

This dataset is split in many gzip'd files, each of them containing 1,000,000
records.

An `index` file is included: every line represent the first record of every
partial file.

Sample (taken from `part-0000011138.gz`, starting from line 411917)<a class="collapsible inactive" id='template_count_extract' href="#"></a>.
<div class="collapsible" id='template_count_extract'>
{% highlight text %}
en Albert_Einstein 20140101-000000 300 25645681
en Albert_Einstein 20140101-010000 246 21173395
en Albert_Einstein 20140101-020000 276 23558819
en Albert_Einstein 20140101-030000 234 17418623
en Albert_Einstein 20140101-040000 283 21449007
en Albert_Einstein 20140101-050000 289 23254304
{% endhighlight %}
</div>

You can find an extended sample in the file `en_Albert_Einstein.pagecounts.txt`.

## Download

You can download the data via torrent: each torrent file contains
10k file (~60GB, compressed). Each torrent comes with the index
of the pages it contains.

We are planning to upload this data also to the Internet Archive.

* [index of pages](./index.txt)
* [pagecounts-2014-0000000000-0000009999.torrent](./pagecounts-2014-0000000000-0000009999.torrent)
* [pagecounts-2014-0000010000-0000019999.torrent](./pagecounts-2014-0000010000-0000019999.torrent)
* [pagecounts-2014-0000020000-0000029999.torrent](./pagecounts-2014-0000020000-0000029999.torrent)
* [pagecounts-2014-0000030000-0000039999.torrent](./pagecounts-2014-0000030000-0000039999.torrent)
* [pagecounts-2014-0000040000-0000049999.torrent](./pagecounts-2014-0000040000-0000049999.torrent)
* [pagecounts-2014-0000050000-0000059999.torrent](./pagecounts-2014-0000050000-0000059999.torrent)
* [pagecounts-2014-0000060000-0000069999.torrent](./pagecounts-2014-0000060000-0000069999.torrent)
* [MD5 sums for the files above](./pagecounts-torrents.md5sum.txt)

## Code

* This dataset has been produced using [Apache Spark](https://spark.apache.org/)
  on the [Cisca-Cluster at the University of Trento](http://doc.science.unitn.it/wiki/Il_Cluster_di_Scienze_%28Cisca-Cluster%29)
  with [this script](https://gist.github.com/youtux/13353862ac4227c4baf2);
* The Python module [pagecounts-search](https://github.com/youtux/pagecounts-search)
  provides a command-line utility to query this dataset.

## Authors

* Alessio Bogon ([keybase.io/youtux](https://keybase.io/youtux)), DISI - University of Trento
* Cristian Consonni ([cristian.consonni(at)unitn.it](mailto:cristian.consonni(at)unitn(dot)it)), DISI - University of Trento
* Alberto Montresor, DISI - University of Trento

### License

The [original dataset](https://dumps.wikimedia.org/other/pagecounts-raw/) was
published in the Public Domain ([Public Domain Mark 1.0](http://creativecommons.org/publicdomain/mark/1.0/)).

You can reuse this dataset under the [Creative Commons - Attribution (CC BY) 4.0 license](https://creativecommons.org/licenses/by/4.0/).

### How to cite

Please cite this dataset as:

***Alessio Bogon, Cristian Consonni, Alberto Montresor.***
***Wikipedia pagecounts by page.***
***[doi:10.6084/m9.figshare.2085643.v1](https://dx.doi.org/10.6084/m9.figshare.2085643.v1)***

---

## Questions?

For further info <a href="mailto:cristian.consonni(at)unitn(dot)it" target="_blank">send me an e-mail</a>.
