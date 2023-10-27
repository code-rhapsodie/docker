FROM php:7.4-fpm

RUN curl -fsSL https://deb.nodesource.com/setup_10.x | bash \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y wget libzip-dev git unzip libpng-dev libicu-dev libxslt-dev poppler-utils imagemagick \
      fontconfig xfonts-75dpi xfonts-base \
      libxpm-dev libfreetype6-dev libjpeg62-turbo-dev mariadb-client \
      nodejs npm yarn \
    && apt-get install -y libmagickwand-dev --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ --with-xpm=/usr/include/ --enable-gd-jis-conv \
    && docker-php-ext-install zip pdo mysqli gd pdo_mysql intl xsl bcmath sockets pcntl \
    && pecl install redis -o -f && docker-php-ext-enable redis && pecl install apcu && docker-php-ext-enable apcu \
    && printf "\n" | pecl install imagick && docker-php-ext-enable imagick
