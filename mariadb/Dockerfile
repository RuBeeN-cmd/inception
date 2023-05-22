FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
