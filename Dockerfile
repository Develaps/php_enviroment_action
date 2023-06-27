FROM php:7.4-fpm-alpine

# Install system dependencies

RUN apk -- update add \
    curl \
    libpng-dev \
    libxml2-dev \
    zip \ 
    unzip \
    ext-gd

# Clear cache

RUN rm /var/cache/apk/*

# Install php extensions

RUN docker-php-ext-install pdo_mysql 

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
