FROM yiwang6/lamp
MAINTAINER YiWanG <admin@yiwang6.cn>

COPY src/www.zip /tmp/www.zip
COPY src/123phpshop.sql /tmp/123phpshop.sql

RUN apt-get install -y unzip

WORKDIR /tmp
RUN set -x \
    && rm -rf /var/www/html/* \
    && unzip -x /tmp/www.zip \
    && cp -r /tmp/* /var/www/html/ \
    && /etc/init.d/mysql start \
    && mysql -e "CREATE DATABASE 123phpshop DEFAULT CHARACTER SET utf8;" -uroot -p \
    && mysql -e "use 123phpshop;source /tmp/123phpshop.sql;" -uroot -p \
    && rm -rf /tmp/* \
    && chown -R www-data:www-data /var/www/html

COPY src/start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 80
CMD ["/start.sh"]
