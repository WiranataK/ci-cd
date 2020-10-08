# using this awesome prebuild images:
FROM 'WiranataK/ci-cd:ci-cd'
MAINTAINER Anak Agung Gede Wiranata Kencana <wiranatak99@gmail.com>

# install prestissimo for faster deps installation
RUN composer global require hirak/prestissimo

# make directory for hosting apps
RUN mkdir /home/app/app
WORKDIR /home/app/app

# install dependencies
COPY composer.json composer.json
RUN composer install --prefer-dist --no-script --no-dev --no-autoloader && rm -rf /home/app/.composer

# copy codebase
COPY --chown=app:root . ./

# finish composer
# RUN composer dump-autoload
RUN composer dump-autoload --no-script --no-dev --optimize

EXPOSE 8080