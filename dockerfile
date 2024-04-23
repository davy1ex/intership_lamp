# Этап 1
# Нужно локально развернуть два сайтика 
# (под доменами nsk.time.test и l-a.time.test) запускающих разные php cкрипты и выводящих 
# местное время в Новосибирске и Лос-Анджелесе соответственно. (Или любых других двух городах). 
# php+apache (virtual hosts) находятся в одном docker контейнере, оба файла сайта находятся в нём же.


FROM debian:buster

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    gnupg2 \
    wget

# Добавление GPG ключа и самого репозитория
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

# Обновление списка пакетов после добавления нового репозитория
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



# COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN a2enmod vhost_alias


COPY apache-config/ /etc/apache2/sites-available/


RUN a2ensite nsk.time.test.conf
RUN a2ensite l-a.time.test.conf


COPY src/ /var/www/


RUN mkdir -p /var/www/nsk /var/www/la
RUN chown -R www-data:www-data /var/www/nsk /var/www/la


EXPOSE 80


# Запускаем Apache в фоновом режиме
CMD ["apache2ctl", "-D", "FOREGROUND"]
