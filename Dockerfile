FROM yiwang666/lamp
MAINTAINER YiWanG <admin@yiwang6.cn>

COPY src/www.zip /tmp/www.zip
COPY src/123phpshop.sql /tmp/123phpshop.sql

RUN apt-get install -y unzip

WORKDIR /tmp
RUN set -x \
    && rm -rf /var/www/html/* \
    
 
    

COPY src/start.sh /start.sh
RUN chmod a+x /start.sh

EXPOSE 80
CMD ["/start.sh"]
