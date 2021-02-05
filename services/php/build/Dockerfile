FROM php:8.0-fpm

RUN apt-get update

## Core Extensions
RUN apt-get install -y libpng-dev libxml2-dev libxslt-dev libzip-dev \
    && docker-php-ext-install gd mysqli pdo_mysql sockets xsl zip

## Memcache ##
RUN apt-get install -y libmemcached-dev memcached \
    && pecl install -o -f memcached \
    && docker-php-ext-enable memcached

## Redis ##
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    && docker-php-ext-enable redis

## XML-RPC ##
RUN pecl install -o -f xmlrpc \
    && docker-php-ext-enable xmlrpc

## Xdebug ##
RUN pecl install --onlyreqdeps xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=develop" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
