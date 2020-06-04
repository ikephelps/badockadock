FROM php:7.3-fpm

RUN apt-get update \
    && apt-get install -y procps

## Core Extensions
RUN apt-get install -y libpng-dev libxml2-dev libxslt-dev libzip-dev \
    && docker-php-ext-install gd mysqli pdo_mysql sockets xmlrpc xsl zip

# PECL Extensions
RUN apt-get install -y libmemcached-dev memcached \
    && echo '' | pecl install -o -f memcached \
    && docker-php-ext-enable memcached

RUN echo '' | pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    && docker-php-ext-enable redis

RUN pecl install --onlyreqdeps xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.default_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
