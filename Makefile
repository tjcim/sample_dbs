.PHONY: postgres mysql
.DEFAULT_GOAL := postgres

REPO=tjcim/sample_dbs

postgres:
	@echo "Building postgres"
	docker build -f postgresql/Dockerfile -t ${REPO}:postgres ./postgresql
	docker push tjcim/sample_dbs:postgres

mysql:
	@echo "Building mysql"
	docker build -f mysql/Dockerfile -t ${REPO}:mysql ./mysql
	docker push tjcim/sample_dbs:mysql
