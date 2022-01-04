FROM php:8.1-apache

RUN apt update && \
    apt install -qqy git unzip && \
    a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY src /src

WORKDIR /src

RUN rm -r /var/www/html
RUN ln -s /src/public /var/www/html
RUN chmod 777 -Rf /src/storage
RUN touch /src/storage/logs/laravel.log && chmod 777 -Rf /src/storage/logs/laravel.log 
EXPOSE 80