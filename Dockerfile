FROM php:7.0-fpm

ENV DOCKER=1
ENV DEBUG=1

RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        php-pear \
        curl \
        git \
		nginx \
    && docker-php-ext-install iconv mcrypt \
	&& docker-php-ext-install pdo pdo_mysql


ADD conf/nginx.docker.conf /etc/nginx/sites-available/default
RUN echo "cgi.fix_pathinfo = 0;" >> /usr/local/etc/php/conf.d/fix_pathinfo.ini
#RUN echo "listen = /var/run/php5-fpm.sock" >> /usr/local/etc/php-fpm.conf
RUN echo " \n\
listen = 127.0.0.1:9000" >> /usr/local/etc/php-fpm.conf
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD ./ /var/www/app
#RUN chown -R www-data:www-data /var/www/app
#RUN chmod -R 0777 /var/www/app
#RUN ln -s /opt/www /var/www/app

CMD nginx && php-fpm