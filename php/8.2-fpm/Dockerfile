FROM php:8.2-fpm

ENV CACHE_REDIS_DSN=redis://redis

RUN apt-get update && apt-get install -y wget libzip-dev git unzip gnupg libicu-dev librabbitmq-dev supervisor \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

RUN pecl install -o -f redis apcu amqp \
    && docker-php-ext-enable redis apcu amqp \
    && docker-php-ext-configure intl \
    && docker-php-ext-install zip intl

RUN bash -c "wget http://getcomposer.org/composer-stable.phar && mv composer-stable.phar /usr/local/bin/composer"
RUN chmod +x /usr/local/bin/composer
