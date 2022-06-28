# Sample Databases

## Running the Docker Images

PostgreSQL
```bash
docker run --rm -d --name sakila_postgres tjcim/sample_dbs:postgres
```

MySQL
```bash
docker run --rm -d --name sakila_mysql tjcim/sample_dbs:mysql
```

## Building the Images Locally

### PostgreSQL

``` bash
docker build -f postgresql/Dockerfile -t tjcim/sample_dbs:postgres ./postgresql
docker run --rm -d --name sakila_postgres tjcim/sample_dbs:postgres
# if you want to open the port, do this instead
# docker run --rm -d -p 5432:5432 --name sakila_postgres tjcim/sample_dbs:postgres
docker exec -it sakila_postgres psql
```

### MySQL

```bash
docker build -f mysql/Dockerfile -t tjcim/sample_dbs:mysql ./mysql
docker run --rm -d --name sakila_mysql tjcim/sample_dbs:mysql
# if you want to open the port, do this instead
# docker run --rm -d -p 3306:3306 --name sakila_mysql tjcim/sample_dbs:mysql
docker exec -it sakila_mysql mysql -p  # password is mysql
```

[MSSQL](https://github.com/twright-msft/mssql-node-docker-demo-app)
[MSSQL](https://hub.docker.com/_/microsoft-mssql-server)

### SQLite3

To create the database from the sql files create the database file `sqlite3 database.db`. Then read in the files:

```
.read schema.sql
.read insert.sql
```
