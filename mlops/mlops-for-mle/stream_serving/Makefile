stream-server:
	docker compose -p part8-stream -f stream-docker-compose.yaml up -d

dashboard-server:
	docker compose -p part8-dashboard -f grafana-docker-compose.yaml up -d

stream-server-clean:
	docker compose -p part8-stream down -v
	docker rmi -f part8-stream-data-subscriber

dashboard-server-clean:
	docker compose -p part8-dashboard down -v
	docker rmi -f grafana/grafana

server:
	make stream-server
	make dashboard-server

server-clean:
	make stream-server-clean
	make dashboard-server-clean

dependency:
	make -C ../database_workflow/ server
	make -C ../api_serving/ server
	make -C ../kafka/ server

dependency-clean:
	make -C ../kafka/ server-clean
	make -C ../api_serving/ server-clean
	make -C ../database_workflow/ server-clean

all:
	make dependency
	make server

all-clean:
	make server-clean
	make dependency-clean

target-db-connection:
	PGPASSWORD=targetpassword psql -h localhost -p 5433 -U targetuser -d targetdatabase