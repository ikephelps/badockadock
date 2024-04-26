FROM php:8.1-fpm

RUN apt-get update \
    && apt-get install -y procps

## Core Extensions ##
RUN apt-get install -y libldap-dev libpng-dev libxml2-dev libxslt-dev libzip-dev \
    && docker-php-ext-install gd ldap pdo_mysql sockets xsl zip

## Memcache ##
# libssl-dev is included ot make libmemcached-dev "work"; it's not a requirement
RUN apt-get install -y libmemcached-dev libssl-dev memcached \
    && echo '' | pecl install -o -f memcached \
    && docker-php-ext-enable memcached

## Redis, XMLRPC ##
RUN echo '' | pecl install -o -f redis xmlrpc \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis xmlrpc
