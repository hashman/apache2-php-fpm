FROM php:7.4-fpm

RUN apt update \
    && apt install -y apache2 \
    && docker-php-ext-install pdo pdo_mysql opcache \
    && mkdir -p /code \
    && a2enmod proxy_fcgi rewrite \
    && mkdir -p /alloc/logs/ \
    && chown -R www-data /alloc/logs/

COPY 000-default.conf /etc/apache2/sites-available/
COPY php.ini /usr/local/etc/php/

EXPOSE 80
EXPOSE 443

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /code

ENTRYPOINT ["/entrypoint.sh"]
