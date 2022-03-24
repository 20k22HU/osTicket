FROM php:7.4-apache-bullseye
RUN mkdir /src
COPY . /src/
RUN apt-get update && \
    apt-get upgrade -y && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install libsasl2-modules postfix zlib1g-dev libpng-dev libicu-dev && \
    cd /src && \
    php manage.php deploy -sv /var/www/html/ && \
    chown -R www-data:www-data /var/www/html && \
    docker-php-ext-install gd mysqli intl opcache && \
    pecl install apcu-5.1.21 && \
    docker-php-ext-enable apcu && \
    echo "extension=apcu.so" >> /usr/local/etc/php/php.ini && \
    echo "apc.enable_cli=1" >> /usr/local/etc/php/php.ini && \
    echo "apc.enable=1" >> /usr/local/etc/php/php.ini && \
    rm -rf /src
