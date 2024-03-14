FROM php:8.1-fpm

RUN apt-get update \
    && apt-get install -y procps

## Core Extensions ##
RUN apt-get install -y libpng-dev libxml2-dev libxslt-dev libzip-dev \
    && docker-php-ext-install gd pdo_mysql sockets xsl zip

## Memcache ##
# libssl-dev is included ot make libmemcached-dev "work"; it's not a requirement
RUN apt-get install -y libmemcached-dev libssl-dev memcached \
    && echo '' | pecl install -o -f memcached \
    && docker-php-ext-enable memcached

## Redis, XMLRPC ##
RUN echo '' | pecl install -o -f redis xmlrpc \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis xmlrpc

## Xdebug (Optional) ##
 RUN pecl install --onlyreqdeps xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.default_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
