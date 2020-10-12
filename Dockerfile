FROM php:7.4-fpm

RUN apt-get update -y && apt-get install -y \
    curl \
    git \
    zip \
    unzip \
    rsync \
    libcurl4-openssl-dev \
    libldb-dev \
    libldap2-dev \
    libxml2-dev \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libonig-dev \
    libmcrypt-dev

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pecl install \
    redis \
    xdebug

RUN docker-php-ext-enable \
    redis \
    xdebug

RUN docker-php-ext-install \
    curl \
    json \
    ldap \
    xml \
    pdo \
    pdo_mysql \
    exif \
    pcntl \
    zip \
    bcmath \
    gd \
    mbstring \
    tokenizer

RUN docker-php-source delete

#RUN groupadd -g 1000 www
#RUN useradd -u 1000 -ms /bin/bash -g www www
#RUN chown www:www /code -R
## COPY --chown=www:www ./code /code
#USER www

EXPOSE 9000

CMD ["php-fpm"]