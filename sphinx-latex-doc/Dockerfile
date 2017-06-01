FROM        apiaryio/sphinx-doc
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2017-06-01

RUN apt-get install -y --no-install-recommends \
        texlive \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        rst2pdf \
        latexmk

CMD ["make", "clean", "html", "latexpdf"]
