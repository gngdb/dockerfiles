
Pandoc + All of TeXLive
=======================

TeXLive never has one of the sty files you need. And installing the whole
thing to your system is messy. So keep everything in a container, and now
you can run pandoc on things without worrying, or having to touch cabal.

Usage
-----

You can use this however you like, I just mount a directory as a volume and
work in there:

```
mkdir pandocspace
docker run -it -v $PWD/pandocspace:/root gngdb/pandoc-texlive /bin/bash
```
