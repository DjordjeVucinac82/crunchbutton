FROM php:7.2.1-fpm

RUN echo 'deb http://httpredir.debian.org/debian jessie contrib' >> /etc/apt/sources.list

RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y --force-yes libssl-dev curl  libcurl4-gnutls-dev libxml2-dev libicu-dev libmcrypt4 libmemcached11 openssl

RUN docker-php-ext-install opcache

RUN pecl install apcu-5.1.5 && docker-php-ext-enable apcu

RUN docker-php-ext-install bcmath
RUN apt-get update
RUN apt-get install -y libmcrypt-dev curl git nginx zlib1g-dev wget libbz2-dev
RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt
RUN docker-php-ext-install bz2
RUN docker-php-ext-install mbstring
RUN apt-get install -y libpq-dev
RUN apt-get install -y libicu-dev
RUN docker-php-ext-install intl
RUN docker-php-ext-install iconv
RUN docker-php-ext-install pdo pdo_mysql 
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng16-16
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

CMD /var/app/cli/build.sh 

EXPOSE 9000
CMD ["php-fpm"]
