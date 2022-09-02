# 정상성, 분해, ETS

## 정상성

---

- 시계열의 평균과 분산이 일정하고, 추세가 존재하지 않은 성질
- 약정상성
    
    임의의 $t$에 대해 $E[X_{t}] = \mu$
    
    임의의 t에 대해 $V[X_{t}] < \infty$
    
    임의의 t, h에 대해 $cov[X_{t+h}, X_{t}] = \gamma(h)$
    

## 통계량

---

- 자기 공분산 함수 (ACVF; auto-covariance function)
    
    lag k에 대해,
    
    $\gamma(k) = E[(X_{t} - \mu)(X_{t+k} - \mu)]$
    
    이산 신호에서, 표본자기공분산함수
    
    $\gamma(k) = {{1}\over{N}} \Sigma_{t=0}^{t-k} (x_{t}-\mu)(x_{t+k} - \mu)$
    
    - cf. 표본 공분산은 n-1로 나누지만 (표본공분산의 기댓값이 모분산이 되게 하기 위한 최소분산불편 추정임([UMVUE](https://namsahng.tistory.com/entry/6장-최소-제곱-추정법)))
    - (1/n-k)을 사용하지 않는 것은 표본 자기공분산 행렬이 non-singular이고, positive definite한 행렬이기를 원해서이다. ([출처](https://stats.stackexchange.com/questions/56238/question-about-sample-autocovariance-function))
- 자기 상관계수 함수 (ACF ; auto-correlation fucntion)
    
    lag k에 대해, $r_{k} = {{\gamma(k)}\over{\gamma(0)}}$
    
    auto correlation의 3 종류 positive(+++—-), negative(+-+-+-), random(없음) → 잔차로 확인.
    
    → Durbin-Watson Test로 1차 시차에 대해 Positive Autocorrelation이 있는지 검정한다. (귀무: 시차의 1차 자기상관은 없다, 대립: 자기상관이 있다)
    
    (출처: [영상](https://www.youtube.com/watch?v=pxG4ZlHJ570&t=730s))
    
- 편 자기 상관계수 함수 (PACF)
    
    자기상관계수는 시점 t에서 t-1, t-2, … 와의 상관계수를 의미한다. 하지만, 시계열의 특성상 t시점과 t-2와의 상관 계수 ($r_{2}$) 에는 t-2 → t-1 → t 로 이어지는 간접적인 상관계수$(r_{1})$이 포함되기 때문에 t시점에서 t-2에 직접적인 상관성만 고려하기 위한 상관계수함수이다.
    
    ([참고](https://www.youtube.com/watch?v=DeORzP0go5I) 영상)
    
- numpy 구현 코드
    
    [https://github.com/NamSahng/TIL/blob/master/time-series/numpy_acvf_acf.ipynb](https://github.com/NamSahng/TIL/blob/master/time-series/numpy_acvf_acf.ipynb)
    

## 정상성 확인

---

- 그래프 확인
    
    [https://otexts.com/fppkr/stationarity.html](https://otexts.com/fppkr/stationarity.html)
    
    ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled.png)
    
    d, h, i: 계절성
    
    a, c, e, f, i: 추세 + 수준이 변함
    
    g: cycle이 있어보이지만, 불규칙적임 → 정상성 가질 수 있음
    
    b: 정상성 가질 수 있음
    
- 통계적 접근
    - ACF 값
        
        ACF 그래프가 비교적 빠르게 0으로 떨어짐 → 정상성 가질 수 있음
        
        ACF가 패턴이 없다. → 정상성 가질 수 있음
        
    - 단위근 검정 (Unit Root Test)
        
        (추후 공부해보자)
        
        아래와 같은 시계열 에서
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%201.png)
        
        특성방정식
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%202.png)
        
        1. KPSS 검정
            
            - 귀무: 정상성을 가짐
            
            - 대립: 정상성을 가지지 않음
            
        2. ADF 검정 (Augmented Dicky-Fuller Test)
            
            - 귀무: 정상성을 가지지 않음
            
            - 대립: 정상성을 가짐
            

## 시계열 분해

---

- 시계열 성분
    
    yt = St + Tt + Rt 로 덧셈 분해시 표현 가능
    
    St: 계절 성분, Tt: 추세 - 주기 성분, Rt: 나머지 성분
    
    덧셈, 곱셈 분해는 yt - St 나 yt / St로 계절성 조정가능
    
    - cf. Seasonal Variation (계절 성분의 변동)
        
        Increasing/Constant seasonal variation 이 있으며, Increasing은 log 변환(또는 루트변환)으로 constant하게 변경할 수 있다.
        
- 이동평균
    
    중심 이동평균의 주 용도는 데이터에서 추세-주기(trend-cycle)을 측정하는 것
    
- 분해법 종류
    - 고전적 분해
        
        MA를 통해 추세-주기 제거 → 계절성분 측정하기 위해, 계절의 평균을 통해 계절성 제거.
        
        문제점: 
        

## 시계열 회귀

---

Ref. [영상](https://www.youtube.com/watch?v=5QnR4L3KGz4&list=PLpIPLT0Pf7IqSuMx237SHRdLd5ZA4AQwd&index=7) 

- 계절 성분
    - 더미 변수 모형
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%203.png)
        
    - Trigonometric Model
        
        sin과 cos함수를 이용해 주기성을 활용
        
        1년 주기인 경우 L: 12
        
        이후 최소 제곱법으로 구한다.
        
        beta의 의미는 더미 변수 모형보다 해석하기는 어렵다.
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%204.png)
        
- 성장 커브 모형(growth curve models)
    
    추세가 강한 모형
    
    ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%205.png)
    
    양변 로그를 통해 변형하여 최소제곱법등으로 풀 수 있다.
    
- 1차 자기회귀 모형
    
    오차 항에 자기상관이 있다고 가정하고 모델링. 최소제곱법을 사용할 수는 없다. ARIMA에서 더 자세히 한다.
    
    ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%206.png)
    
    - 일반 회귀와 오차항의 자기상관을 고려한 모형 결과 예시 → 변수 중요도가 달라짐
        
        일반선형모형에서 오차항에 자기상관을 추가한 것으로 보임.
        
        해당 논문: [https://socialsciences.mcmaster.ca/jfox/Books/Companion/appendices/Appendix-Timeseries-Regression.pdf](https://socialsciences.mcmaster.ca/jfox/Books/Companion/appendices/Appendix-Timeseries-Regression.pdf)
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%207.png)
        

## 평활 기법 - ETS

---

- 이동평균법 (MA)
    - 단순 이동 평균
    - 선형 이동 평균: ([출처](http://www.kmooc.kr/courses/course-v1:POSTECHk+IMEN677+2021_T2/about), [출처](https://techblog-history-younghunjo1.tistory.com/71))
        
        형 추세 패턴을 따르는 경우 사용(상향/하향 추세)
        
        - 참고
            
            시계열이 선형 추세를 갖는다고 가정: $X_{t} = c+b{t} + a_{t}$
            
            → $E[M_{t}] = c+bt -{{N-1}\over{2}}b$  ⇒ 이것의 기댓값이 단순 이동평균이 c+bt 인데 (N-1/2)b만큼 늦게 따라가기 때문에 이를 이중이동평균값을 더해준다. 상승 하향의 추세곡선은 절편과 기울기라는 2개의 통계량이 있기 때문에 2개의 모수를 추정하기 위해 2개의 통계량을 활용하는 것이다.
            
            ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%208.png)
            
            조건부 기댓값으로 본다.
            
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%209.png)
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2010.png)
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2011.png)
        

- 평활법 (Smoothing )
    - 단순 지수 평활법 (Simple  Exponential Smoothing)
        
        전체 데이터 고려, 알파가 클수록 최근 데이터 고려
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2012.png)
        
    - 이중 지수 평활법 (홀트 선형 추세 기법, Double Exponential Smoothing)
        
        먼저 선형회귀로 trend(회귀계수)와 level(절편)을 구함 → 이 후 새로운 데이터에 대해 절편을 알파(하이퍼파라미터)만큼 업데이트하고, 회귀계수를 베타(하이퍼파라미터)만큼 업데이트
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2013.png)
        
        - Cf 한번 회귀계수 값 확인
            
            ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2014.png)
            
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2015.png)
        
        선형으로 예측하게됨
        
        간단하지만 많이 사용함
        
    - 홀트 윈터 지수평활법 (삼중지수 평활법)
        
        계절 변동항 추가
        
        계절성 변동이 constant / increasing인가에 따라 additive / multiplicative 모형을 사용함.
        
        ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2016.png)
        

- ETS
    
    출처: [https://otexts.com/fppkr/taxonomy.html](https://otexts.com/fppkr/taxonomy.html)
    
    추세(None, 단순지수평활(SES), 이중지수평활(DES)) + 계절성(None, Additive, Multiplicative)
    
    ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2017.png)
    
    ![Untitled](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%89%E1%85%A1%E1%86%BC%E1%84%89%E1%85%A5%E1%86%BC,%20%E1%84%87%E1%85%AE%E1%86%AB%E1%84%92%E1%85%A2,%20ETS%20102754da7b94450c946b46cd820cb3b1/Untitled%2018.png)