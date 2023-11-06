server:
	docker compose up -d

server-clean:
	docker compose down -v
	docker rmi -f part3-mlflow-server minio/minio

dependency:
	make -C ../database_workflow/ server

dependency-clean:
	make -C ../database_workflow/ server-clean

all:
	make dependency
	make server

all-clean:
	make server-clean
	make dependency-clean