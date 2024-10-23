#!/usr/bin/env bash

set -e

[ -d /tmp/.composer ] || mkdir /tmp/.composer && trap "rm -fr tmp/.composer" EXIT ERR INT

cd /tmp/.composer

curl -fs https://composer.github.io/installer.sha384sum -o composer-setup.sha384sum
curl -fs https://getcomposer.org/installer -o composer-setup.php

sha384sum -c composer-setup.sha384sum --strict
php composer-setup.php --install-dir=/usr/local/bin --filename=composer