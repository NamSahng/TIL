# DB

- **SQL & NoSQL**
    - 고려해야하는 점
        - 어떤 데이터 타입을 저장할 것인지
        - 얼마나 많은/자주 사용자와 데이터를 저장할 것인지
        - 데이터의 관계는 서로 어떻게 되며, 관계를 고려해 쿼리를 할 빈도는 어떻게 될 것인지
        - 확장성
        
        → 검색은 SQL이 유리, 빠른 insertion은 NoSQL이 유리
        
        수직적 확장(Scale up)이 예상되는 경우에는 SQL 사용
        
        수평적 확장(Scale Out)이 예상되는 경우에는 NoSQL 사용
        
        금융, 이커머스, CRM에서는 SQL을 주로 사용. 소셜 네트워크(그래프), 컨텐츠 관리 시스템(document), 실시간데이터 분석(wide column), 분산 캐시(Key-value)에서는 NoSQL을 사용. 보통 둘이 섞어서 사용
        
        cf) 수직적 확장: CPU, RAM 등의 부품이나 하드웨어 추가 / 교체 전체 성능 향상
        
        SQL은 테이블끼리 연관되어 있어, 수평적 확장이 어려움
        
        수평적 확장: 더 많은 서버를 추가해 데이터베이스를 전체적으로 분산하는 것
        
        수평적으로 확장해도 NoSQL의 응답속도는 보장
        
    - **SQL**
        
        RDBMS, 수직적 확장, 엄격한 스키마, 하이어라키컬 구조에 맞지 않음, 복잡한 질의에 유리
        
        - DB의 철학(성질): ACID(산성)
            
            Atomicity(원자성): 트랜잭션과 관련된 작업들이 부분적으로 실행되다가 중단되지 않는 것을 보장
            
            Consistency(일관성): 트랜잭션이 실행을 성공적으로 완료하면 언제나 일관성 있는 데이터베이스 상태로 유지 (트랜잭션 이 후 데이터 타입 등이 변하지 않음)
            
            Isolation(고립성): 트랜잭션을 수행 시 다른 트랜잭션의 연산 작업이 끼어들지 못하도록 보장
            
            Durability(지속성): 성공적으로 수행된 트랜잭션은 영원히 반영되어야 함
            
    - **NoSQL**
        
        분산데이터베이스, 수평적 확장, 동적 스키마, 하이어라키컬 구조에 맞음, 복잡한 질의에 불리
        
        기술의 장기적 부채가 될 가능성이 있음
        
        - DB의 철학(성질): BASE(염기, 끼워 맞춘거라는 평이 있음), 위의 C와 I를 포기
            
            BA(Basically Available): 데이터는 항상 접근 가능. 다수 스토리지 복사본 저장. (가용성)
            
            S(Soft-State): 관리하지 않으면 데이터가 만료될 수 있으며 (독립성)
            
            E(Eventually Consistency): 언젠가는 데이터는 일관성을 갖는다. (일관성)
            
- **CAP**
    
    ![Untitled](DB%20b23d4de0682940f488aa57e5ae71c054/Untitled.png)
    
    [https://blog.nahurst.com/visual-guide-to-nosql-systems](https://blog.nahurst.com/visual-guide-to-nosql-systems)
    
    Consistency(일관성): 고객은 항상 같은 데이터의 view를 봄.
    
    Availability(가용성): 고객은 항상 읽기와 쓰기를 할 수 있음.
    
    Partition tolerance(분할 허용): 시스템은 물리적 네트워크 분할에도 잘 작동함.
    
- **Transaction**
    
    데이터베이스와 DBMS의 인터렉션의 단위이며, 다른 트랜잭션과 무관하게 일관되고 신뢰할 수 잇는 방식으로 처리된다.
    
- **DB 인덱스**
    
    데이터베이스의 테이블의 동작 속도를 높여주는 자료구조. 테이블의 1개 이상의 컬럼을 이용해 생성하며, 메모리에 올려놓고, B트리계열이나 해시 자료구조를 사용하며, 항상 정렬된 상태를 유지하기 때문에 검색능력은 향상될 수 있으나 삽입, 삭제, 수정의 경우 속도가 저하될 수 있다.
    
- **ORM & ODM (Object Relational Mapping / Object Document Mapping)**
    
    관계형 DB나 document형 DB와 객체를 연결해주어 DB의 접근을 프로그래밍 언어의 관점으로 맞춘다.