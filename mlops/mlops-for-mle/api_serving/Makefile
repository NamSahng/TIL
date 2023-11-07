app:
	uvicorn app:app --reload

server:
	docker compose up -d

server-clean:
	docker compose down -v
	docker rmi -f part6-api-with-model

dependency:
	make -C ../database_workflow/ server
	make -C ../model_registry/ server
	python ../model_registry/save_model_to_registry.py

dependency-clean:
	make -C ../model_registry/ server-clean
	make -C ../database_workflow/ server-clean

all:
	make dependency
	make server

all-clean:
	make server-clean
	make dependency-clean