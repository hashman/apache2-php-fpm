#!/bin/sh

set -ex

/etc/init.d/apache2 restart
php-fpm
