
Having the entire LaTeX install on your system is bloated, wouldn't it be
nicer to put the whole thing a in a container? And what if we included the
style files for [ICLR 2016][iclr], so the container can just watch your
paper TeX file and recompile it whenever you change it so you can get live
updates while you write it?

To use this container, mount your TeX file and any requirements as volumes,
and mount the output directory `out` as a volume in the same directory;
then just run the container. By default it assumes the paper is called
`paper.tex`, but this can be overrided with the `$TEXFILE` environment
variable. For example:

```
docker run -d -e "TEXFILE=gngdbpaper.tex" -v $PWD/gngdbpaper.tex:/root/gngdbpaper.tex -v $PWD/out:out -name texdaemon gngdb/iclr2016_conference
```

Then, the container will run as a daemon, watching your changes to the TeX
file and updating the output as you write. And, since it has the entire
TeXLive distribution installed and up to date, you should always have the
style files you need.

### Automatic updating

For the automatic updating to work you might need to `chmod` your `.tex`
file to `664`, [due to the way mounting volumes works with docker][thread].

### Warning

Trying to debug LaTeX errors inside a docker container could be even more
frustrating than it normally is, but it doesn't have to be. Using 
`docker logs` you can watch the debug output as you recompile. For example,
in the above command the name of the container was `texdaemon`, so:

```
docker logs texdaemon
```

And if you want to follow the logs as you make changes:

```
docker logs -f texdaemon
```

[iclr]: http://www.iclr.cc/doku.php?id=start
[thread]: https://forums.docker.com/t/modify-a-file-which-mount-as-a-data-volume-but-it-didnt-change-in-container/2813/13
