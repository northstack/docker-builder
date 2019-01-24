FROM php:7-alpine

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mbstring

WORKDIR /app

# Composer install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

# install bash
RUN apk update && apk add --no-cache bash

# install nvm for node builds
RUN wget https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh
RUN chmod +x ./install.sh
RUN touch ~/.bashrc
RUN ./install.sh
RUN rm install.sh

# install rvm for ruby
RUN curl -sSL https://get.rvm.io | bash -s stable

# install python
RUN apk add --no-cache py-pip

# install git
RUN apk add --no-cache git
