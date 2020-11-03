FROM        apiaryio/sphinx-doc:latest
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2020-11-02

RUN apt-get install -y --no-install-recommends \
        texlive \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        rst2pdf \
        latexmk

CMD ["make", "clean", "html", "latexpdf"]
