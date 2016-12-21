FROM php:5.6-apache

RUN docker-php-ext-install pdo_mysql

ADD 000-default.conf /etc/apache2/sites-available/
RUN a2enmod rewrite && a2ensite 000-default

CMD ["apache2-foreground"]

