FROM debian:buster

RUN mkdir -p /etc/ssl/

COPY private.key /etc/ssl/private.key
COPY certificate.crt /etc/ssl/certificate.crt

RUN apt-get update && apt-get install -y nginx

COPY nginx.conf /etc/nginx/conf.d/.

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
