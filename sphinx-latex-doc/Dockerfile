FROM        apiaryio/sphinx-doc
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-05-25

RUN apt-get install -y --no-install-recommends \
        texlive \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        rst2pdf \
        latexmk

CMD ["make", "clean", "html", "latexpdf"]
