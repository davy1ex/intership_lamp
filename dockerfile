# Этап 1
# Нужно локально развернуть два сайтика 
# (под доменами nsk.time.test и l-a.time.test) запускающих разные php cкрипты и выводящих 
# местное время в Новосибирске и Лос-Анджелесе соответственно. (Или любых других двух городах). 
# php+apache (virtual hosts) находятся в одном docker контейнере, оба файла сайта находятся в нём же.

FROM php:7.4-apache


RUN a2enmod rewrite
RUN a2enmod vhost_alias


COPY apache-config/ /etc/apache2/sites-available/


RUN a2ensite nsk.time.test.conf
RUN a2ensite l-a.time.test.conf


COPY src/ /var/www/


RUN mkdir -p /var/www/nsk /var/www/la
RUN chown -R www-data:www-data /var/www/nsk /var/www/la


EXPOSE 80
