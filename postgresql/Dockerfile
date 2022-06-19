FROM postgres:latest

ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB sakila

COPY postgres-sakila-schema.sql /docker-entrypoint-initdb.d/01.sql
COPY postgres-sakila-insert-data.sql /docker-entrypoint-initdb.d/02.sql

USER postgres
WORKDIR /home/postgres
