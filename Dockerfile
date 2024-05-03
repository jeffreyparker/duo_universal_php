FROM php:8
EXPOSE 8080
RUN apt update && apt install -y unzip wget
WORKDIR /root
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/885ece8a6e1370b204b89b7a542169d25aa21177/web/installer -O - -q | php -- --quiet

WORKDIR /src
ADD ./composer.json /src/composer.json
#ADD ./composer.lock /src/composer.lock
RUN /root/composer.phar update
ADD . /src