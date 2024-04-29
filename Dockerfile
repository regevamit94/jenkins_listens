
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    php \
    apache2 \
    mysql-client \
    php-mysql \
    wget \
    iputils-ping

RUN wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz -C /var/www/html --strip-components=1

RUN cat <<EOF >> /etc/apache2/sites-available/000-default.conf

<VirtualHost *:80>
    ServerName www.testexample.com
    ServerAdmin webmaster@localhost
    DirectoryIndex index.php
    DocumentRoot /var/www/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF