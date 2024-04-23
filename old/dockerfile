# - Этап 2
# - Переделать реализацию так, чтобы тот же самый результат можно было получить, используя один домен, но разные url path (time.test/l-a и time.test/nsk).
# - При этом нужно использовать предыдущие два php скрипта (с этапа 1) без изменений, добавив маршрутизацию на уровне php.
# - Для чего настроить “Single entry”, чтобы все запросы перенаправлялись во “входной скрипт”.
# - При переходе на домен с пустым url исполнять нужно тот скрипт, который показывает время в одном из городов на ваш выбор.

# - С помощью postgre сохранять все случаи захода на сайт с указанием домена.
# - На странице под временем выводить лог предыдущих посещений.
# - Установить phpstorm+xdebug, убедиться в нормальном функционировании дебага.
# - Среда должна быть сконфигурирована с помощью docker-compose и использовать минимум 3 контейнера - с postgre, php-fpm и nginx


FROM debian:buster

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    gnupg2 \
    wget

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN apt-get update

RUN apt-get install -y \
    apache2 \
    libapache2-mod-php7.4 \
    php7.4 \
    php7.4-cli \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-imap \
    php7.4-json \
    php7.4-xml \
    php7.4-mbstring \
    php7.4-zip \
    php7.4-soap \
    php7.4-ldap \
    php7.4-apcu



RUN a2enmod rewrite
RUN a2enmod vhost_alias


COPY apache-config/ /etc/apache2/sites-available/


RUN a2ensite timetest.conf

COPY src/ /var/www/time


RUN mkdir -p /var/www/nsk /var/www/la
RUN chown -R www-data:www-data /var/www/nsk /var/www/la


EXPOSE 80


# Запускаем Apache в фоновом режиме
CMD ["apache2ctl", "-D", "FOREGROUND"]
