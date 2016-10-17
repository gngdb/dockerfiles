FROM ubuntu:latest

# dependencies
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository main &&\
    add-apt-repository universe &&\
    apt-get update &&\
    apt-get install -y python3-flask python3-requests texlive imagemagick texlive-latex-extra

# make user to run server
RUN useradd -m -g users flask
WORKDIR /home/flask

ADD https://raw.githubusercontent.com/chuanshi/slacklatex/master/main.py main.py
ADD https://gist.githubusercontent.com/gngdb/7b0008a49978dfa4c444f49082789874/raw/ed78bb91045573babe46b64740fcf26ae153fb32/gistfile1.txt template.tex
RUN mkdir -p texmf/tex/latex/shortbold
ADD http://arxmliv.kwarc.info/sty/shortbold.sty texmf/tex/latex/shortbold/shortbold.sty
ADD config.ini config.ini
RUN chown flask:users *

EXPOSE 5000

USER flask
CMD ["python3", "main.py"]
