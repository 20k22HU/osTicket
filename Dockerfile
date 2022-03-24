FROM php:7.4-apache-bullseye
RUN mkdir /src
COPY . /src/
RUN apt-get update && \
    apt-get upgrade -y && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install libsasl2-modules postfix && \
    cd /src && \
    php manage.php deploy -sv /var/www/html/ && \
    chown -R www-data:www-data /var/www/html && \
    rm -rf /src
