# Recsys 용어

---

![Untitled](Recsys%20%E1%84%8B%E1%85%AD%E1%86%BC%E1%84%8B%E1%85%A5%20a711f7e5a536499dbe987e0c55633bd1/Untitled.png)

- Terminology
    - **Rating** : 유저의 우선순위 매기기.
        - **Explicit rating** : 유저의 직접적인 스코어링
        - **Implicit rating**: 유저의 간접적인 스코어링. Ex) 영화를 틀고 5분만에 끄고 다신 돌아오지 않음. → 부정적으로 implicit rating
    - **Prediction**: system이 이 유저가 경험하지 않은 데이터에 대한 스코어링을 예측한 결과
    - **Recommendation**: Prediction으로 나온것을 UX 단에서 보여주는것
    - **Content**: 추천이 되는 대상의 내용
    - **Collaborative**: 다른 유저가 만들어낸 rating 등의 데이터를 내가 추천받는것에 사용하는것.

- Approaches
    - **None-personalized and stereotyped**: 국가, 성별 등으로 그룹을 나누어서 추천
    - **Product Association**: X 를 샀으면, 다른 사람들이 Y 를 샀으니 당신도 Y 를 좋아할것이다 등의 접근
    - **Content-Base**: content의 특징을 파악하고, 어떤 특징을 주로 좋아했는지 축적해 비슷한 특징이 있는 content 를 추천
    - **Collaborative**: 내가 좋아할 것들은, 다른 사람이 미리 경험해둔것들을 기반으로 추천

- Preferences
    - **Explicit**: Rating, Review, Vote
        - Difficulties with Ratings
            - reliability & accuracy
            - preference change
            - meaning
    - **Implicit**: Click, Purchase, Follow, Reading time
        - 유저의 행동에 기반한 데이터
        - privacy (사용자에게는 안좋은 경험일 수 있음)

- Prediction & Recommendation
    
    Prediction과 Recommendation은 종종 함께 사용된다. 사용자에게 어떻게 보여주어야 하는지는 UX와 표현들(you might like this와 같은 조심스러운 표현)과 밀접한 관계가 있다.
    
    - **Prediction**: 해당 상품을 얼마나 좋아할지를 예측
        
        각 상품들을 수치적으로 평가해 고객에게 제공할 수 있지만, 고객의 판단에 반하는 예측일 경우 신뢰를 잃을 수 있음.
        
    - **Recommendations**: 고객이 좋아할만한 상품이나 필요한 상품을 제안하는 것.
        
        선택지의 형태로 제공할 수 있지만, 선택지 이외의 항목을 유저가 확인할 수 없는 것이 단점이다
        
- Domains of Recommendation
    
    아래와 같이 컨텐츠나 속성에 따라 추천의 방식이 달라 질 수 있음
    
    - contents
        - News, Information, “text”
        - Product, vendors, bundles
        - Matchmaking
        - Sequences (ex. music playlist)
    - property
        - New Items(영화, 책): 경험하지 못한 content
        - Old Items(음악, 식료품): Experience 기반 이전 Experience

- Purposes of Recommendation
    - Recommendation themselvses: Sales, Information
    - Education of user/customer
    - Build a community of users/customers around products or content

- Target of Recommendation
    - 전문가 / 일반인 등

- Personalization level
    - Generic: everyone receives same recommendations
    - Demographic: matches a target group
    - Ephemeral(임시): matches current activity
    - Persistent(지속): matches long-term interests

- Privacy and Trustworthiness
    
    과도한 개인화는 고객의 프라이버시 문제로 고객의 신뢰를 잃을 수 있음. 
    

- 평가지표
    - 예측 정확도
    - 추천 속도
    - 연관성`Relevance` : 추천된 아이템이 유저에게 관련이 있는가?
    - 다양성`Diversity` : 추천된 Top-K 아이템에 얼마나 다양한 아이템에 추천되는가?
    - 새로움`Novelty` : 얼마나 새로운 아이템이 추천되고 있는가?
    - 참신함`Serendipity` : 유저가 기대하지 못한 뜻밖의 아이템이 추천되는가?
    

## Ref

---

- [https://wonjun.oopy.io/4076d6a9-0305-41f1-bee8-d62a896f209d](https://wonjun.oopy.io/4076d6a9-0305-41f1-bee8-d62a896f209d)
- [https://github.com/jihoo-kim/awesome-RecSys](https://github.com/jihoo-kim/awesome-RecSys)
- [https://velog.io/@redgem92/추천화-시스템-04.-추천-시스템의-평가-지표](https://velog.io/@redgem92/%EC%B6%94%EC%B2%9C%ED%99%94-%EC%8B%9C%EC%8A%A4%ED%85%9C-04.-%EC%B6%94%EC%B2%9C-%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%9D%98-%ED%8F%89%EA%B0%80-%EC%A7%80%ED%91%9C)