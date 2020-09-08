ARG PHP_VERSION=7.3

FROM php:${PHP_VERSION}-fpm

# Set defaults for variables used by run.sh
ENV COMPOSER_HOME=/tmp/.composer

RUN apt-get update -q -y \
  && apt-get install -q -y --no-install-recommends imagemagick

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN install-php-extensions \
    bcmath \
    exif \
    gd \
    igbinary \
    imagick \
    intl \
    mbstring \
    memcached \
    mcrypt \
    mysqli \
    pdo_mysql \
    redis \
    soap \
    xsl \
    zip \
  && docker-php-ext-enable opcache \
  && cp ${PHP_INI_DIR}/php.ini-production ${PHP_INI_DIR}/php.ini

# Set timezone
RUN echo "UTC" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN set -eux; \
	composer global require "hirak/prestissimo:^0.3" --prefer-dist --no-progress --no-suggest --classmap-authoritative; \
	composer clear-cache
ENV PATH="${PATH}:/root/.composer/vendor/bin"

# As application is put in as volume we do all needed operation on run
COPY ./docker/php/scripts /scripts

# Add some custom config
COPY ./docker/php/conf.d/php.ini ${PHP_INI_DIR}/conf.d/php.ini

RUN chmod 755 /scripts/*

WORKDIR /var/www

CMD php-fpm
