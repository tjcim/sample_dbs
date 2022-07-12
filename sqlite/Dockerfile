FROM debian:latest

RUN mkdir /app
WORKDIR /app
COPY database.db ./

RUN apt-get update && apt-get install -y sqlite3
CMD [ "sqlite3", "database.db" ]
