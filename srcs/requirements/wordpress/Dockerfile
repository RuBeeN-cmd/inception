FROM debian:buster

RUN apt update && apt install -y curl php php-fpm dumb-init

RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
#RUN mv wordpress /var/www/html/
#RUN chown -R www-data:www-data /var/www/html/wordpress

EXPOSE 9000

ENTRYPOINT ["dumb-init", "--"]

CMD ["tail", "-f", "/dev/null"]
