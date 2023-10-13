FROM php:7.4.33-apache-bullseye

RUN apt-get update
RUN apt-get install --yes \
wget=1.21-1+deb11u1 \
ffmpeg=7:4.3.6-0+deb11u1 \
#lsb-release \
unzip \
#git \
librabbitmq-dev

RUN pecl install amqp && docker-php-ext-enable amqp

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install sockets

COPY . /var/www/html

#RUN COMPOSER_ALLOW_SUPERUSER=1

RUN curl --silent --show-error https://getcomposer.org/installer --output /tmp/composer-setup.php
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer -version=2.5.6

RUN composer update
RUN composer install
