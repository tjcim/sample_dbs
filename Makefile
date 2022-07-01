.PHONY: postgres mysql mssql
.DEFAULT_GOAL := postgres

REPO=tjcim/sample_dbs

postgres:
	@echo "Building postgres"
	docker build -f postgresql/Dockerfile -t ${REPO}:postgres ./postgresql
	docker push ${REPO}:postgres

mysql:
	@echo "Building mysql"
	docker build -f mysql/Dockerfile -t ${REPO}:mysql ./mysql
	docker push ${REPO}:mysql

mssql:
	@echo "Building mssql"
	docker build -f mssql/Dockerfile -t ${REPO}:mssql ./mssql
	docker push ${REPO}:mssql
