FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD mysql
ENV MYSQL_DATABASE sakila

COPY sakila-schema.sql /docker-entrypoint-initdb.d/01.sql
COPY sakila-data.sql /docker-entrypoint-initdb.d/02.sql
