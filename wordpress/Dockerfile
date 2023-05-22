FROM debian:buster

RUN apt update && apt install -y curl php

RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/www/html/
RUN chown -R www-data:www-data /var/html/wordpress

EXPOSE 9000

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
