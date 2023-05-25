FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y mariadb-server

EXPOSE 3306

RUN mkdir -p /var/lib/mysql

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
