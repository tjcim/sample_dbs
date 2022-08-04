# Sample Databases

## Running the Docker Images

PostgreSQL
```bash
docker run --rm -d --name postgres tjcim/sample_dbs:postgres
docker exec -it postgres psql -d sakila
```

MySQL
```bash
docker run --rm -d --name mysql tjcim/sample_dbs:mysql
# MySQL will take maybe 30 seconds before it is ready. Monitor the progress with `docker logs -f mysql`
docker exec -it mysql mysql -pmysql -u root -D sakila
```

MSSQL
```bash
docker run --rm -d --name mssql tjcim/sample_dbs:mssql
docker exec -it mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P S@mpleDBs1 -d sakila
```

**NOTE:** `sqlcmd` will only run the SQL commands when you have `GO` on a line by itself. For example to select all rows from the actor table:

```sql
select * from actor;
go
```

GraphQL
```bash
docker run --rm -d --name graphql -p 4000:4000 tjcim/sample_dbs:graphql
```

sqlite
```bash
docker run --rm -it --name sqlite tjcim/sample_dbs:sqlite
```

## Building the Images Locally

Clone the repo and then `cd` into it:

```bash
git clone https://github.com/tjcim/sample_dbs.git
cd sample_dbs
```

### PostgreSQL

``` bash
docker build -f postgresql/Dockerfile -t tjcim/sample_dbs:postgres ./postgresql
docker run --rm -d --name sakila_postgres tjcim/sample_dbs:postgres
# if you want to open the port, do this instead
# docker run --rm -d -p 5432:5432 --name sakila_postgres tjcim/sample_dbs:postgres
docker exec -it postgres psql
```

### MySQL

```bash
docker build -f mysql/Dockerfile -t tjcim/sample_dbs:mysql ./mysql
docker run --rm -d --name sakila_mysql tjcim/sample_dbs:mysql
# if you want to open the port, do this instead
# docker run --rm -d -p 3306:3306 --name sakila_mysql tjcim/sample_dbs:mysql
docker exec -it mysql mysql -pmysql -u root -D sakila
```

### SQLite3

```bash
docker build -f sqlite/Dockerfile -t tjcim/sample_dbs:sqlite ./sqlite
docker run --rm -it --name sqlite tjcim/sample_dbs:sqlite
```

### MSSQL

**Remember to have `GO` on a line by itself**

```bash
docker build -f mssql/Dockerfile -t tjcim/sample_dbs:mssql ./mssql
docker run --rm -d --name sakila_mssql tjcim/sample_dbs:mssql
# if you want to open the port, do this instead
# docker run --rm -d -p 1433:1433 --name sakila_mssql tjcim/sample_dbs:mssql
docker exec -it mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P S@mpleDBs1 -d sakila
```

### GraphQL

```bash
docker build -f graphql/Dockerfile -t tjcim/sample_dbs:graphql ./graphql
docker run --rm -d --name graphql -p 4000:4000 tjcim/sample_dbs:graphql
```

Then visit [`http://localhost:4000`](http://localhost:4000)

## Oracle Express Edition (XE)

Since there is already a good example here: [https://hub.docker.com/r/gvenzl/oracle-xe](https://hub.docker.com/r/gvenzl/oracle-xe) I have just included the steps I take.

**Keep in mind:**
* The container image is *very* large.
* The container will take a minute before it is ready.
* This does not use the sakila database.

Run the following **from the `oracle` directory**.
```
docker run --rm -d --name oracle -e ORACLE_PASSWORD=oracle -v $(pwd):/container-entrypoint-initdb.d gvenzl/oracle-xe:latest
```

It is going to take a minute for the DB to be ready. Monitor progress with `docker logs -f oracle`.

Once the database is ready, connect to it with this:
```
docker exec -it oracle sqlplus test/test@//localhost/XEPDB1
```
