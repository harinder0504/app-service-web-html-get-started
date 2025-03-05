FROM ubuntu
RUN apt update -y
RUN apt install apache2 -y
COPY . /var/www/html/
ENTRYPOINT apachect1 -D FOREGROUND
