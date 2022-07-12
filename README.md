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

MSSQL
```bash
docker run --rm -d --name sakila_mssql tjcim/sample_dbs:mssql
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
docker exec -it sakila_postgres psql
```

### MySQL

```bash
docker build -f mysql/Dockerfile -t tjcim/sample_dbs:mysql ./mysql
docker run --rm -d --name sakila_mysql tjcim/sample_dbs:mysql
# if you want to open the port, do this instead
# docker run --rm -d -p 3306:3306 --name sakila_mysql tjcim/sample_dbs:mysql
docker exec -it sakila_mysql mysql -pmysql -u root --host 127.0.0.1 --port 3306
```

### SQLite3

To create the database from the sql files create the database file `sqlite3 database.db`. Then read in the files:

```
.read schema.sql
.read insert.sql
```

### MSSQL

**Remember to have `GO` on a line by itself**

```bash
docker build -f mssql/Dockerfile -t tjcim/sample_dbs:mssql ./mssql
docker run --rm -d --name sakila_mssql tjcim/sample_dbs:mssql
# if you want to open the port, do this instead
# docker run --rm -d -p 1433:1433 --name sakila_mssql tjcim/sample_dbs:mssql
docker exec -it sakila_mssql /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P S@mpleDBs1 -d sakila
```

### GraphQL

```bash
docker build -f graphql/Dockerfile -t tjcim/sample_dbs:graphql ./graphql
docker run --rm -d --name graphql -p 4000:4000 tjcim/sample_dbs:graphql
```

Then visit [`http://localhost:4000`](http://localhost:4000)
