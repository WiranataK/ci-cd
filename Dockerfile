# using this awesome prebuild images:
FROM '123majumundur/php-7.1-nginx:cicd'
LABEL maintainer="wiranatak99@gmail.com"

# install prestissimo for faster deps installation
RUN composer global require hirak/prestissimo

# install dependencies
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader

# copy codebase
COPY --chown=app:root . ./

# finish composer
# RUN composer dump-autoload
RUN composer dump-autoload --no-scripts --no-dev --optimize

EXPOSE 8080