FROM ontouchstart/texlive-full

# make sure everything is up to date
RUN apt-get update
RUN apt-get upgrade -y

# install pandoc
RUN apt-get install -y pandoc pandoc-citeproc

# start in root's homedir
WORKDIR /root
