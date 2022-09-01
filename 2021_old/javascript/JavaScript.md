# JavaScript

- API의 종류
    
    REST API
    
    Graph QL
    
    gRPC
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled.png)
    
- 1강 자바스크립트 역사
    - 처음 웹개발에서 브라우저에 종속되게 작성해야하는 부분이 많았다
    - 여러가지 변화가 있는 다음에 ECMAScript 5, 6 표준안이 2009년 나오면서 많은 것들의 표준으로 정해졌다.
    - 자바스크립트는 성숙하고 잘 정착된 언어이다.
    - javascript 공식사이트
        
        [https://www.ecma-international.org/](https://www.ecma-international.org/) - 공식이지만 좀 어려움
        
        [https://developer.mozilla.org/ko/](https://developer.mozilla.org/ko/) - 여기도 거의 공식급이며, 최신도 많이 올라옴.
        
        w3school 은 공식은 아님
        
        참고) [https://ko.javascript.info/](https://ko.javascript.info/)
        
- 2강 HTML에서 javascript를 배치하는 방법
    - javascript를 HTML에 사용하는 방법들
        - head에 script를 추가하는 방법
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%201.png)
            
            브라우저가 파일을 읽을 때 html css를 한줄한줄씩 읽으면서 DOM요소로 변환/분석
            
            그런데 이렇게 html을 parsing하는 과정에서 head에 추가된 script를 만나면서 parsing하던 과정을 멈추게되고, script를 fetching(다운)받아서 executing(실행)한 후에 나머지 html을 parsing하게 됨
            
            js파일이 크면 읽는데 시간이 걸림 →사용자가 페이지를 로딩 시간 증가
            
        - body 끝부분에 script를 추가하는 방식
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%202.png)
            
            사용자가 html 빨리 볼 수 있지만, 페이지가 JavaScript에 굉장히 의존적이라면 사용자가 의미있는 컨텐츠를 보기 위해 시간이 증가됨
            
        - header안에 async속성 사용하여 script를 추가
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%203.png)
            
            js 파일을 받는 것은 병렬로 수행함. → js파일 받는 시간 절약
            
            html을 전부 파싱하기 전에 js가 실행되기 때문에 js파일이 조작하는 시점에 아직 html 정의되지 않았을 수도 있어 위험할 수 있음. 또 js실행을 위해 그동안 html을 파싱하는데 시간이 걸릴 수 있음
            
        - head에 defer 옵션 추가
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%204.png)
            
            async와 같이 먼저 받지만 js는 마지막에 실행. 위 4개중 defer가 가장 좋은 옵션이긴 함.
            
        - async와 defer의 차이점
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%205.png)
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%206.png)
            
            async사용시에는, b.js 파일이 a.js에 선행되어야 되는 것이라면 문제가 생길 수 있음.
            
    
    - 파일 최 상단에 'use script';를 사용하자!
        
        자바스크립트는 굉장히 빨리 만들어져 너무 유연하다. → 위험하고 실수가 빈번할 수 있음.
        
        선언되지 않은 변수를 할당하는 것, 프로토타입을 변경 등
        
        use script를 선언하면, 보다 상식적이고 js엔진이 효율적으로 분석가능하게 한다.
        
        이는 ECMA Script5에 정의되어 있다.
        
- 3강 데이터 타입
    
    입력, 연산, 출력이 프로그래밍의 가장 중요한 부분이다. 또한 효율적인 연산과 최적화된 메모리도 중요하다.
    
    ES6에 let이 명시되어 있다.
    
    - 변수 선언
        - let (read and write)
            
            let 명령어를 통해 name을 정의하면 메모리의 한 공간을 가리킬 수 있는 포인터가 생김
            
            변수 선언은 let만 쓴다. → ES6
            
        - Constant (read only)
            
            값이 변경하지 않는 것 : 변경하지 않은 이유 Security, Thread Safety, Human Mistakes
            
        - var
            
            var는 변수 선언으로 사용가능하지만, 사용하지 않는 것이 좋음
            
            var는 선언하기 이전에 사용할 수 있음
            
            → var hoisting: var로 선언한 변수 선언을 맨 위로 끌어 올려주는 것.
            
            block scope에 제한을 받지 않음 
            
            cf. 호환성
            
            ES6는 IE에서는 지원하지 않는다. 무시하자
            
        - block
            
            js는 중괄호를 통해 블락을 지정할 수 있고, 이 때 블록안의 변수는 지역변수로 사용되며 전역변수는 바깥에서 그냥 선언하면 전역변수로 사용되어 어느 곳에서나 접근이 가능함.
            
    - 변수 타입
        - Primitive: 더 이상 작은 단위로 나뉘어질 수 없는
            
            number(bigInt), stirng, boolean, null, undefined, symbol
            
            - number
                
                javascript에는 number만 있음. 타입은 다이나믹하게 설정됨. typespript에서도 같음 (대신 number라고 지정해줘야함.
                
                0으로 나눈 값은 Infinity 라는 number 타입으로 저장한다. 에러가 안나는 거 같음.
                
                bigInt 자료형은 2**53이상 -2**53이하를 위한 새로운 자료형 → 큰 숫자에 n을 붙이면 됨, 크롬이나 파이어폭스에서만 지원함
                
            - string
                
                js는 모두 char, string으로 할당이 된다. → 파이썬도 마찬가지임
                
                백틱과 $를 이용해 파이썬의 f string처럼 사용이 가능하다
                
                → 이를 template literals라고 함
                
            - Boolean
                
                ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%207.png)
                
            - null
            - undefined
                
                let a; 또는 let = undefined; 로 아직 값을 넣지 않은 타입을 말한다.
                
            - Symbol
                
                map 과 같은 고유 식별자가 필요하거나, 동시성이 필요한 프로그램에서 고유 식별자를 통해 우선순위를 정해야 할 때 사용한다.
                
                ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%208.png)
                
        - Object: 실생활 오브젝트, 자료구조 등
            
            let temp = {a = 10; b = 20;} 
            
            temp.a = 20;
            
            object를 const로 선언한 경우, object는 커서 메모리에 레퍼런스가 저장된다
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%209.png)
            
        - Function: Javsript는 함수도 데이터 타입 중 하나이다
            
            First-Class Function이 가능하다 → 함수를 변수로서 저장할 수 있다. (python도 마찬가지)
            
        - cf. C언어는 개발자가 세세하게 메모리를 관리할 수 있음
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2010.png)
            
    - Dynamically Typed Language
        
        Python과 같다. 특이한 점은 '7' + 5 → '75'(string) , '8' / '2' = 4 (number)
        
        에러가 런타임에서 자주 발생해서 typesript가 생겨나게 된다. js에 type이 올려진 것임.
        
- 4강 연산자
    
    연산에 // 몫을 계산하는 없다 → 주석이다
    
    preIncrement, postIncrement가 있다. 할당하고 업데이트하냐 업데이트 하고 할당하냐
    
    ```jsx
    let a = 2;
    const b = a++;    // b : 2
    console.log(a);   // 3
    console.log(a++); // 3
    console.log(a);   // 4
    ```
    
    첫 번째 비교 연산자는 true니까 뒤에는 연산안한다. 함수 같은 경우 아래를 보면 오래 걸리니까 제일 뒤에 놓는 것이 효율적이다.
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2011.png)
    
    비교 연산자는 === 을 쓰자
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2012.png)
    
    object를 그대로 비교하면 reference 주소 값을 비교하기 때문에 F,F,T가 출력된다
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2013.png)
    
    복습
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2014.png)
    
    - 조건문:
        - if, else if, else 로 된다
        - Ternary operator: 맞으면 왼쪽 틀리면 오른쪽
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2015.png)
            
        - switch case가 있다
    - 반복문
        - while
        - do while
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2016.png)
            
        - for : java와 같다.
            
            for (let i = 0; i < 10; i++)
            
- 5강 함수
    
    함수는 한 가지 일만 하도록 만드는 것이다!
    
    - typescript
        
        타입스크립트에서 함수를 작성할 때에는 type hint를 꼭 명시해야함.
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2017.png)
        
    - default parameter
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2018.png)
        
    - rest parameters
        
        for loop는 3가지로 작성 가능함.
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2019.png)
        
    - return
        
        return 이 없을 때는 return undefined; 가 있는 것과 같음
        
        필요한 경우 early return 을 하는 것도 좋다.
        
    - function expression
        - anonymous function
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2020.png)
            
        - named funtion: debugger's stack trace에 저장 되므로 디버깅할 때 유리함
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2021.png)
            
        - arrow function: 간결하게 사용 가능함, 함수가 길어지면 블락을 설정하고 return해주면 됨
            
            중괄호를 사용하지 않고 간결하게 중간 처럼 작성가능.
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2022.png)
            
        
        cf. 함수 즉시 호출
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2023.png)
        
        - funtion은 기본적으로 hoisting이 된다. js엔진이 함수를 선언하면 위로 올라간다. 함수를 변수로 저장해 표현한 것은 올라가진 않음
        - callback function: 함수에 함수를 파라미터 형태로 전달 가능, 아래 둘다 가능
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2024.png)
            
- 6강 클래스 오브젝트(인스턴스)
    - [https://javakid.tistory.com/8](https://javakid.tistory.com/8)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2025.png)
        
    - 클래스는 ES6에 추가되었다.
    - 클래스 예시
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2026.png)
        
        constructor, this부분이 다르다. 클래스 메소드에서는 function 사용 안하는 것 같음
        
    - getter, setter
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2027.png)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2028.png)
        
        this.age 를 선언하는 것이 getter를 사용하는 것이며, = age 부분이 setter를 사용하는 것이기 때문에 _age로 설정하지 않으면 계속 함수를 호출해 콜스택 초과 에러가 나온다. 따라서 아래와 같이 작성하면 안된다.
        
        setter에서는 들어오지 못하는 변수를 미리 설정할 수 있음 → 사용자 에러
        
        private, public: 
        
        ```jsx
        class Person_b {
            constructor(name, age){
                this.name = name;
                this.age = age; 
            }
            speak(){
                console.log(`{this.name}: hello!`);
            }
            get age(){
                return this.age;
            }
            set age(value){
                this.age = value;
            }
        }
        ```
        
    - public, private
        
        최근에 추가된 부분이라 많이 사용하지는 않는다. 필드 명 앞에 #를 붙여 private 필드를 사용할 수 있다.
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2029.png)
        
    - static
        
        object, instance에 상관없이 공통적으로 클래스를 위해 사용할 수 있는 것이면 스태틱 필드와 스태틱 메소드를 사용하는 것이 메모리 사용에 효율적
        
        - python classmethod / staticmethod
    - 상속 & 다형성
        - 오버로딩: 새로 메서드 정의
        - 오버라이딩: 상속 메소드 내용 변경
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2030.png)
        
    - instanceof
        
        python의 isinstance와 같은 듯
        
    - 참고하면 좋은 사이트
        
        [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)
        
- 7강 오브젝트
    - js의 오브젝트는 key와 value형태이다. 동적으로 key value 할당 가능.
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2031.png)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2032.png)
        
        아래와 같은 부분은 동적으로 키를 받아야할 때 사용.
        
        키는 자동으로 string타입으로 변환됨
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2033.png)
        
    - 오브젝트 생성
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2034.png)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2035.png)
        
        보통 아래처럼 많이함.
        
    - 오브젝트에 key가 있는지
        
        'name' in person 이렇게 함
        
    - for (const key in obj) 로 사용 가능
    - deep copy
        
        Object.assign(target, source)
        
        const target = Object.assign({}, source)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2036.png)
        
        더 뒤에 있는 것을 사용함
        
- 8강 배열(Array), 9강 배열 내장 함수
    
    js는 다른 타입도 하나의 자료구조에 담을 수 있다.
    
    자료구조에서는 검색 삽입 삭제 정렬을 고려해서 사용한다.
    
    - 선언
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2037.png)
        
    - 길이: arr1.length
    - 루프:
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2038.png)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2039.png)
        
    - append → push
    - pop → pop
    - unshift: 앞에 추가 / shift: 앞에 제거 → pop push 보다 더 느림
    - splice:
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2040.png)
        
    - arr3 = arr1.concat(arr2)
    - arr.indexof(element) → 없으면 -1 출력
        
        fruits.includes(element) → true, false
        
        lastIndexOf(element) → element가 2개 이상일 경우 젤 뒤에 있는 인덱스 반환
        
    - find는 찾으면 멈춤
        
        화살표는 함수의 return을 대신함
        
        안에 함수를 콜백함수라고 함
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2041.png)
        
    - filter
        
        ```jsx
        const result = students.filter((student) => student.enrolled);
        ```
        
    - map
        
        ```jsx
        const result = students.map((student) => student.score * 2);
        ```
        
    - some / every
        
        ```jsx
        // 하나라도
        const result = students.some((student) => student.score < 50);
        // 모두 만족하는지
        const result_b = students.every((student) => student.score >= 50);
        ```
        
    - reduce
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2042.png)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2043.png)
        
        - reduce right는 뒤에서부터 시작함
        - prev는 이전 콜백함수의 return값을 전달받음
            
            cur는 배열 item을 순차적으로 전달받음
            
        - 정렬
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2044.png)
            
        - 함수형 프로그래밍
            
            ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2045.png)
            
- 10강 JSON
    - HTTP(Hypertext Transfer Protocol)
        
        클라이언트의 요청에 대한 상태를 API는 HTTP 상태코드를 통해 응답한다. 
        
        요청에 대한 결과가 안됐을 경우에는 서버 내부적인 문제인지, 클라이언트 요청의 문제인지 등을 알기 위해 이를 HTTP상태 코드를 통해 정리했다. [https://ko.wikipedia.org/wiki/HTTP_상태_코드](https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C)
        
        요청 성공: 200번대 /  클라이언트 문제: 400번대 / 서버의 문제: 500번대
        
        **하이퍼텍스트 전송 프로토콜(HTTP)**은 HTML과 같은 하이퍼미디어 문서를 전송하기위한 [애플리케이션 레이어](https://en.wikipedia.org/wiki/Application_Layer) 프로토콜입니다. 웹 브라우저와 웹 서버간의 커뮤니케이션을위해 디자인되었지만, 다른 목적으로도 사용될 수 있습니다. HTTP는 클라이언트가 요청을 생성하기 위한 연결을 연다음 응답을 받을때 까지 대기하는 전통적인 [클라이언트-서버 모델](https://en.wikipedia.org/wiki/Client%E2%80%93server_model)을 따릅니다. HTTP는 [무상태 프로토콜](https://en.wikipedia.org/wiki/Stateless_protocol)이며, 이는 서버가 두 요청간에 어떠한 데이터(상태)도 유지하지 않음을 의미합니다. 일반적으로 안정적인 [전송 레이어](https://en.wikipedia.org/wiki/Transport_Layer)로 UDP와 달리 메세지를 잃지 않는 프로토콜인 TCP/IP 레이어를 기반으로 사용 합니다. [RUDP](https://en.wikipedia.org/wiki/Reliable_User_Datagram_Protocol) — 안정적인 업데이트인 UDP의 적합한 대안 입니다.
        
    - AJAX
        
        웹페이지에서 동적으로 서버에게 데이터를 주고 받을 수 있는 기술.
        
        **Asynchronous JavaScript + XML(AJAX)** 은 그 자체가 특정 기술은 아닙니다. 2005년 Jesse James Garrett이 처음 만들어낸 말로, [HTML](https://developer.mozilla.org/ko/docs/Web/HTML) 또는 [XHTML](https://developer.mozilla.org/ko/docs/Glossary/XHTML) , [CSS](https://developer.mozilla.org/ko/docs/Web/CSS) , [JavaScript](https://developer.mozilla.org/ko/docs/Web/JavaScript) , [DOM](https://developer.mozilla.org/ko/docs/Web/API/Document_Object_Model) , [XML](https://developer.mozilla.org/ko/docs/Web/XML) , [XSLT](https://developer.mozilla.org/ko/docs/Web/XSLT) , 그리고 제일 중요한 [XMLHttpRequest 객체](https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest) 를 비롯해 기존의 여러 기술을 사용하는 "새로운" 접근법을 설명하는 용어입니다. 이렇게 다양한 기술을 AJAX 모델로서 결합했을 때, 웹 어플리케이션은 전체 페이지를 새로 고칠 필요 없이 사용자 인터페이스에 빠르고 점진적인 업데이트를 적용할 수 있습니다. 덕분에 어플리케이션은 보다 빨라지고, 사용자 행동에 대한 반응성도 좋아집니다.
        
        간단히 말하면, 서버와 통신하기 위해 `[XMLHttpRequest](https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest)` 객체를 사용하는 것을 말합니다. JSON, XML, HTML 그리고 일반 텍스트 형식 등을 포함한 다양한 포맷을 주고 받을 수 있습니다. AJAX의 강력한 특징은 페이지 전체를 리프레쉬 하지 않고서도 수행 되는 "비동기성"입니다. 이러한 비동기성을 통해 사용자의 Event가 있으면 전체 페이지가 아닌 일부분만을 업데이트 할 수 있게 해줍니다.
        
        - XHR(XMLHttpRequest) 오브젝트: 브라우저 API에서 제공함 → 서버에게 데이터를 요청하고 받을 수 있음.
            
            `XMLHttpRequest`(XHR) 객체는 서버와 상호작용하기 위하여 사용됩니다. 전체 페이지의 새로고침없이도 URL 로부터 데이터를 받아올 수 있습니다. 이는 웹 페이지가 사용자가 하고 있는 것을 방해하지 않으면서 페이지의 일부를 업데이트할 수 있도록 해줍니다. `XMLHttpRequest` 는 [AJAX](https://developer.mozilla.org/ko/docs/Glossary/AJAX) 프로그래밍에 주로 사용됩니다.
            
        - Fetch API
            
            **Fetch API**는 네트워크 통신을 포함한 리소스 취득을 위한 인터페이스가 정의되어 있습니다. `[XMLHttpRequest](https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest)`와 같은 비슷한 API가 존재합니다만, 새로운 Fetch API는 좀더 강력하고 유연한 조작이 가능합니다.
            
        
        [https://developer.mozilla.org/ko/docs/Web/HTTP](https://developer.mozilla.org/ko/docs/Web/HTTP)
        
        [https://developer.mozilla.org/ko/docs/Web/Guide/AJAX](https://developer.mozilla.org/ko/docs/Web/Guide/AJAX)
        
        [https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest](https://developer.mozilla.org/ko/docs/Web/API/XMLHttpRequest)
        
        [https://developer.mozilla.org/ko/docs/Web/API/Fetch_API](https://developer.mozilla.org/ko/docs/Web/API/Fetch_API)
        
    - JSON
        
        XHR을 사용할 때, XML대신 JSON을 주로 사용.
        
    - serialize:
        
        JSON.stringify: replacer라는 콜백함수를 이용해 원하는 부분 변경 가능
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2046.png)
        
        오브젝트를 json 변환 시 함수는 serialize되지는 않는다.
        
    - deserialize:
        
        JSON.parse() 함수사용
        
        마찬가지로 reviver 콜백함수를 이용해 함수를 되돌릴 수 있음
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2047.png)
        
    - 유용한 사이트:
    JSON Diff checker: [http://www.jsondiff.com/](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbWVRQzhLSXNiczUzOGRHbFVNZC1idXU5c0dJZ3xBQ3Jtc0tuSEJBdkM3U1FmQkhMSGpwOTdBVGN0WXNjQUVvRVFYYTYyNkNYVGo0V3RTOTZ4SURHT0V5dW9rRTE2VWtlQVYya2Z1R3p6dEVSRUlqbTJaUTBfSjYwSnp2LWM2RnlJaURSYzlhR3JLWFNlSjE3REpsdw&q=http%3A%2F%2Fwww.jsondiff.com%2F)
        
        JSON Beautifier/editor: [https://jsonbeautifier.org/](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbFp0V3p3MTZsNVhIZTJyXzZWNGlyVGozUVNMZ3xBQ3Jtc0ttcDJPdTNXUzI4RGNZY3pxUi11WndJUWpJT2ZiUmtpWnU3cVM4SklIMTBKQkoyNUhnNkpRcl9KSE5iQS1kNU02MXR5R29aQWxPd1VrQVh2aWxzY1c4UC1yeWo0X1NNMGxaWmlsZnF4Z25yRXlyQks1cw&q=https%3A%2F%2Fjsonbeautifier.org%2F)
        
        JSON Parser: [https://jsonparser.org/](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbTg3bTJoSnp3eF94ZjBTaEJ1d3FrRmdETE5VZ3xBQ3Jtc0tscGp2VFJteDJWUGdSOGhmdkxJc2EzSUlJVWV3VXlleXA2eGlsUDIyRjJ0V21MNzdTMzZ3b21rNk9EOE85cnJ4LVZ4MVBGaGxKSTNPVUo4ZlpHSzFZSEduX1AyYWRjemZnSXAtbU1LRGFJNW9WeGJGVQ&q=https%3A%2F%2Fjsonparser.org%2F)
        
        JSON Validator: [https://tools.learningcontainer.com/j...](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbnBNdVFHd3hVNEVEbGtFQmx1VG9rTkg0UE5BZ3xBQ3Jtc0trbE1CaFZ3TEs3OFY2VVFva1d3cWE5a0RRbEduSlhxRnJKX1pEcllVVXBFV0ZqVGZFWlVsTW9EaXYyaWUyb3k1ZnJuanhRcGpiY3E5cFRYTlA4aHc1OGFlVV9kRjk1dzBDYlROdU9RTm41c21HUDVtZw&q=https%3A%2F%2Ftools.learningcontainer.com%2Fjson-validator%2F)
        
- 11강 비동기처리와 콜백함수
    
    자바스크립트는 동기적 → 호이스팅이 된 이 후에는 코드가 순차적으로 실행됨
    
    호이스팅: var, function 선언이 자동으로 먼저 선언됨
    
    비동기라는 것은 언제 실행될지 모르는 것. 
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2048.png)
    
    이것이 비동기적인 실행 방법이다.
    
    setTimeout안의 함수가 나중에 다시 호출 하기 때문에 callback이라고 부른다
    
    - Synchronous Callback & Asynchronous Callback
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2049.png)
        
    
    콜백을 너무 겹치도록 과하게 사용하면 가독성이 좋지 않고, 디버깅도 어려움. promise, async, awake를 적절히 사용해 콜백지옥을 벗어날 수 있음.
    
- 12강 promise
    - 비동기연산을 간편하게 처리해주는 기능
    - state, producer와 consumer가 중요함
    - state:
        
        pending 상태 → fulfilled 상태 or rejected 상태
        
        오래 걸리는 함수를 예약하면 pending 상태
        
        완료되어 성공은 fulfilled 상태, resolve 변수 이용
        
        완료되어 실패는 reject 상태, reject 변수 이용, new Error 이용
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2050.png)
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2051.png)
        
        then은 위와 같이 값을 전달할 수도 있고 Promise를 전달해도 된다.
        
        슬래시 2개를 이용해 한줄로 작성된 것을 체이닝을 보기 좋게 만들 수 있음.
        
    - 에러 핸들링과 함수 간소화
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2052.png)
        
        - 위와 같이 then에서 return받은 값을 바로 함수에 넣으려면 아래와 같이 간결하게 사용가능
        
    - 콜백함수만 사용한 것과 promise를 함께 사용한 코드 차이
        
        ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2053.png)
        
- 13강 async / await
    
    promise에서 조금 변형된 것, synthetic sugar이다.
    
    함수앞에 async를 붙이면, 함수를 비동기함수 Promise로 바로 만들어줌
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2054.png)
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2055.png)
    
    기존 promise도 체이닝이 심하게 될 수 있음
    
    이를 위해 동기적으로 수해하는 것 처럼 보이도록 async, await 사용가능
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2056.png)
    
    에러 처리는 아래와 같이 하면됨
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2057.png)
    
    또한 아래와 같이 사용하면 병렬적으로 총 1초가 걸리게 된다
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2058.png)
    
    근데 위처럼 사용하지 않는다
    
    Promise.all 내장함수를 사용하는 것이 더 효과적.
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2059.png)
    
    Promise.race를 사용하면 가장 먼저 전달 받은 함수를 출력한다
    
    ![Untitled](JavaScript%2034d0b2589d0e455281368d1953529385/Untitled%2060.png)