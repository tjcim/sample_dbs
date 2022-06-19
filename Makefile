.PHONY: postgres mysql
.DEFAULT_GOAL := postgres

postgres:
	@echo "Building postgres"
	docker build -f postgresql/Dockerfile -t tjcim/sample_dbs:postgres ./postgresql
	docker push tjcim/sample_dbs:postgres

mysql:
	@echo "Building mysql"
	docker build -f mysql/Dockerfile -t tjcim/sample_dbs:mysql ./mysql
	docker push tjcim/sample_dbs:mysql
