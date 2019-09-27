FROM php:7.3-fpm

RUN apt update \
    && apt install -y apache2 \
    && docker-php-ext-install pdo pdo_mysql \
    && mkdir -p /code \
    && a2enmod proxy_fcgi rewrite

COPY 000-default.conf /etc/apache2/sites-available/

EXPOSE 80
EXPOSE 443

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /code

ENTRYPOINT ["/entrypoint.sh"]
