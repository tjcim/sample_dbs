FROM postgres:latest

ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB sakila

COPY backup.sql /docker-entrypoint-initdb.d/backup.sql

EXPOSE 5432

USER postgres
WORKDIR /home/postgres
