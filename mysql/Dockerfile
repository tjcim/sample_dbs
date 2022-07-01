FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD mysql
ENV MYSQL_DATABASE sakila

EXPOSE 3306

COPY backup.sql /docker-entrypoint-initdb.d/backup.sql
