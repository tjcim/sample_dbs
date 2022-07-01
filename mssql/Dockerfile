FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

ENV ACCEPT_EULA y
ENV SA_PASSWORD S@mpleDBs1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY entrypoint.sh /usr/src/app/entrypoint.sh
COPY import-data.sh /usr/src/app/import-data.sh
RUN chmod +x /usr/src/app/import-data.sh
COPY sakila.bak /usr/src/app/sakila.bak

EXPOSE 1433

USER mssql
ENTRYPOINT /bin/bash /usr/src/app/entrypoint.sh
