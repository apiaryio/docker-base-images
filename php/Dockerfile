FROM        php:5.6-apache
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-04-03

RUN a2enmod rewrite && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod 755 /usr/local/bin/composer
