FROM php:8.3-fpm

# Установим зависимости
RUN apt-get update && apt-get install -y \
    libpq-dev \
    zip unzip git curl \
    && docker-php-ext-install pdo pdo_pgsql

# Установка Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Настройка Xdebug
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Установка Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
