## Stream Serving
- Kafka 파트와 동일한 Zookeeper, Broker, Connect, Schema Registry, Source Connector 사용.
- Sink Connector 를 대신해서 직접 Kafka Python SDK 를 이용하여 Consumer 구현.
- Source DB 에서 데이터를 받아 API 서버로 요청을 보내고, 모델의 예측 값을 받고, 받은 결과를 Target DB 에 삽입하는 과정을 담당하는 코드가 필요.

```bash
$ make dependency
$ docker compose -p part8-stream -f stream-docker-compose.yaml up -d
$ docker compose -p part8-stream down -v
$ docker rmi -f part8-stream_data-subscriber
```

```bash 
# cf. source DB 접속
$ docker exec -it data-generator /bin/bash
$ PGPASSWORD=mypassword psql -h postgres-server -p 5432 -U myuser -d mydatabase

```

### Grafana
- 멀티플랫폼 오픈 소스 애널리틱스 및 인터랙티브 시각화 웹 애플리케이션. 지원되는 데이터 소스에 연결할 때 웹의 차트, 그래프, 알람을 제공.
- 다양한 종류의 차트를 활용해 상황에 맞는 대시보드를 구현 가능.
- Dashboard
    - 페이지 자체를 구성하고 전체 대시보드 제목, 새로고침 주기, 패널이 시각화할 기간 등을 정할 수 있음.
- Panel
    - Dashboard 안에 포함되어있는 차트를 의미.
    - 차트 제목, 차트 종류, 데이터 소스와 쿼리 등을 설정 가능.
