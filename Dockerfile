FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    unzip \
    libzip-dev \
    zip \
    libicu-dev \
    libmemcached-dev \
    libssl-dev \
    zlib1g-dev \
    && docker-php-ext-install pdo_mysql gd zip intl \
    && pecl install redis memcached  \
    && docker-php-ext-enable redis memcached

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
