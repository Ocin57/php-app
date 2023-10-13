# On utilise l'image php 7.4
FROM php:7.4.33-apache-bullseye

# Mise à jour de l'OS + intallation des dépendances wget, ffmpeg, 
# unzip pour accélérer l'update de composer et la librairie de rabbitmq
RUN apt-get update
RUN apt-get install --yes \
wget=1.21-1+deb11u1 \
ffmpeg=7:4.3.6-0+deb11u1 \
unzip \
librabbitmq-dev

# Dépendence php pour les serveurs de messagerie ainsi que son extension docker
RUN pecl install amqp && docker-php-ext-enable amqp
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install sockets

# Permet de copier les fichiers pour le serveur apache
COPY . /var/www/html

# Téléchargement, installation et mise à jour de composer
RUN curl --silent --show-error https://getcomposer.org/installer --output /tmp/composer-setup.php
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer -version=2.5.6
RUN composer update
RUN composer install