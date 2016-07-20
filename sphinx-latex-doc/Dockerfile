FROM        apiaryio/sphinx-doc
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-07-18

RUN apt-get install -y --no-install-recommends \
        texlive \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        rst2pdf

CMD ["make", "clean", "html", "latexpdf"]
