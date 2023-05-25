FROM debian:buster

RUN apt update && apt install -y curl php7.3-fpm php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-soap php7.3-zip php7.3-bcmath dumb-init default-mysql-client

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["dumb-init", "--"]

ENTRYPOINT ["/entrypoint.sh"]
