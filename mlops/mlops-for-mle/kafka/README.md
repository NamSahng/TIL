## Kafka

### How to run

- Producer & Consumer
```bash
$ docker compose -p part7-naive -f naive-docker-compose.yaml up -d
# 토픽 생성
$ docker compose -p part7-naive exec broker kafka-topics --create --topic topic-test --bootstrap-server broker:29092 --partitions 1 --replication-factor 1
# 토픽 확인
$ docker compose -p part7-naive exec broker kafka-topics --describe --topic topic-test --bootstrap-server broker:29092
# Broker 컨테이너 접속
$ docker compose -p part7-naive exec broker /bin/bash
# Consumer 실행
$ kafka-console-consumer --topic topic-test --bootstrap-server broker:29092
# 새 터미널에서 Broker 컨테이너 접속
$ docker compose -p part7-naive exec broker /bin/bash
# Producer 실행 후 communicate 가능
$ kafka-console-producer --topic topic-test --broker-list broker:29092
$ docker compose -p part7-naive down -v
```
- Connect / Connector , Schema Registry
```bash
# 위에서는 Producer 와 Consumer client 를 통해 메시지 파이프라인을 쉽게 구성 가능했지만, 위 예제에서는 전달할 DB가 1개 였음.
# 전달할 DB 들이 100개, 1000개, 10000개로 늘어나면, Producer 와 Consumer 를 100개, 1000개, 10000개 만들어야 함.
# 메시지 파이프라인 구성을 위해 매번 Producer 와 Consumer 를 개발하는 것은 쉽지 않으며, 비슷한 데이터 시스템이 많아질 수록 
# Producer 와 Consumer 를 개발하는 데에는 비용도 계속 들고 반복 작업이 많아짐.
# 따라서, 더 간편하고 효율적으로 메시지 파이프라인을 구축하는 방법으로 Kafka 에서는 Connect 와 Connector를 사용.
# 추가 상세 설명: https://mlops-for-mle.github.io/tutorial/docs/kafka/connect-connector
# Connector는 Producer & Consumer를 만드는 것보다 설정파일만 있으면 개발 비용 없이 간단하게 띄울 수 .
# Source Connector는 Connector의 유형, 연결할 URL, user 와 password, 테이블 이름, 토픽의 파티션 수, Replication Factor 수 등을 설정해주면 Kafka Connect에서 인스턴스로 생성.
# Kafka의 Schema Registry는 불필요한 데이터 용량을 줄이고, Consume Fail과 같은 내부적 결합도 문제를 완화하기 위해 사용.
# cf) 결합도: https://ko.wikipedia.org/wiki/결합도
$ make -C ../database_workflow/ server
$ docker compose -p part7-kafka -f kafka-docker-compose.yaml up -d
$ docker compose -p part7-target -f target-docker-compose.yaml up -d

$ curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d @source_connector.json
$ curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d @sink_connector.json

$ docker compose -p part7-target down -v
$ docker compose -p part7-kafka down -v
$ make -C ../database_workflow/ server-clean
```

### Source & Target DB
- Source DB: 데이터가 계속해서 쌓이고 있는 외부 DB
- Target DB: 외부에서 가져온 데이터를 처리한 뒤 쌓이는 내부 DB

### 메시징 시스템 (Message System)
- 서로 다른 어플리케이션 (Application) 끼리 정보를 교환하기 위해 메시지의 생성, 전송, 전달 및 저장을 가능하게 하는 시스템
- 주로 하나의 어플리케이션이 여러 외부 어플리케이션이나 하나 이상의 데이터 소스로부터 데이터를 받는 어플리케이션에 의해 처리된 데이터를 전달받고 싶을 때 사용
- 메시지: 하나의 entity 에서 다른 하나의 entity 로 정보를 전송하는 데 사용되는 통신 아티팩트
- ex: Kafka, RabbitMQ, Active MQ, AWS SQS, Java JMS
- 장점:
    - 메시징 시스템은 메시지 생산자 (message producer) 와 메시지 소비자 (message consumers) 사이에 약한 결합성 (loose coupling) 을 갖도록 함
        - 약한 결합성이란 한 쪽이 끊기거나 변경이 있어도 다른 쪽에는 미치는 영향이 작은 것
    - 메시징 시스템을 이용할 경우 메시지 생산자와 소비자는 서로 모름
        - 동적, 신뢰성, 유연한 하위 어플리케이션의 구성 변경 
    - 확장성, 네트워크 사이 쉬운 통합성, 안정성

###  용어
- Message Oriented Middleware (MOM)
    - 독립된 애플리케이션 간에 데이터를 주고받을 수 있도록 하는 시스템 디자인
        - 함수 호출, 공유메모리 등의 방식이 아닌, 메시지 교환을 이용하는 중간 계층에 대한 인프라 아키텍처
        - 분산 컴퓨팅이 가능해지며, 서비스간의 결합성이 낮아짐
- 비동기 (asynchronous) 로 메시지를 전달함
- Queue, Broadcast, Multicast 등의 방식으로 메시지를 전달함
- Publish/Subscribe (Pub/Sub) 구조
    - 메시지를 발행하는 Publisher, 메시지를 소비하는 Subscriber 로 구성
- Message Broker
- 메시지 처리 또는 메시지 수신자에게 메시지를 전달하는 시스템이며, 일반적으로 MOM 을 기반으로 구축됨
- Message Queue (MQ)
- Message Broker 와 MOM 을 구현한 소프트웨어 (RabbitMQ, ActiveMQ, Kafka 등)
- Advanced Message Queueing Protocol (AMQP)
- 메시지를 안정적으로 주고받기 위한 인터넷 프로토콜
- MOM 은 메시지 전송 보장을 해야하므로 AMQP 를 구현함
- `Kafka` 는 AMQP를 구현한 MOM 시스템

### Kafka 
- Open-source Distributed Event Streaming Platform
- Event Streaming: 데이터베이스, 센서, 모바일기기, 어플리케이션 등과 같은 곳에서 발생하는 데이터를 event stream 형태로 저장해서 나중에 검색할 수 있도록 하는 것. 발생하는 데이터를 실시간으로 처리하고, 필요에 따라서 데이터가 또 다른 target 시스템으로 event stream 을 라우팅 해주는 것
- 주요 특징
    - Event Streaming Platform
        - Event stream 을 실시간으로 처리하고 계속 쌓이는 데이터를 지속적으로 보관하다가 그 데이터를 쓰려고 하는 다른 target 시스템들이 가져갈 수 있도록 제공
    - Publish/Subscribe (Pub/Sub) 구조
        - 다른 시스템에서 데이터를 가져와서 Kafka 에 publish (발행, 저장)하거나 Kafka 로부터 데이터를 subscribe (구독, 읽기) 할 수 있는 기능을 제공
    - Decoupling :
        - Kafka 에서는 Pub/Sub 구조를 구현하기 위해 Producer 와 Consumer 가 존재. 두 객체는 서로 의존적이지 않고 완벽하게 분리
            - Producer : Kafka 에 event 를 publish 하는 client application
            - Consumer : Kafka 로부터 event 를 subscribe 하는 client application

### 카프카 아키텍처 & 컴포넌트
- <img src="https://mlops-for-mle.github.io/tutorial/assets/images/kafka-4-0e5191358d1f14ab2306edc2fb21fe26.png" width="460" height="300" >
- [출처](https://velog.io/@jwpark06/Kafka-%EC%8B%9C%EC%8A%A4%ED%85%9C-%EA%B5%AC%EC%A1%B0-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0) 
- Broker
    - 메시징 서비스를 담당해주는 Kafka 서버 또는 Kafka 시스템. 하나의 브로커는 하나의 Kafka Broker Process. 
    - 흔히 말하는 “Kafka 를 구성한다” 혹은 ”Kafka 를 통해 메시지를 전달한다” 에서 Kafka 는 브로커를 의미
- Kafka Cluster
    - 여러 개의 브로커로 이루어진 집합체. 일반적으로 최소 3대 이상의 브로커를 하나의 클러스터로 구성
- Topic
    - 브로커에서 event (data) 를 관리하는 “기준” 또는 어떤 event 를 저장할 지를 정하는 “주제” 
    - 토픽은 파일 시스템의 “폴더” 와 같고, event 는 폴더 속의 “파일”
    - 전통적인 메시징 시스템과는 다르게 message (event) 들을 subscribe 해서 받아보더라도 그 메시지는 삭제되지는 않음
    - 대신 토픽마다 지정된 기준에 따라 event 를 유지할 지 정할 수 있는데, 이 때 설정된 기간 또는 용량에 따라 event 를 유지.
- Partition
    - 토픽에는 파티션 (Partition) 이 존재하며 모든 파티션들은 Producer 로부터 전달된 데이터를 보관하는 역할
    - 파티션은 반드시 존재하는 리더 파티션 (Leader Partition) 과 존재할 수도 있는 팔로워 파티션 (Follower Partition) 으로 구분
        - 리더 파티션
            - Producer 또는 Consumer 와 직접 통신하는 파티션.
            - Producer 또는 Consumer 와 직접 통신함으로써 read 와 write 연산을 담당.
        - 팔로워 파티션
            - Producer 에 의해 리더 파티션으로 전달된 데이터를 복제하여 저장.
            - 팔로워 파티션의 가장 중요한 역할은 리더 파티션의 데이터를 복사하여 보관하는 역할을 하고 있다가 리더 파티션이 속해있는 브로커에 장애가 발생하면, 팔로워 파티션이 리더 파티션의 지위를 가지게 됨.
    -  파티션과 팔로워 파티션의 개수는 Replication Factor 의 수에 따라 달라짐. 브로커 A, B, C 가 있다고 가정할 때,
        - 파티션의 Replication Factor 가 1인 경우 (복제 없음)
            - Replication Factor 가 1 이므로 브로커 A 의 리더 파티션의 데이터를 복제해서 가지고 있을 브로커 B, C 의 팔로워 파티션이 없음.
            - 즉, 브로커 A 에만 리더 파티션이 존재. 브로커 A 의 파티션이 3개였다면, 3개 모두 리더 파티션이 됨.
        - 파티션의 Replication Factor 가 3인 경우 (복제 2개)
            - Replication Factor 가 3 이므로 브로커 A 의 리더 파티션의 데이터를 복제해서 가지고 있을 브로커 B, C 의 팔로워 파티션이 존재.
            - 브로커 A 의 파티션이 3개였다면, A, B, C 는 각각 하나의 리더 파티션과 두개의 팔로워 파티션을 가지게 됨.
- Zookeeper
    - 분산 시스템에서 시스템 간의 정보 유지, 상태 체크, 서버들 간의 동기화 등을 처리해주는 분산 코디네이션 서비스 (Distributed Coordination Service)
    - 주키퍼는 직접 어플리케이션 작업을 조율하지 않고, 조율하는 것을 쉽게 개발할 수 있도록 도와줌
    - API 를 이용하여 동기화를 하거나 마스터 선출 등의 작업을 쉽게 구현할 수 있게 해줌
    - 주키퍼의 데이터는 분산 작업을 제어하기 위해 트리 형태의 데이터 저장소에 스냅샷을 저장
    - Zookeeper Ensemble
        - 위의 그림에서 주키퍼 앙상블 (Zookeeper Ensemble) 이란 주키퍼 서버의 클러스터를 뜻함.
        - 하나의 주키퍼 서버에 문제가 생겼을 경우, 주키퍼 서버들에 쌓이는 데이터를 기준으로 일관성을 맞추기 때문에 클러스터는 보통 홀수로 구축하며 최소 3개로 구축해야하며 일반적인 경우라면 5개를 권장
        - 주키퍼에서도 파티션처럼 하나의 리더 서버가 있고, write 를 담당. 나머지 팔로워 서버가 있고, read 를 담당.
- Producer & Consumer
    - Producer
        - "메시지를 생산" 해서 브로커의 토픽으로 메시지를 보내는 역할을 하는 어플리케이션 또는 서버
        - 데이터를 전송할 때 리더 파티션을 가지고 있는 브로커와 직접 통신. 원하는 토픽의 파티션에 전송만하며 이후에 어떤 Consumer 에게 전송되는 지는 신경쓰지 않음.
        - 마치 우체원이 우편함에 편지를 넣듯 프로듀서는 메세지를 저장만 함.
    - Consumer
        - 토픽의 파티션에 저장되어 있는 "메시지를 소비" 하는 역할을 하는 어플리케이션 또는 서버
        - 데이터를 요청할 때 리더 파티션을 가지고 있는 브로커와 통신하여 토픽의 파티션으로부터 데이터를 가져 감.
        - Consumer 의 운영 방법은 2가지
            - 토픽의 특정 파티션만 구독하는 Consumer 를 운영
            - 1개 이상의 Consumer 로 이루어진 Consumer 그룹을 운영
        - Consumer 역시 어떤 Producer 에게서 메시지가 왔는지는 관심이 없고, 원하는 토픽의 파티션을 읽어서 필요한 메시지만 받음. 마치 우편을 받을 때 어떤 우체원에게서 왔는지는 모르고, 우편함에 있는 편지만 가져가는 것처럼 메세지를 구독만 함.




