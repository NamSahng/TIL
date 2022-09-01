# Kaggle discussion - Addressing common questions and what the competition is really about

## ****Addressing common questions and what the competition is really about****

---

출처: [https://www.kaggle.com/c/h-and-m-personalized-fashion-recommendations/discussion/307288](https://www.kaggle.com/c/h-and-m-personalized-fashion-recommendations/discussion/307288)

- 기타 참고
    
    ref) 개인화 추천시스템의 최신 동향 - [https://yamalab.tistory.com/117?category=747907](https://yamalab.tistory.com/117?category=747907)
    
    ![Untitled](Kaggle%20discussion%20-%20Addressing%20common%20questions%20an%2092e0cd14de9249e29e7ccb7f547c2ebc/Untitled.png)
    
- 바스켓: 고객이 지금까지 구매해온 것

## 1. 각 고객이 살 수 있는 후보군을 만드는 것

후보군은 긍정 부정 데이터이다. 부정적인 관측은 없지만, 만들 수 있으며 이러한 후보군을 만드는 것이 가장 중요할 수도 있다. 

전략은 아래와 같다.

- 고객의 바스켓 내의 상품 유사도를 이용한다. (이미지 유사도를 사용할 수도 있음)
- 사용자 기반의 CF
- 가장 최근의 바스켓 (재구매 할 수 있음)
- 거래기록을 제외한 고객 데이터를 활용한 모델 기반의 예측

하나의 전략으로는 좋은 결과를 내기는 어렵다. 여러 전략들이 구축된다면, 아래와 같은 feature를 추가하자.

- 관측 날짜
- 고객 id
- 상품 id
- 다음 주에 구매한 상품(target data)
- 고객의 정적 특징
- 고객의 동적 특징
- 상품의 정적 특징
- 상품의 동적 특징 (상품 인기도 등)
- 전략 점수(? 예측한 결과?)
- 상품과 사용자에 대한 다른 특징들

→ 이러한 테이블을 만들면, CTR과 같은 문제로 변한다. 관측의 소스가 다르다는 것 빼고는 거의 동일하다.

## 2. 고객과 상품간의 랭킹모델 구축

랭킹모델은 분류와 다른 문제이지만, 분류모델로서 사용할 수 있으며 저자는 LGBM을 선호한다. customer id는 랭킹모델의 질의로 볼 수 있다.

## 3. 일반적인 팁

- 데이터 샘플링을 최대한 많이해라.
    
    많은 대회에서 샘플에 feature를 검증을 하는데 사용해야한다. local validation과 리더보드의 상관성이 없을 때까지 샘플을 늘려야 한다.
    
- 여러 다른 아이디어를 빠르게 테스트해라. 빠른 local validation이 핵심이다.

## 4. Questions

Q. negative-feedback 데이터는 어떤 것이 있을까?

A. 이전에 구매한 품목, 지난 주의 1000개의 가장 인기 있는 상품 중 구매하지 않은 상품? 등 많은 것들이 negative sample의 원천이 될 수 있다.