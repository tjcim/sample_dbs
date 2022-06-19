# Sample Databases

## PostgreSQL

``` bash
docker build -f postgresql/Dockerfile -t tjcim/sample_dbs:postgres ./postgresql
docker run --rm -d --name sakila_postgres tjcim/sample_dbs:postgres
# if you want to open the port, do this instead
# docker run --rm -d -p 5432:5432 --name sakila_postgres tjcim/sample_dbs:postgres
docker exec -it sakila_postgres /bin/bash
psql
```

## MySQL

```bash
docker build -f mysql/Dockerfile -t tjcim/sample_dbs:mysql ./mysql
docker run --rm -d --name sakila_mysql tjcim/sample_dbs:mysql
# if you want to open the port, do this instead
# docker run --rm -d -p 3306:3306 --name sakila_mysql tjcim/sample_dbs:mysql
docker exec -it sakila_mysql /bin/bash
mysql -p  # password is mysql
```

Once the container is up login as root with the password `mysql`.

```bash
mysql -p  # password is mysql
```
