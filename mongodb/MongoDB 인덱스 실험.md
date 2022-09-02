# MongoDB 인덱스 실험

## 실험 탐색 공간

---

- `data` : document의 index 시간이 ASC, DESC로 삽입되는 경우
- `db_index` : collection의 index 설정이 ASC(1), DESC(-1)로 설정하는 경우
- `unique` : collection의 index 설정을 unique하게 하는 경우 (True, False)
- `no_index` : index를 설정하지 않은 경우

## 데이터

---

- Upbit API 의 분봉
    
    인덱스 설정: `candle_date_time_kst`
    
    ```python
    [{'market': 'USDT-BTC',
      'candle_date_time_utc': '2022-06-01T03:00:00', # 
      'candle_date_time_kst': '2022-06-01T12:00:00', # => dt.datetime으로 변경
      'opening_price': 31577.814,
      'high_price': 31577.814,
      'low_price': 31524.802,
      'trade_price': 31565.865,
      'timestamp': 1654054297711,
      'candle_acc_trade_price': 32358.17887078,
      'candle_acc_trade_volume': 1.02595656,
      'unit': 60}]
    ```
    

## 실험 설정 / 결과

---

- 삽입:
    
    위 탐색공간 변화에 따라 100개의 document의 50회 평균 삽입 속도 확인
    
    ![Untitled](MongoDB%20%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%83%E1%85%A6%E1%86%A8%E1%84%89%E1%85%B3%20%E1%84%89%E1%85%B5%E1%86%AF%E1%84%92%E1%85%A5%E1%86%B7%208b1cd47019404f4c88abeb5d0b9d26a5/Untitled.png)
    
- 조회
    
    58860 개의 document `오름차순 조회` / `내림차순 조회` / `조건부 조회`의 50회 평균 조회 결과
    
    ![Untitled](MongoDB%20%E1%84%8B%E1%85%B5%E1%86%AB%E1%84%83%E1%85%A6%E1%86%A8%E1%84%89%E1%85%B3%20%E1%84%89%E1%85%B5%E1%86%AF%E1%84%92%E1%85%A5%E1%86%B7%208b1cd47019404f4c88abeb5d0b9d26a5/Untitled%201.png)
    

## 결론

---

- 삽입과 조회의 횟수 비교를 통한 인덱스 설정

## 코드

---

[pymongo-exercise/pymongo_index_check.ipynb at main · instork/pymongo-exercise](https://github.com/instork/pymongo-exercise/blob/main/notebooks/pymongo_index_check.ipynb)