FROM php:7

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mbstring

WORKDIR /app

# Composer install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN apt-get update && apt-get install -y wget

# install nvm for node builds
RUN wget https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh
RUN chmod +x ./install.sh
RUN touch ~/.bashrc
RUN ./install.sh
RUN rm install.sh

# install python
RUN apt-get install -y python-pip git
RUN apt-get install -y procps

RUN apt-get install -y ruby-full

# install rvm for ruby
#RUN curl -sSL https://get.rvm.io | bash -s stable
#RUN usermod -aG rvm root
#RUN /etc/profile.d/rvm.sh
#RUN /usr/local/rvm/bin/rvm install 2.6

COPY assets/filewaiter.php /usr/local/bin/filewaiter.php
COPY assets/gatsby.sh /usr/local/bin/gatsby.sh

ENTRYPOINT /bin/bash
