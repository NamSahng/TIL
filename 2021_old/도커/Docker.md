# Docker

# 1. 도커 기본

---

## Docker란

---

**컨테이너**를 사용하여 응용프로그램을 더 쉽게 만들고 배포하고 실행할 수 있도록 설계된 도구 이며 **컨테이너** 기반의 오픈소스 가상화 플랫폼이며 생태계

- 컨테이너
    
    컨테이너는 코드와 모든 종속성을 패키지화하여 응용 프로그램이 한 컴퓨팅 환경에서 다른 컴퓨팅 환경으로 빠르고 안정적으로 실행되도록 하는 **소프트웨어의 표준 단위**다.
    
- 컨테이너 이미지
    
    **컨테이너 이미지**는 코드, 런타임, 시스템 도구, 시스템 라이브러리 및 설정과 같은 응용 프로그램을 실행하는 데 **필요한 모든 것을 포함**하는 가볍고 독립적이며 실행 가능한 **소프트웨어 패키지이**다. 
    
    **컨테이너 이미지는** 런타임에 컨테이너가 되고 도커 컨테이너의 경우 도커 엔진에서 실행될 때 이미지가 컨테이너가 된다. 리눅스와 윈도우 기반 애플리케이션 모두에서 사용할 수 있는 컨테이너화 된 소프트웨어는 인프라에 관계없이 항상 동일하게 실행된다.
    
    컨테이너는 소프트웨어를 환경으로부터 격리시키고 개발과 스테이징의 차이에도 불구하고 균일하게 작동하도록 보장한다.
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled.png)
    
- 예시
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%201.png)
    
    1. 도커 클라이언트에 다가 커맨드를 입력하니 클라이언트에서 도커 서버로 요청을 보냄
    
    2. 서버에서 hello-world라는 이미지가 이미 로컬에 cache가 되어 있는지 확인
    
    3. 현재는 없기에  Unable to find image ~라는 문구가 2번째 줄에 표시
    
    4. 그러면 Docker Hub이라는 이미지가 저장되어 있는 곳에 가서 그 이미지를 가져오고(Pull) 로컬에 Cache로 보관한다.
    
    5. 그 후 이제는 이미지가 있으니 그 이미지를 이용해서 컨테이너를 생성한다.
    
    6. 그리고 이미지로 생성 된 컨테이너는 이미지에서 받은 설정이나 조건에 따라 프로그램을 실행을 한다.
    

## Docker와 가상화 기술

---

- 기존 가상화 기술
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%202.png)
    
    ref. [https://ko.wikipedia.org/wiki/하이퍼바이저](https://ko.wikipedia.org/wiki/%ED%95%98%EC%9D%B4%ED%8D%BC%EB%B0%94%EC%9D%B4%EC%A0%80)
    
    - 하이퍼바이저
        
        호스트 컴퓨터에서 다수의 운영체제를 동시에 실행하기 위한 논리적 플랫폼
        
    - 네이티브 하이퍼바이저
        
        하이퍼바이저가 하드웨어를 직접 제어 → 자원 효율적으로 사용 가능하며, 별도의 호스트 OS가 없으므로 오버헤드가 적다. 하지만 여러 하드웨어 드라이버를 세팅해야 하므로 설치 어렵다.
        
    - 호스트형 하이퍼바이저
        
        일반적인 소프트웨어처럼 호스트 OS 위에서 실행되며, 하드웨어 자원을 VM 내부의 게스트 OS에 에뮬레이트(모방)하는 방식으로 오버헤드가 크다. 하지만 게스트 OS 종류에 대한 제약이 없고 구현이 다소 쉽다. 일반적으로 많이 이용하는 방법이다.
        

- 도커와 가상화 기술
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%203.png)
    
    - 공통점: 도커 컨테이너와 가상 머신은 기본 하드웨어에서 격리된 환경 내에 애플리케이션을 배치하는 방법이다.
    - 차이점: 컨테이너는 하이퍼바이저와 **게스트 OS**가 필요하지 않으므로 더 가볍다.
        
        애플리케이션을 실행할 때, 컨테이너 방식에서는 호스트 OS위에 애플리케이션의 실행 패키지인 이미지를 배포만 하면 된다. 기존가상화 방식은 VM을 띄우고 자원을 할당한 다음, 게스트 OS를 부팅하여 애플리케이션을 실행해야 해서 훨씬 복잡하고 무겁게 실행을 해야 한다.
        
        컨테이너 방식은 호스트와 다른 컨테이너와 **동일한 커널**을 공유한다. 기존 가상화 방식은 다른 VM만을 위한 커널을 새로 부팅하고, (다소 큰)운영체제 프로세스 세트를 시작한다. 기존 가상화 방식은 느리지만 사용방법이 간단하다는 것이다.
        

## Docker의 격리

---

- 격리가 가능한 이유
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%204.png)
    
    위 그림과 같이 컨테이너를 이용해 애플리케이션을 작동하는데 필요한 자원들만 설정해 격리한다. 리눅스의 커널에서 사용하는 Cgroup(control groups)과 네임스페이스 기술을 이용한다.
    
    - Cgroup
        
        CPU, 메모리, Network Bandwith, HD i/o 등 프로세스 그룹의 시스템 리소스 사용량을 관리
        
        → 어떤 어플이 사용량이 너무 많다면 그 어플리케이션 같은 것을 C group에 집어넣어서 CPU와 메모리 사용 제한 가능
        
    - Namespace
        
        하나의 시스템에서 프로세스를 격리시킬 수 있는 가상화 기술. 별개의 독립된 공간을 사용하는 것처럼 격리된 환경을 제공하는 경량 프로세스 가상화 기술
        
    
    내가 사용하는 컴퓨터가, 맥OS나 윈도우 서버를 사용하지만 docker version을 cmd창에 입력하면, 도커의 서버는 Linux/arm64를 사용하는 것을 알 수 있다. 도커 호스트는 아래와 같이 리눅스VM에서 작동하기 때문에 Cgroup과 Namespace기술을 사용할 수 있는 것이다.
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%205.png)
    

## 이미지로 컨테이너를 만들기

---

- 이미지를 컨테이너로 만드는 순서
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%206.png)
    
    이미지는 응용프로그램을 실행하기 위해 필요한 모든 것인 **명령어와 파일 스냅샷**(디렉토리와 파일을 카피한 것)으로 구성된다.
    
    도커 클라이언트에서 docker run hello-world를 입력하면, 컨테이너의 하드디스크에 스냅샷이 저장되고, 이미지가 갖고 있는 명령어를 컨테이너에게 넘겨, 컨테이너가 실행될 때 애플리케이션이 사용되도록 한다.
    

# 2. 기본적인 도커 클라이언트 명령어

---

- 이미지 내부 파일 시스템 구조 보기
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%207.png)
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%208.png)
    
    hello-world는 alpine 이미지 처럼 ls를 사용 가능하게 하는 파일이 없다.
    

- 실행중인 컨테이너 나열
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%209.png)
    
    `docker ps` : 실행중인 docker 컨테이너를 확인 가능 (ps: process status)
    
    `docker ps --format 'table{{.Names}} \t table{{.Image}}'` : 원하는 항목만 보기
    
    `docker ps -a` : 모든 컨테이너 나열
    

- 컨테이너 생명주기
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2010.png)
    
    - docker run <이미지 이름>
        
        docker create <이미지 이름> + docker start <컨테이너 id / 이름> 
        
    - 컨테이너 생성
        
        `docker create <이미지 이름>`
        
    - 컨테이너 시작
        
        `docker start -a <컨테이너 아이디>` : -a는 attach
        
        `docker start <컨테이너 아이디>` : 단순하게 컨테이너 아이디만 반환
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2011.png)
        
    - 컨테이너 중지
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2012.png)
        
        `docker stop <중지할 컨테이너 아이디/이름>` : 진행중인 작업을 완료(메시지를 보내고 있었다면 보내고 있던 메시지완료)하고 컨테이너를 중지 (gracefull). SIGTERM 신호를 보내고 SIGKILL 수행
        
        `docker kill <중지할 컨테이너 아이디/이름>` :  곧바로 SIGKILL 신호를 보냄
        
    - 컨테이너 삭제
        
        실행중인 컨테이너는 중지 후 삭제해야한다
        
        `docker ps -a` : 로 확인
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2013.png)
        
        `docker rm <아이디/ 이름>` : 컨테이너 삭제
        
        `docker system prune` : 사용하지 않는 컨테이너, 이미지, 네트워크 모두 삭제
        
        `docker rm 'docker ps -a -q'` : 모든 컨테이너 삭제
        
        `docker rmi <이미지 id>` : 이미지 삭제
        
    - 실행중인 컨테이너에 명령어 전달
        
        `docker exec <컨테이너 id> <명령어>`  : docker run <id> <명령어>와 출력은 같지만, run은 새로 컨테이너를 만들고 시작하고 명령어를 실행하고, exec은 실행중인 컨테이너에서 명령어만 전달한다.
        

- Redis를 이용한 컨테이너 이해
    
    Redis: "키-값" 구조의 비정형 데이터를 저장하고 관리하기 위한 [오픈 소스](https://ko.wikipedia.org/wiki/%EC%98%A4%ED%94%88_%EC%86%8C%EC%8A%A4) 기반의 비관계형 [데이터베이스 관리 시스템](https://ko.wikipedia.org/wiki/%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4_%EA%B4%80%EB%A6%AC_%EC%8B%9C%EC%8A%A4%ED%85%9C) (DBMS) (출처: wiki)
    
    - Docker에서 Redis 서버 실행 후, Redis 클라이언트에 접근해보자
        
        docker run redis
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2014.png)
        
        이 후에, `redis-cli`를 통해 접근하려고 하면 에러가 일어난다. 컨테이너 외부에서 레디스 서버에 접근하려고 하니 에러가 나기 때문에, Redis 클라이언트도 컨테이너 내부에서 실행해야한다.
        
        → `docker exec -it <컨테이너 아이디> redis-cli`
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2015.png)
        
        `-it`는 interactive terminal의 약자로 바로 나오지 않게 하기 위함이다.
        

- 실행중인 컨테이너 내부에서 터미널 사용하기
    
    `docker exec -it <컨테이너 id> sh` : 실행중인 컨테이너의 쉘환경으로 접근. control + D로 쉘환경에서 나올 수 있음. 이미지에 zsh bash powershell 등이 있다면 사용 가능하다.
    

# 3. 도커 이미지 만들기

---

컨테이너는 도커이미지로 만드는데 도커 이미지는 어떻게 만드는가.

- 도커 이미지 생성 순서
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2016.png)
    
    - 도커파일 작성
        
        도커 파일은 도커 이미지를 만들기 위한 설정 파일
        
        컨테이너가 어떻게 행동해야 하는지에 대한 설정을 정의
        
    - 도커 클라이언트
        
        도커 파일에 입력된 명령들이 도커 클라이언트에 전달되어야 한다.
        
    - 도커 서버
        
        도커 클라이언트에 전달된 모든 중요한 작업들을 하는 곳
        

- 도커파일 작성 순서
    
    이미지 = 시작시 실행할 명령어 + 파일 스냅샷
    
    1. 베이스 이미지를 명시해준다. (파일 스냅샷에 해당)
    
    2. 추가적으로 필요한 파일을 다운 받기 위한 몇 가지 명령어를 명시해준다. (파일 스냅샷에 해당)
    
    3. 컨테이너 시작 시 실행될 명령어를 명시해준다. (시작 시 실행될 명령어에 해당)
    
    - 베이스 이미지
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2017.png)
        
        이미지는 여러 레이어로 구성되어 있다. 레이어는 중간단계의 이미지이며, 베이스 이미지는 간단하게 레이어들이 실행되는 OS라고 보면된다. 위 이미지에 또 다른 레이어를 추가하는 것을 레이어 채싱이라 한다.
        
    - 실습
        - Dockerfile 기본 뼈대
            
            ```docker
            # 베이스 이미지 명시
            FROM baseImage
            
            # 추가적으로 필요한 파일 다운로드
            RUN command
            
            # 컨테이너 시작시 실행할 명령어 명시
            CMD ["executable"]
            ```
            
            `FROM <baseImage:version>` : version을 명시하지 않으면 가장 최신 것으로 다운. ex ubuntu:14.04
            
            `RUN <command>` : 도커이미지가 생성되기 전에 수행할 쉘 명령어
            
            `CMD [command]` : 컨테이너가 시작 할 때 실행할 실행 파이 또는 쉘 스크립트. DockerFile 내 1회만 사용 가능
            
        - hello world 출력하는 Dockerfile 예시
            
            ```docker
            # 베이스 이미지 명시
            FROM alpine
            
            # 추가적으로 필요한 파일 다운로드
            # RUN command
            
            # 컨테이너 시작시 실행할 명령어 명시
            CMD ["echo", "hello"]
            ```
            
            작성 이후, 도커파일을 도커 클라이언트에 전달해 도커 서버가 인식 가능하도록 하자.
            
            → cmd창에서 `docker build .`  또는 `docker build ./` 입력
            
            입력하면, alpine이미지의 스냅샷들을 임시컨테이너의 하드디스크에 추가하고, 시작 시 실행할 명령어를 추가한 뒤 임시컨테이너를 토대로 새로운 이미지를 생성한다.
            
            ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2018.png)
            
            ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2019.png)
            
            도커 이미지에 이름을 주려면, 태그 옵션(-t)을 추가한다.
            
            `docker build -t <도커허브아이디>/<저장소 or 프로젝트 이름>:<버전> ./`
            

# 4. 도커를 이용한 간단한 앱

---

![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2020.png)

- 포트 매핑
    
    `docker run -p <컨테이너 외부 포트>:<컨테이너 내부 포트> <이미지이름>` 
    
    위와 같이 포트 매핑을 해주지 않으면, 컨테이너 실행 시 접근이 되지 않는다. 컨테이너 외부에서 접근할 수 있는 포트를 매핑해 실행하면 접근 가능하다.
    
- Docker volume vs COPY
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2021.png)
    
    COPY는 호스트 디렉토리에 잇는 파일을 도커 컨테이너에 복사했다. 볼륨을 사용하면, 도커 컨테이너에서 호스트 디렉토리에 있는 파일을 참조한다.
    
    하지만, 호스트 디렉터리에는 node_modules와 같은 것이 설치되어있지 않다면, 해당 부분은 참조하지 말라고 명시하면 된다.
    
    `docker run -p 5050:8080 -v <참조 하지 않을위치> -v <참조 호스트 매핑 위치>:<컨테이너 매핑 위치> <도커 이미지 태그>`
    
    `docker run -p 5050:8080 -v /usr/src/app/node_modules -v $(pwd):/usr/src/app <도커 이미지 태그>`
    

# 5. Docker Compose

---

- Docker compose란
    
    다중 컨테이너 도커 애플리케이션을 정의하고 실행하기 위한 도구
    

- 실습
    
    Node컨테이너와 Redis 컨테이너를 이용해 페이지를 새로고침 할 때마다 0부터 1까지 계속 올라가는 앱을 만들어 보자.
    
    - 코드
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2022.png)
        
         `docker run redis` 를 통해 redis 서버 컨테이너를 작동한 뒤, 위의 노드 컨테이너를 build하면 에러가 발생한다.
        
        컨테이너간의 통신을 위해 docker-compose.yml을 아래와 같이 작성
        
        ```yaml
        version: "3"
        services:
          redis-server:
            image: "redis"
          node-app:
            build: .
            ports:
              - "5050:8080"
        ```
        
        - 실행: `docker compose up`  (이미지가 있다면, 다시 빌드하지 않음)
        - 중단: `docker compose down`
        - 백그라운드 실행: `docker compose -d up` (-d detach)
        - 코드 수정 이후: `docker compose up --build` (이미지가 있든 없든 build하고 컨테이들 실행)
        

# 6. 간단한 앱 실제 배포 & CI

---

- 리액트 설치
    
    `npx create-react-app ./`
    

- 리액트 앱 명령어 (로컬 환경)
    - 개발단계: `npm run start` 개발단계에서의 리액트 앱 실행
    - 테스트 단계: `npm run test` 테스트 단계에서 테스트 실행
    - 빌드 단계: `npm run build` 배포를 위한 폴더, 파일 생성

- 개발단계의 Dockerfile
    
    [Dockerfile.dev](http://Dockerfile.dev) 로 파일명을 지정한 후, build 할 때에는 
    
    `docker build -f Dockerfile.dev -t <이미지 태그>  .` 로 dockerfile 명시
    

- 컨테이너에서의 react app 실행
    
    이전의 노드앱와 마찬가지로, 포트매핑과 docker volume을 사용
    
    `docker run -it -p 3000:3000 -v /usr/src/app/node_modules -v $(pwd):/usr/src/app <이미지 이름>`
    
    → 로컬에서 코드 변경 시, 다시 빌드하지 않아도 컨테이너의 앱에 바로 반영
    
    → docker compose로 위 설정을 매번 입력하지 않아도 되게 설정
    
    ```yaml
    version: "3"
    services:
      react:
        build:
          context: .
          dockerfile: Dockerfile.dev
        ports:
          - "3000:3000"
        volumes:
          - /usr/src/app/node_modules
          - ./:/usr/src/app
        stdin_open: true
    ```
    

- 도커 환경에서 테스트
    
    `npm run test`  → `docker run -it <이미지 이름> npm run test`
    
    - test 코드가 변경될 때 바로 반영이되도록 volume과 compose 활용
        
        ```yaml
        version: "3"
        services:
          react:
            build:
              context: .
              dockerfile: Dockerfile.dev
            ports:
              - "3000:3000"
            volumes:
              - /usr/src/app/node_modules
              - ./:/usr/src/app
            stdin_open: true
          tests:
            build:
              context: .
              dockerfile: Dockerfile.dev
            volumes:
              - /usr/src/app/node_modules
              - ./:/usr/src/app
            command: ["npm", "run", "test"]
        ```
        
        위와 같이 compose 파일을 설정하면, 실행하는 컨테이너와 테스트하는 컨테이너가 동시에 수행하게 된다.
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2023.png)
        
        테스트 역시 변경하자마자 저장하면, 다시 테스트를 수행한다.
        
        ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2024.png)
        

- 운영환경에서의 도커
    - Nginx 서버
        
        운영환경 서버는 개발환경 서버와 다르게 Nginx나 Apache를 사용한다. 개발할 때, Nginx에서 사용하거나 운영할 때 일반 개발서버를 사용하면 왜 안되는가.
        
        개발서버에는 코드 변경 시 저장할 때 바로 반영해주는 기능과 같은 개발 환경에 특화된 것들이 많다. 운영서버에는 이러한 기능은 없다. 또한 운영서버는 개발에 필요한 기능들이 필요하지 않기 때문에 더 빠르고 운영에 특화되어 있기 때문에 사용한다.
        
        cf. [https://webinstory.tistory.com/entry/Apache-vs-Nginx-비교](https://webinstory.tistory.com/entry/Apache-vs-Nginx-%EB%B9%84%EA%B5%90)
        
         [youtube.com/watch?v=Zimhvf2B7Es](http://youtube.com/watch?v=Zimhvf2B7Es)
        
    - Dockerfile 설정
        
        운영환경에서의 Dockerfile은 Builder stage와 Run stage로 나뉜다.
        
        builder stage에서는 빌드파일을 생성하는 것을 목표로 하며, 생성된 파일과 폴더는 `/usr/src/app/build`에 위치한다.
        
        run stage에서는 nginx 이미지를 이용해 웹브라우저의 요청에 따라 정적인 파일을 제공한다. 이 때, builder에서 만들어진 파일을 바탕으로 제공할 것이기 때문에, 제공할 문서를 nginx에서 읽을 수 있는 위치인 `/user/share/nginx/html`로 복사한다.
        
        ```docker
        # Builder stage
        FROM node:alpine as builder
        WORKDIR '/usr/src/app'
        COPY package.json .
        RUN npm install
        COPY ./ ./
        RUN npm run build
        
        # run stage
        FROM nginx
        # aws에 배포할 때에는 아래와 같이 Nginx의 기본 포트 80포트를 명시한다.
        EXPOSE 80
        COPY --from=builder /usr/src/app/build /usr/share/nginx/html
        ```
        
        `docker build -t <이미지 이름> .`
        
        `docker run -p 8080:80 <이미지 이름>` : nginx의 기본 포트는 80 이다.
        

- Travis CI
    
    CI 서비스로 Github의 Public Repository를 자동으로 테스트하고 배포할 수 있다.
    
    ![Untitled](Docker%202446b645907d4aa1825a01b44c0c8711/Untitled%2025.png)
    
    - .travis.yml
        
        ```yaml
        # 관리자 권한 주기
        sudo: required
        
        # 언어(플랫폼) 선택
        language: generic
        
        # 도커 환경 구성
        services:
          - docker
        
        # 스크립트 실행 가능한 환경 구성
        before_install:
          - echo "start creating an image with dockerfile"
          - docker build -t namskygreen/react-app -f Dockerfile.dev .
        
        #  -- --coverage : test를 자세하게 보여줌
        # -e CI=true : travis가 작동하기 위한 추가 부분
        script:
          - docker run -e CI=true namskygreen/react-app npm run test -- --coverage
        
        # 완료 후 실행할 코드
        after_success:
          - echo "Test done"
        ```
        
    - AWS 서비스 간략 설명
        - EC2
        - Elastic Beanstalk
        - S3
            
            
        - IAM User (Identity and Access Management)
            - 루트 사용자: 현재 우리가 가입하여 사용하고 있는 AWS 계정. AWS의 서비스 및 리소스에 대한 모든 접근 권한 이 있음.
            - IAM User: 일상적인 작업이든 관리 작업이든 루트 사용자를 사용하는 방법은 보안 문제로 바람직하지 않다. IAM 유저를 사용. 루트 사용자가 부여한 권한만 갖고 있다.
            
            → IAM User를 만들어, Elastic Beanstalk 권한을 부여해 액세스 키와 비밀 액세스키를 받는다.
            
            이를 Traivis CI에 키를 입력한다.
            
        
        - AWS 서비스를 위한 .travis.yml 파일
            
            ```yaml
            sudo: required
            
            language: generic
            
            services:
              - docker
            
            before_install:
              - echo "start creating an image with dockerfile"
              - docker build -t namskygreen/react-app -f Dockerfile.dev .
            
            #  -- --coverage : test를 자세하게 보여줌
            # -e CI=true : travis가 작동하기 위한 추가 부분
            script:
              - docker run -e CI=true namskygreen/react-app npm run test -- --coverage
            
            # after_success:
            #   - echo "Test done"
            
            deploy:
              provider: elasticbeanstalk
              region: ap-northeast-2
              app: docker-react-app
              env: DockerReactApp-env
              # S3 는 elasticbeanstalk을 생성하면 자동으로 생성한다.
              bucket_name: elasticbeanstalk-ap-northeast-2-972153559337
              bucket_path: docker-react-app
              on:
                branch: master
              access_key_id: $AWS_ACCESS_KEY
              secret_access_key: $AWS_SECRET_ACCESS_KEY
            ```
            

## Reference

---

[https://www.inflearn.com/course/따라하며-배우는-도커-ci](https://www.inflearn.com/course/%EB%94%B0%EB%9D%BC%ED%95%98%EB%A9%B0-%EB%B0%B0%EC%9A%B0%EB%8A%94-%EB%8F%84%EC%BB%A4-ci)