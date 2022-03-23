FROM php:apache-bullseye
RUN apt-get update && \
    apt-get upgrade -y && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install libsasl2-modules postfix && \
    php manage.php deploy -v /var/www/htdocs/osticket/

