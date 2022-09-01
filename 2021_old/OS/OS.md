# OS

- 시작
    
    컴퓨터 구조: 하드웨어의 출발점
    
    운영체제: 컴퓨터 소프트웨어 + 하드웨어의 출발점
    
    자료구조가 왜 중요한지 알 수 있음
    
    ex. 큐, 스택
    
    시스템/소프트웨어를 어떻게 효율적으로 개발할 수 있을지도 생각할 수 있음
    

## 1강 운영체제 큰 그림

- 운영체제의 역할
    
    시스템 자원 관리자
    
    사용자와 컴퓨터간 커뮤니케이션 지원 (쉘이 지원)
    
    컴퓨터 하드웨어와 프로그램을 제어
    
- 시스템 자원
    
    CPU, 메모리(DRAM, RAM)
    
    입출력장치(네트워크(데이터 전송 등), 모니터, 키보드...)
    
    저장매체: SSD, HDD
    
- 현대 운영체제 기술의 최초 운영체제 : UNIX
    
    리눅스와 사용법이나 OS 구조가 유사함
    
- 역할 3
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled.png)
    

## 2강 운영체제와 큰 그림과 응용프로그램

- 프로그램 = 소프트웨어
- 소프트웨어 = 운영체제, 응용프로그램
- 응용프로그램 = Application(통상 PC의) = App(통상 스마트폰의)
- 응용프로그램 관리란
    
    응용프로그램을 실행, 
    
    응용프로그램간의 권한을 관리
    
    응용프로그램 사용하는 사용자 관리
    
- 응용프로그램에서 발생할 수 있는 문제점
    
    → 비정상적 행동 무한 루프, 프로그램의 다운, 파일 임의 삭제(권한/사용자 관리), 응용프로그램의 CPU 관리
    
- 운영체제의 목표: 사용자가 사용하는 응용프로그램이 효율적으로 적절하게 동작하도록 지원. 응용프로그램이 요청하는 시스템 리소스를 효율적으로 분배하고 지원하는 소프트웨어.
- 운영체제는 어디에 있나
    
    HDD or SSD 에 설치, 운영체제도 응용프로그램이기 때문에 컴퓨터를 키면 메모리에 올라가게 되어 실행이 됨. cf) 폰노이만 구조 (현대 컴퓨터의 구조)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%201.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%201.png)
    

## 3강 운영체제 구조 - 시스템 콜

- 쉘:
    
    사용자가 운영체제 기능과 서비스를 조작할 수 있도록 인터페이스를 제공하는 프로그램
    
    종류: 터미널환경(CLI)과 GUI 환경 으로 분류
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%202.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%202.png)
    
    쉘도 응용프로그램. 사용자와 OS를 통신을 담당.
    
    쉘은 응용프로그램을 위해서도 인터페이스를 제공한다.
    
    이것을 API라고 함. (Application Programming Interface)
    
    함수로 제공
    
    함수가 많아서 라이브러리 형태로 제공 (파이썬의 라이브러리보다는 보통 C library로 보는 것이 맞음)
    
    ex. GNU c library: [https://www.kernel.org/doc/man-pages/](https://www.kernel.org/doc/man-pages/)
    
    API: 요청서의 집합. Application, shell 모두 OS의 자원을 사용하기 위해서는 API로 요청함.
    
- 시스템 콜:
    
    시스템 호출 인터페이스라고도 함
    
    운영체제가 운영체제 각 기능을 사용할 수 있도록 시스템 콜이라는 명령함수를 제공
    
    API 내부에 시스템콜 호출하는 형태로 만들어지는 경우가 많음
    
    (시스템콜을 직접 구현 및 사용하기는 어려워서)
    
- 운영체제를 만든다면
    
    운영체제(커널)을 개발
    
    시스템 콜 개발
    
    C API(library) 개발
    
    쉘 프로그램 개발
    
- 시스템콜을 정의하는 예시
    
    가장 유명한 것이 POSIX API: Linux는 대부분 이 API를 기반으로 함(윈도우 빼고, UNIX, 맥)
    

## 4강 스케줄링 - 배치처리, 멀티태스킹, 멀티 프로세싱, 시분할 시스템

- 배치 처리 시스템:
    
    큐와 같이 FIFO로 처리
    
    → 문제점: 응답시간이 긴 문제, 동시 프로그래밍, 다중 사용자(입출력장치 지원)
    
- 시분할 시스템
    
    응용프로그램이 CPU 점유 시간을 잘게 쪼개어 실행될 수 있도록 하는 시스템
    
- 멀티 태스킹:
    
    단일 CPU에서 여러 응용프로그램이 실행되는 것처럼 보이도록 하는 시스템
    
    실제 멀티태스킹은 0.01~0.02sec 단위로 실행 응용프로그램이 바뀜 → 동시에 사용하는 것 처럼 보임
    
- 멀티 태스킹과 멀티 프로세싱의 차이
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%203.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%203.png)
    
    여러 CPU가 하나 또는 이상의 프로그램을 병렬로 실행해 실행속도를 극대화하는 시스템
    

## 5강 운영체제 구조: 사용자 모드와 커널 모드

- CPU Protection Rings
    
    CPU에게 권한 모드가 있음. 
    
    사용자 모드: 사용자가 사용함
    
    커널 모드: OS가 사용함
    
    커널 모드는 특권 명령어 실행과 원하는 작업 수행을 위한 자원 접근을 가능하게하는 모드이다. 코드 레벨로 이해하기는 비트 내용이 들어가 어렵다.
    
    Intel CPU 기준: Ring 0 을 커널 모드 Ring 3을 사용자 모드라 함
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%204.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%204.png)
    
    커널이란 씨앗 커널이란 껍데기라는 뜻을 갖고 있다.
    
    어떤 영역이 커널에서 실행되는 것인가
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%205.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%205.png)
    
- 시스템 콜은 커널 모드로 실행됨
    
    커널 모드에서만 실행 가능한 기능들이 있음
    
    응용프로그램이 커널 모드로 실행하려면, 반드시 시스템 콜에서 커널모드를 거쳐 CPU를 사용함
    
    시스템콜은 운영체제가 제공하도록 구현되어야 함
    
    즉 커널모드가 동사무소 직원임 셈(민증을 발급할 때)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%206.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%206.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%207.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%207.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%208.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%208.png)
    

cf) 응용 프로그래머와 시스템 프로그래머

![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%209.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%209.png)

## 6강 스케줄링: 멀티 프로그래밍

- 멀티 프로그래밍
    
    최대한 CPU를 많이 활용하도록 하는 시스템.
    
    ex. 데이터를 읽을 때, 저장매체로 가는 속도와 CPU의 처리 속도
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2010.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2010.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2011.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2011.png)
    
    CPU와 저장매체가 시스템 버스 상에서 너무 멀어 DMA에 요청하고 이 후에 응답받음
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2012.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2012.png)
    

## 7강~8강 프로세스와 스케줄러의 이해 - 스케줄링 알고리즘 기본

- 프로세스란
    
    실행중인 프로그램은 프로세스
    
    폰노이만의 구조: 모든 코드는 메모리에 올려지고, 한 줄씩 CPU에 넣어지는 구조
    
    코드 이미지(바이너리)는 실행파일이라하며, 예를 들어 리눅스는 ELF format으로 구성됨
    
    프로세스라는 용어는 작업, 태스크, 잡이라는 용어와 혼용됨
    
    응용프로그램은 여러 개의 프로세스로 이루어질 수 있음
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2013.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2013.png)
    
- 스케줄러: 프로세스 실행을 관리
- 스케줄링 알고리즘: 어떤 순서로 프로세스를 실행시킬까?
    
    목표:
    
    시분할 시스템: 프로세스 응답시간을 가능한 짧게
    
    멀티프로그래밍: CPU 활용도를 최대로 높여, 프로세스를 빨리 실행
    
- FIFO 스케줄러 (배치처리시스템과 유사)
    
    FCFS: First Com First Served
    
- 최단 작업 우선 스케줄러 (SJF: Shortest Job First)
    
    가장 프로세스 실행 시간이 작은 것 부터 실행
    
    이상적인 것임 (실행시간을 미리 알수 있는 프로세스는 많지 않음, ex RTOS)
    
    cf) RealTime OS(RTOS): 응용프로그램 실시간 성능 보장을 목표로하는 OS. 공장 같은 곳에 사용
    
    General Pupose OS(GPOS): 일반적인 목적
    
- 우선순위 기반 스케줄러 (Priority Based)
    
    정적 우선순위: 프로스세마다 우선순위를 미리 지정
    
    동적 우선순위: 스케줄러가 상황에 따라 우선순위를 동적으로 변경
    
- 라운드로빈 스케줄러(Round Robin)
    
    시분할 시스템 기반
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2014.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2014.png)
    

## 9강~10강 프로세스와 스케줄러의 이해 - 프로세스 상태와 스케줄러

- 멀티 프로그래밍과 wait
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2015.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2015.png)
    
    위와 같이하려면 어떻게 스케줄링 해야하는지
    
- 프로세스 상태
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2016.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2016.png)
    
- 프로세스와 상태와의 관계
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2017.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2017.png)
    
- 프로세스를 시작할 때 ready 상태인 것이 3개이고, 하나를 선택해 끝날 시점에 ready가 2개 block이 2개인 상태에서 어떻게 고를 것인가 (wait는 저장매체를 읽는 것으로 가정)
    
    Ready, Running, Block State를 Queue로 구성했을 때
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2018.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2018.png)
    
    우선순위, SJF 등의 스케줄링을 사용한다면 다른 실행 순서가 나올 것이다.
    
    ## 11강 12강 13강 프로세스와 스케줄러의 이해 - 선점형/비선점형 스케줄러, 스케줄링 알고리즘 조합
    
    - 선점형 스케줄러 (Preemptive Scheduling)
        
        하나의 프로세스가 다른 프로세스 대신에 프로세서(CPU)를 차지할 수 있음
        
        → 구현이 어려움. 스케줄러가 CPU를 제어할 수 있음
        
    - 비선점형 스케줄러 (Non-preemtive Scheduling)
        
        하나의 프로세스가 끝나지 않으면 다른 프로세스는 CPU를 사용할 수 없음 
        
    - ex. 선점형 스케줄러가 작업이 끝나거나 시작할 때만 보는 것이 아니라, 2초마다 확인한다고 했을 때 비선점형과의 차이
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2019.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2019.png)
        
    - 스케줄러의 구분
        
        FIFO, SJF, Priority는 비선점형 스케줄러에 가까움
        
        RoundRobin이 선점형 스케줄러의 기본 가정을 깔고 만든것임
        
    - ex. 정적 우선순위, 선점형, 시분할, 프로세스 상태를 고려한 스케줄링 예시
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2020.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2020.png)
        
    - 인터렉티브, IO, CPU 중심의 프로세스로 미리 구분해 개선된 스케줄링 가능
    
    ## 14강 프로세스와 스케줄러의 이해 - 인터럽트
    
    - 인터럽트
        
        CPU가 프로그래밍을 실행하고 있을 때, 입출력 하드웨어 등의 장치의 이벤트 발생이나 또는 예외상황이 발생하여 처리가 필요한 경우 CPU에 알려 처리하는 기술
        
        CPU는 어는 한순간 실행하는 명령은 하나인데, 다른 장치와 어떻게 통신할까?
        
    - 컴퓨터 구조단에서 볼 때
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2021.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2021.png)
        
    - 코드 단에서 볼 때: 파일 읽기가 끝났다는 것을 어떻게 알려줄 것인가
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2022.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2022.png)
        
    - 스케줄러가 러닝하고 있는 상태에 있는 프로세스를 CPU에게 interrupt 하면 해당 프로세스는 중단되고 ready 상태로 있게 된다.
    - 인터럽트 필요 이유
        
        예외사항 핸들링등과 같은 여러 이벤트가 발생하면 처리하며 어떻게 처리할지 운영체제에 구현되어있어야 한다.
        
    - 주요 인터럽트
        
        0 division interrupt
        
        타이머 인터럽트: 선점형 스케줄러의 프로세스 교체를 위해
        
        입출력(I/O) 인터럽트: 프린터 키보드 마우스 저장매체린터 키보드 마우스 저장매체, 
        
        ex 키보드 가 눌렸다
        
        큰 종류: 내부인터럽트(소프트웨어 인터럽트라고도 함)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2023.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2023.png)
        
    
    ## 15강 프로세스와 스케줄러의 이해 - 인터럽트 내부 동작
    
    - 시스템 콜도 내부적으로 인터럽트 방식으로 처리함
        
        ex. open('data.txt', O_RDONLY); 라는 코드를 만나면 (int 는 인터럽트)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2024.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2024.png)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2025.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2025.png)
        
    - 시간축에서 볼 때
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2026.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2026.png)
        
    - 인터럽트와 IDT:
        
        인터럽트는 미리 정의되어 각각 번호와 실행코드를 가리키는 주소가 IDT(Interrupt Descriptor Table; 이벤트번호: 실행코드의 주소)에 기록되어 있다.
        
        운영체제가 컴퓨터 부팅시 IDT를 기록하며, 운영체제 내부(커널 영역)에 기록되어 있다.
        
        ex. 리눅스: 128은 0x80을 10진수로 바꾼것
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2027.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2027.png)
        
        ex. 타이머 인터럽트
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2028.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2028.png)
        

## 16강 17강 프로세스와 스케줄러의 이해 - 프로세스 구조 & 컴퓨터 구조

- 문맥교환(context switching)
    
    스케줄러가 A에서 B로 프로세스를 변경해 주는 것
    
- 프로세스 구조를 상세하게 알아보자.
    
    ex. 파이썬 코드는 인터프리터 언어라 컴파일이 되지 않지만, 컴파일 된다고 가정하고 보자
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2029.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2029.png)
    
- ex. 왜 스택을 사용하는지: stack의 아래부분부터 제거해 줌
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2030.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2030.png)
    

## 17강 18강 프로세스 구조와 컴퓨터 구조 프로세스 구조와 힙

- 프로세스와 컴퓨터 구조
    
    PC(Program Counter) + SP(Stack Pointer)
    
    ex. SP는 점점 작아지는 번호이며, PC는 점점 커짐 (→ 화살표가 위아래로 되어있음)
    
    EBP 레지스터에는 초기 스택포인터를 가르키게 되어있음
    
    함수의 지역변수는 스택에 인자들 다음에 들어가게 됨
    
    EBP 레지스터는 코드에서 에러가 발생하게되면 어떤 부분에 문제가 있었는지 트래킹하기 위함
    
    EAX 레지스터에는 반환값을 저장해 전달해주는 역할을 함
    
    아래 개념이 디버깅할 때 유용하게 사용됨
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2031.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2031.png)
    
- 힙을 알아보자
    
    힙: 동적으로 생성되는 메모리
    
    파이썬은 동적으로 메모리를 알아서 해준다. 내부적으로 잘게 컴퓨터를 제어하기 위해서는
    
    [https://velog.io/@muchogusto/파이썬-런타임과-메모리-관리](https://velog.io/@muchogusto/%ED%8C%8C%EC%9D%B4%EC%8D%AC-%EB%9F%B0%ED%83%80%EC%9E%84%EA%B3%BC-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EA%B4%80%EB%A6%AC)
    
- malloc (memory allocate?)
    
    정수 포인터 변수를 data로 만들고, heap공간에 2번째줄에 넣어주는 코드이다.
    
    free 를 통해 메모리를 해제할 수 있음
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2032.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2032.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2033.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2033.png)
    
- 힙이 왜 필요한지:
    
    실행코드 안에서 동적으로 얼마나 필요할지 몰라서?
    

## 20강 프로세스 구조와 스택오버플로우

- 데이터 영역 2가지로 분류: BSS & DATA
    
    BSS: 초기화 되지 않은 전역변수 / DATA: 초기화 된 전역변수
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2034.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2034.png)
    
- cf) 스택오버플로우 : 주로 해커들의 공격에 활용되었음
    
    프로세스 구조를 통해 해킹한 예시 
    

## 21강~22강 프로세스와 컨텍스트 스위칭 원리 개념정리

- PC(Program Counter)와 SP(Stack Pointer)에 주목하자

ex. Process 1에서 0002h 까지만 실행하고, 문맥교환이이 일어나면: Context(PC, SP)를 PCB에 저장함

![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2035.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2035.png)

- PCB (Process Control Block)
    
    프로세스 ID, 레지스터 값 (PC, SP), 스케줄링 정보 (프로세스 정보: 레디 블락 러닝), 메모리 정보
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2036.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2036.png)
    
- 컨택스트 스위칭(문맥교환) : CPU에 실행할 프로세스를 교체하는 기술
    
    오버헤드가 많을 수도 있어, 리눅스는 어셈블리어로 보통 작성 되어 있음. 메인메모리 말고 다른 곳에 저장하는 것은 운영체제마다 다를 수 있음.
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2037.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2037.png)
    
    CPU레지스터에 넣고 실행함
    
    1/100 초 마다 문맥교환이 일어날 수도 있음
    
    계속해서 같은 코드를 작성하는 것을 이식성이라고 함 → 어샘플리어를 사용한다는 것은 기기가 바뀔 때 마다 따로 작성해야하 한다는 것 → CPU 별로 따로 작성되어 있다는 것
    
    해킹 보안에서는 어셈블리어가 필요할 수도 있으나 개발 속도를 올리는 것이 요즘 현업
    

## 23강~24강 프로세스간 커뮤니케이션 IPC

- IPC (Inter Process Communication) 기법
    
    프로세스는 자기 자신의 가상 메모리를 참조하는 것. 오른쪽은 물리주소가 아님
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2038.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2038.png)
    
- 프로세스가 통신(IPC)가 필요한지
    
    성능을 높이기 위해 여러 프로세스를 만들어 동시 실행 → 프로세스간 상태 확인 데이터 송수신 필요
    
- 시스템 프로그래밍에서의 fork() 시스템 콜 :
    
    프로세스 자신을 복사해 새로운 프로세스를 만들수 있음 (부모 자식 프로세스)
    
    이를 이용해 병렬처리 가능
    
    ex. 1~10000 까지 합을 10까지 프로세스로 나누어 실행
    
    ex. file을 공유하여 사용하는 방법 → 실시간 데이터 전달이 어려움 + 저장매체까지의 통신시간
    
- 리눅스의 실제 공간
    
    가상주소에 3~4기가는 운영체제의 코드의 가상주소가 위치하고, 0~3기가는 사용자 프로그램을 위한 가상주소 공간이다.
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2039.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2039.png)
    
    가상주소에서 물리주소로 바꾸는 것은 다른 문제이다. 가상 공간 중 굉장히 적은 부분만 물리메모리에 들어간다. 또한 같은 것을 사용하는 커널 공간은 프로세스간 공유한다. → IPC 기법
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2040.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2040.png)
    
    정리:
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2041.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2041.png)
    
    ## 25강 IPC 기법들
    
    - 다양한 IPC 기법
        
        file 사용, 메시지 큐, 공유메모리, 파이프, 시그널, 세마포어, 소켓 등 많음
        
        운영체제 수업에는 많이 없을 수도 있지만 간단하게 코드까지 살펴보자
        
        시스템프로그램이에서 다시보자
        
    - 파이프 기법:
        
        특징: 단방향, Fork 사용
        
        fork 함수가 호출 되면, 프로세스를 복사함. pid를 통해 부모자식 프로세스를 구분하고 자식 프로세스의 PC도 같은 위치를 가르킨다.
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2042.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2042.png)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2043.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2043.png)
        
    - 메시지 큐 기법
        
        A 프로세스에서 B프로세스로 보내는 간단 예시
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2044.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2044.png)
        
        어느 프로세스간에라도 통신이 가능. 먼저 넣은 데이터가 먼저 읽혀짐.
        
        파이프처럼 fork할 필요가 없음. 양방향 가능. 
        
        파이프 메시지 모두 커널공간의 메모리를 사용함
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2045.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2045.png)
        
    - 공유 메모리 기법
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2046.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2046.png)
        
        코드 예시
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2047.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2047.png)
        
    - 시그널 & 소켓
        
        IPC기법이지만 다른 기술에도 많이 사용되는 기술들
        
    - 시그널 기법
        
        원래는 커널이 프로세스에게 알려주는 방법 → 프로세스간에도 이벤트 발생 전달 가능
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2048.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2048.png)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2049.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2049.png)
        
        PCB에 해당 프로세스가 블록 또는 처리해야하는 시그널 관련 정보를 관리한다.
        
        간단하게 말하면, 프로세스가 커널모드에서 사용자모드로 전환시 시그널 처리하는 방법을 이용해 통신한다.
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2050.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2050.png)
        
    - 소켓
        
        네트워크 통신을 위한 기술. 네트워크 기기를 이용하는 시스템콜?
        
        하나의 컴퓨터안에서 소켓 통신을 사용하는 것이다.
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2051.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2051.png)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2052.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2052.png)
        
    
    ## 27강 프로세스 총정리 & 프로그램 성능 개선 방법의 이해
    
    - 강의로 보기
    
    ## 28강 쓰레드의 이해 - 쓰레드 개념
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2053.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2053.png)
    
    - 윈도우는 소스가 공개되어 있지 않다.
    - Thread
        
        Light weight Process라고도함
        
        프로세스는 프로세스간의 데이터 접근이 불가했음 → IPC 사용
        
        스레드는 하나의 프로세스에 여러 개의 스레드 생성 가능. 스레드 들은 동시에 실행 가능
        
        프로세스 안에 있으며, 프로세스 데이터 모두 접근 가능 → IPC 사용 필요 없음
        
        스레드는 독특한 기법을 사용해서 스택에 있는 함수로 볼 수 있음. 스레드마다 PC와 
        
        SP가 있음. 스레드는 힙 데이터 코드 영역을 공유함 → IPC 사용 필요 없음
        
        **다른 프로세스끼리의 공유는 안됨!**
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2054.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2054.png)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2055.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2055.png)
        
- 멀티 프로세싱과 스레드
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2056.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2056.png)
    
    쓰레드는 멀티코어 환경에서 효율적으로 CPU을 사용하도록 도와줌
    
- 스레드 장단점
    
    장점:
    
    사용자에 대한 응답성 향상
    
    자원 효율 (코드, 데이터, 힙을 공유)
    
    단점:
    
    스레드 하나가 문제 있어도 전체 프로세스가 영향을 받음. 프로세스는 아님.
    
    스레드를 많이 생성할 때 문맥교환이 많이 일어나 성능이 저하 될 수 있음
    
    ex. 리눅스에서는 스레드를 프로세스 처럼 다룸 → 스레드 스케줄링으로 인해 문맥교환이 빈번해짐
    
    스레드의 동기화 문제도 있을 수 있음
    
    PThread(POSIX thread)라는 스레드 관련 표준 API를 사용함 → 시스템프로그래밍에서 다룸
    
- 스레드의 동기화 이슈스레드의 동기화 이슈
    
    스레드 A, B, C는 실행순서는 정해져 있지 않은데 데이터, 힙 영역을 공유함 → 관리가 필요함
    
- 파이썬 예시
    
    th.join() 은 다음 코드를 실행하기 전에 기다리는 함수
    
    동기화 이슈로 값이 이상하게 나온다. 50 x 100000
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2057.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2057.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2058.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2058.png)
    
    → 따라서 일부 덧셈이 누락될 수 있는 현상이 발생함→ 따라서 일부 덧셈이 누락될 수 있는 현상이 발생함 이를 위해 상호배제를 사용함. threading.Lock().acquire() , threading.Lock().release() 를 사용함.
    
    - 동기화: (31강 세마포어)
        
        작업들 사이에 실행 시기를 맞추는 것
        
        동기화(Synchronization) 이슈: 
        
        동일 자원을 여러 스레드가 동시 수정 시, 각 스레드 결과에 영향을 줌
        
        상호배제(Mutual Exclusion): 
        
        동기화 해결 방안으로, 여러 스레드가 변경하는 공유 변수에 대해 제한적 접근 필요
        
        한 스레드가 공유 변수 갱신할 때 다른 스레드가 동시 접근하지 못하도록 막는 작업
        
        예시: 동시실행하면 안되는 영역을 임계 영역(critical section), 안되는 자원을 임계 자원(critical resource)라고 함
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2059.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2059.png)
        
    - 상호배제 기법은 락킹(locking) 메커니즘이라고도 함
        
        상호배제의 기법 종류: 
        
        Mutex: 임계구역에 하나의 스레드만 입장 가능, 바이너리 세마포어
        
        세마포어: 여러 스레드가 입장 가능. Counter를 두어 동시 리소스 접근 허용 가능 스레드 수 제어
        
        세마포어 수도코드 
        
        P: 임계영역 들어갈 때 검사 (lock.acquire)
        
        V: 임계영역 나올 때 증가 (lock.release)
        
        S: 세마포어 값
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2060.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2060.png)
        
        바쁜 대기 큐: P를 보면 while을 사용해 S값이 1이 될 때까지 기다림 → CPU 자원 낭비
        
        대기 큐: S가 음수 일 때, 대기 큐에 넣음(sleep) → wakeup은 S ≥1 일 때 실행
        
        cf) 세마포어는 Linux에서 POSIX 세마포어 API를 사용함
        
    - 스레드의 교착상태와 기아상태 (32강)
        
        두 상태 모두 그냥 코드로 해결하는 것이다.
        
        dead lock(교착 상태): 무한 대기 상태로 2 개 이상의 작업이 서로 상대방이 끝나기 만을 기다리고 있기 때문에 다음 단계로 진행하지 못함
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2061.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2061.png)
        
        교착 상태의 발생 조건 (현업과는 많이 동떨어진 이야기 이지만)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2062.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2062.png)
        
        기아상태(Starvation): 특정 프로세스의 우선순위가 낮아 원하는 자원을 계속 할당 받지 못하는 상태. 
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2063.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2063.png)
        
        ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2064.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2064.png)
        
        ## 33강 가상메모리
        
        - 프로세스 관련 기술을 이해하면 가상메모리도 보다 쉽게 이해 가능
        - 가상 메모리 (Virtual Memory System)
            
            실제 각 프로세스마다 충분한 메모리를 할당하기에는 메모리 크기가 한계가 있음
            
            ex. 리눅스 하나의 프로세스가 4GB
            
            통상 메모리는 8GB 16GB
            
            현대 PC는 폰노이만 구조 기반으로, 코드는 메모리에 반드시 있어야함
            
            → 지금 쓰는 공간만 실제 물리 메모리(RAM)에 넣자
            
            리눅스에서 프로세스의 구조: 가상 메모리는 4GB
            
            ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2065.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2065.png)
            
            가상주소를 물리 주소로 빠르게 변환하기 위해 HW기기 MMU(Memory Management Unit)를 사용 
            
            ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2066.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2066.png)
            
- 페이징 시스템 (34강)
    
    가상 메모리를 페이지 단위로 실제 물리메모리에 올림 
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2067.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2067.png)
    
    프로세스(4GB)의 PCB에는 페이지 테이블 구조체를 가리키는 주소가 들어있음
    
    페이지 테이블에는 가상 주소와 물리 주소간 매핑 정보가 있음. CPU는 물리메모리에 있는 것을 받아 처리를 함
    
    페이징 시스템 구조
    
    가상주소는 32비트: 31~11 비트 페이지 번호, 11~0 비트은 변위(offset)로 구성됨
    
    페이징 시스템 동작
    
    CPU가 특정 가상 주소 접근
    
    해당 프로세스 페이지 테이블(PCB에 있는)에 해당 가상주소가 포함된 페입지 번호 확인
    
    페이지 번호가 있으면 페이지 첫 물리 주소(p')를 알아내, p'+d 가 실제 물리주소가 됨
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2068.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2068.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2069.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2069.png)
    
- 다중 단계 페이징 시스템 (35강)
    
    프로세스(4GB)의 페이지(4kb) 중 필요하지 않은 페이지 는 생성하지 않아 공간을 절약함
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2070.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2070.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2071.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2071.png)
    
    TLB(Translation Lookaside Buffer, 페이지 정보 캐시): CPU와 메모리의 시간도 너무 멈. TLB를 먼저 보고 있으면 2번 3번 작업을 건너띰
    
    페이징 시스템과 공유메모리: 프로세스간 동일한 물리주소를 가리킬 수 있음 → 공간 절약, 메모리 할당 시간(프로세스 생성시간) 절약
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2072.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2072.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2073.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2073.png)
    
- 요구 페이징 (36강)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2074.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2074.png)
    
    valid-invalid 비트를 보고 없으면 물리 메모리로
    
- 페이지 폴트 (인터럽트의 종류이다)
    
     tlb에 없고 invalid 일 때
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2075.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2075.png)
    
    페이지 폴트가 자주 일어 나면 시간이 오래걸림. 미리 물리 메모리에 올리는 여러 알고리즘들이 있음
    
- 페이지 교체 정책 (알고리즘) (37강)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2076.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2076.png)
    
    a. FIFO 
    
    b. OPT: 최적의 교체. 추후에 늦게 사용하는 페이지 교체. 구현 불가. 아래 이를 구현하려는 시도 알고리즘.
    
    c. LRU: 가장 오래 전 참조 페이지 교체
    
    d. LFU: 가장 적게 참조 페이지 교체
    
    e. NUR: 최근에 사용하지 않은 페이지 교체 (수정 비트 참조 비트 활용)
    
    스레싱: 과도한 페이지 교체 작업, 페이지 폴트로 실제 아무일도 못하는 상황
    
- 가상메모리: 세그멘테이션 기법 (38강)
    
    페이징 기법과 비교해서 참고해서 보자
    
    가상메모리를 서로 크기가 다른 논리적단위인 세그먼트로 분할 (같은 크기 4kb가 아닌 논리적 단위로 분할하는 것이 다름)
    
    ex: x86 리얼 모드
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2077.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2077.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2078.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2078.png)
    
    페이지와 비교
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2079.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2079.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2080.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2080.png)
    
- 가상 메모리 동작 이해 총정리 (39강)

## 40강 파일시스템

- 파일시스템: 운영체제가 저장메체에 파일을 쓰기 위한 자료구조 또는 알고리즘
    
    0, 1 의 데이터를 어떻게 저장매체에 저장할까?
    
    비트 단위의 관리는 오버헤드가 너무큼
    
    블록단위로 관리? 블록마다 고유번호 관리 →사용자가 각 블록 고유 번로 관리는 어려움 → 추상적 객체 필요: 파일! 사용자는 파일 단위로 관리
    
- 저장 매체에 효율적으로 파일을 저장하는 방법
    
    연속적인 공간에 파일을 저장하는 것이 좋음
    
    외부단편화문제 발생: 파일 사이즈 변경 문제로 불연속 공간에 파일 저장 기능 지원 필요
    
    a. 블록체인(비트코인 아님): 블록을 링크드 리스트로 연결, 끝에 블록을 찾을 때 처음 블록부터 주소를 따라가야함
    
    b. 인덱스 블록 기법: 각 블록에 대한 위치 정보를 기록해, 한번에 끝 블록을 찾아갈 수 있도록함
    
- 다양한 파일 시스템 알고리즘
    
    윈도우: FAT, FAT32, NTFS : 블록 위치를 FAT라는 자료 구조에 기록. 요즘에는 NTFS를 만힝 사용
    
    리눅스: ext2, ext3, ext4: 일종의 인덱스 블록 기법인 inode 방식 사용. 이외에 많음. inode 방식은 유닉스의 전통 방식이다
    
- 파일시스템과 시스템콜: 파일시스템 알고리즘을 고려하지 않고 프로그래밍 해도 되게끔 한다.
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2081.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2081.png)
    
- inode 방식 파일 시스템 (41강)
    
    수퍼블록: 파일 시스템 정보
    
    아이노드 블록: 파일 상세정보 (PCB)
    
    데이터 블록: 실제 데이터 (1~4kb)
    
    슈퍼블록 정보 확인
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2082.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2082.png)
    
    아이노드와 파일의 관계
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2083.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2083.png)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2084.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2084.png)
    

- 가상파일 시스템

- 부팅과정 (42장)
    
    부트 : 컴퓨터를 켜서 동장시키는 절차
    
    부트 프로그램: 운영체제 커널을 storage에서 특정 물리 주소의 물리 메모리로 복사하고 커널의 처음 실행위치로 PC를 가져다 놓는 프로그램
    
    컴퓨터를 키면
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2085.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2085.png)
    
    부팅과정의 핵심: BIOS에 CPU가 접근하고, BIOS 코드를 메모리에 올려놓거 BIOS코드가하는 역할은 MBR와 정보에 있는 부트로드 코드와 MBR에 있는 파티션 코드정보를 메모리에 올리고, 부트로더 코드는 해당 메인 파티션에 있는 부트 섹터라는 특정영역에 가서 부트 코드를 로드하고 부트 코드가 실행되면 해당 메인 파티션에 있는 운영 체제 이미지를 로드하면 컴퓨터가 실행됨 ㄷㄷ;
    
- 가상 머신 이해 (43장)
    
    핫한 분야이다 클라우드 AI에서
    
    운영체제 레벨에서 보면 하드웨어를 소프트웨어 기술로 마치 하드웨어가 여러 개가 있는 것 처럼 하는 기술(emulate). 가상의 머신에 운영체제를 설치한다.
    
    깊게들어가면 어려우니 간단하게 다룰 것이다.
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2086.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2086.png)
    
    가상머신을 기준에 따라 type 1, type 2. 가상화 반가상화로 나누어 볼 수 있다.
    
    a. 가상머신 type 1 (native 또는 bare metal)
    
    OS가 위치한 곳에 VMM을 설치해 하드웨어 바로 위에
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2087.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2087.png)
    
    b. 가상머신 type 2
    
    type 1 가능성이 거치는게 많아 더 빠를 수도 있지만 구현하기 나름
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2088.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2088.png)
    
    a. 전가상화 : VMM이 각 가상 머신의 운영체제의 요청을 통역 해줌
    
    b. 반가상화 : 각 가상 머신이 직접 하드웨어 자원을 요청. 이 때 VMM은 운영체제처럼 리소스 관리를 해줌
    
    → 반가상화가 좀 더 성능이 좋을 수 있지만, OS를 수정해야하며 복잡도가 올라가고 성능이 안 좋을 수 있이므
    
    → 전반가상화를 혼용해서 사용했었는 데 하드웨어 기술의 발전으로인해 전가상화 기술을 선호함
    
    VMWare: 대중적인 가상머신 프로그램 (type 2)
    
    KVM: AWS 등에서 사용 (type 1) 컴퓨터 100대로 10000명의 사용자를 처리함
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2089.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2089.png)
    
    KVM은 리눅스 커널로 하드웨어에 직접 명령하는 ioctl() 시스템콜을 사용해 vCPU(가상 CPU)를 기반으로 만들어진 가상머신
    
    KVM 가상화 기술은 CPU에서도 지원이 되야함. KVM도 따지고보면 리눅스 커널이다. CPU 프로텍션 링도 가상머신에서도 영향을 미쳐 VMX root non root 모드로 제공한다
    
    **Docker: 또 다른 가상머신** 
    
    도커는 커널 추상화! 
    
    리눅스의 chroot라는 명령어를 이용해 분리된 새로운 리눅스 실행환경이 만듬. 운영체제가 필요가 없음(리눅스가 운영체제로 깔려있다면)
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2090.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2090.png)
    
    가상머신 정리
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2091.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2091.png)
    
    실행환경이 굉장히 복잡한 데이터엔지니어링 등 
    
    알아서 도커 이미지가 작성되게 하는 것들이 실무에서 많이 사용함
    
    ![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2092.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2092.png)
    

cf) Java VM:

응용 프로그램 레벨 가상화

![OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2093.png](OS%20bb32e4e3fff047c3a2fc1882c5d4d56f/Untitled%2093.png)

[https://velog.io/@underlier12/OS-26-페이징-시스템](https://velog.io/@underlier12/OS-26-%ED%8E%98%EC%9D%B4%EC%A7%95-%EC%8B%9C%EC%8A%A4%ED%85%9C)