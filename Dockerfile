FROM php:apache-bullseye
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install libsasl2-modules postfix && \
    php manage.php deploy -v /var/www/htdocs/osticket/

