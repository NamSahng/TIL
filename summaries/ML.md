# ML

- **머신러닝이란**
    
    데이터 기반의 알고리즘. 기존의 알고리즘이 어떤 지시들의 집합을 나열해 우리가 원하는 결과를 나타내주길 원하고 한다면, 머신러닝은 하나하나 지시들을 명시할 수 없는 것들을 푸는 것으로 볼 수 있다. 예를들어 얼굴인식 모델을 개발한다고 하면, 눈 코 등의 특징을 하나하나 나열할 수 없어 데이터로 메타한 알고리즘을 작성하는 것과 같다.
    
- **Bias & Variance**
    
    최적 오차(베이즈 오차)가 0이라고 가정하고, 검증과 학습의 같은 확률분포에서 왔다는 가정이 주어짐.
    
    - Bias - Underfitting: 학습 오차는 검증오차 모두 큰 경우.
        
        해결방안: 모델을 크게, Regularization을 줄여본다. 에러 분석. SOTA수준 모델, 하이퍼파라미터 튜닝, feature 추가
        
    - Variance - Overfitting: 학습 오차는 작으나 검증 오차가 큰 경우.
        
        해결방안: 학습데이터 추가, normalization, 정규화 추가, 데이터 증강, 에러 분석, 하이퍼파라미터 튜닝
        
- **Linear Regression**
    
    최소제곱법으로 회귀 계수를 추정할 수 있으며, Y|X 조건부 분포는 평균이 회귀선이고, 오차의 분산인 정규분포를 따르는 것으로 설계한다.
    
    - $Y = \alpha+\beta X + \epsilon$
        
        $Y|X \sim N(\alpha + \beta X, \sigma^{2}_{\epsilon})$
        
    - 선형회귀 모형에서 관심을 갖는 것
        
        S: 유의성 / D: 방향 / E: 효과의 크기 - X의 단위의 증가가 Y의 유의미한 변화를 야기하는가 /
        
        M: 모형 적합성 - 과적합, 과소적합
        
    - 회귀분석 모형의 진단
        
        가우스 마르코프 가정(독립성, 선형성, 오차분산 일정성, 정규성) 확인
        
        외적 타당성(외삽추론이 있는지), 극단적 관측값, 다중공선성 등 확인
        
    - 가장 보편적 추론방법인 이유
        
        오차 최적화문제로만 본다면 가장 안좋은 방법일 수 있지만,
        
        신뢰구간을 이용한 불확실성 표현 가능
        
        해석의 용이함: 단위 증가당 변화
        
        국지적 설명에 유용: 테일러전개는 국지적으로 1차 선형 함수로 근사 가능
        
- **Supervised Learning**
    - **Generalized Linear Models**
        
        종속변수가 실수형태가 아니라, 범주형, 양의 실수 등인 경우를 위해 선형회귀의 일반화한 것이다. 이를 위해, 종속변수는 지수분포족의 확률분포를 따른다고 가정하고, 연결함수를 사용해 일반선형모형을 만든다. MLE의 모수 추정은 일반선형회귀와 같이 closed-form solution(주어진 집합으로부터 주어진 함수와 수학적 연산의 관점에서 주어진 문제를 풀 수 있는 문제)이 아니기 때문에, 경사하강법이나 반복가중 최소제곱법(뉴튼랩슨법)으로 구한다.
        
        - Binary Logistic Regression
            
            종속변수가 0, 1의 값을 가지며, 분포는 Y|X ~ Bern(p) 로 설정하며, 이를 위해,
            
            $y=\boldsymbol{X\beta}$ → $\ln({{p}\over{1-p}}) = \boldsymbol{X\beta}$ 와 같이 종속변수에 연결함수를 logit function(log odds)으로 설정 하여 선형회귀와 같이 실수값을 갖도록 한다. odds 함수는 p/(1-p)로 성공확률/실패확률이며 이는 0~무한대의 범위를 가지므로 로그를 씌움으로 XB와 같이 실수범위를 가진다.
            
        - Multinomial Logistic Regression
            
            k개의 클래스에 대해서, k-1개의 이진로지스틱 회귀의 선형식을 만든다.(베타 파라미터는 k-1 * feature 개수가 됨) 이 후, P(Y=1) + P(Y=2) + P(Y=3) = 1이라는 식과 P(Y=1)  / P(Y=2) , P(Y=2) + P(Y=3) 을 이용해 P(Y=1), P(Y=2), P(Y=3) 에 대한 식을 구할 수 있다.
            
            [https://www.youtube.com/watch?v=0rQC7_lShzs](https://www.youtube.com/watch?v=0rQC7_lShzs&list=PLetSlH8YjIfXMOuS4piqzJRvSZorDnNUm&index=10)
            
    - **Naive Bayes**
        
        베이즈 공식을 활용한 사후확률이 가장 큰 클래스로 분류하는 모델. likelihood의 feature들 간의 조건부 독립을 가정. feature가 이산형 확률변수일 경우 베르누이/다항 분포, 연속형 확률변수일 경우 정규분포로 가능도 모형을 설정.
        
        - 조건부 독립
            
            Y가 주어질 때 x1이, Y가 주어질 때 x2에 대해 어떠한 정보도 제공하지 않음
            
            P(x1, x2 | Y) = P(x1|Y) P(x2|Y) 
            
    - **SVM**
        - **SVC**
            
            주어진 데이터에서 클래스간의 결정 경계 범위(margin)가 가장 큰 선형 경계면을 찾아 분류. 이진 분류에서는 $\bold{w\cdot x}+b$의 부호에 따라 분류한다. margin을 r이고, 결정경계의 수직인 벡터를 w라 할 때 문제는 다음과 같이 제약조건이 있는 최적화 문제가 된다.
            
             $\max_{\bold{w},b} r = {{2}\over{||\bold{w}||_{2}}}, \ \ \ s.t\ \  (\bold{w}x_{j} + b) \ge 1 , \forall{j}$
            
            여기에 오분류되는 샘플에 대한 문제를 위해, 최적화 식과 제약조건 식에 슬랙변수를 추가한다. (hinge loss)
            
        - **kernel SVM**
            
            커널은 다른 고차원 공간으로 보낸 두 벡터의 내적으로 정의한다. 이 때, 고차원 변환후 내적의 값이 내적 후 변환한 값과 같도록 하는 symmetric & positive semi-definite matrix를 사용한다. dual problem의 두 벡터에 대한 내적하는 부분을 커널을 이용한 부분으로 바꿔주면 된다.
            
        - **SVR**
            
            회귀식이 위아래 margin과 같은 튜브를 생성해 margin 이내에 있다면, 손실이 없도록하는 것이 특징
            
            [https://leejiyoon52.github.io/Support-Vecter-Regression/](https://leejiyoon52.github.io/Support-Vecter-Regression/)
            
            [https://www.youtube.com/watch?v=tZy3uRv-9mY](https://www.youtube.com/watch?v=tZy3uRv-9mY)
            
            [https://www.youtube.com/watch?v=hVbe6B6z9Hg](https://www.youtube.com/watch?v=hVbe6B6z9Hg&list=PLbhbGI_ppZISMV4tAWHlytBqNq1-lb8bz&index=30)
            
            [https://ratsgo.github.io/machine learning/2017/05/23/SVM/](https://ratsgo.github.io/machine%20learning/2017/05/23/SVM/)
            
    - **Decision Tree**
        - classification
            
            리프노드의 가장 많이 있는 데이터의 클래스로 분류
            
            분기 기준은 Information Gain이다. 어떤 feature에 대하여 각 데이터 포인트와  다 고려해 계산해 보며 확인해, IG가 가장 큰 feature와 데이터 점을 기준으로 구분한다. Information Gain은 엔트로피나 지니불순도를 통해 계산한다.
            
            split을 너무 많이 하면 과적합이 일어날 수 있어, 리프노드의 개수를 제한하거나, 트리 최대 깊이를 제한하거나, 리프노드의 최소 데이터 수를 제한 한다.
            
            [https://lightgbm.readthedocs.io/en/latest/Parameters-Tuning.html](https://lightgbm.readthedocs.io/en/latest/Parameters-Tuning.html)
            
        - regression
            
            종속변수가 연속형인 경우에는 최소제곱 손실이 가장 작도록, 분기를 수행한다. 예측은 최종 리프 노드 그룹의 평균으로 예측한다.
            
            분기할 변수에 대한 분할 점은 각 데이터 포인트마다 다 고려해 계산해 보며 확인한다
            
            [https://www.youtube.com/watch?v=xki7zQDf74I](https://www.youtube.com/watch?v=xki7zQDf74I)
            
    - **Ensemble Learning**
        - **Bagging**
            
            boostrap aggregating의 약자로, 데이터의 다양성을 위해 복원 추출한 샘플들을 부스트랩이라 한다. 부스트랩에 사용되지 않은 데이터는 검증데이터로 활용한다. 이 후, 부스트랩들을 학습한 모델들의 결과의 평균을 취하거나 가장 많이 선택한 클래스 등으로 합계(aggregate)를 취하는 방법이다.
            
            예측결과를 입력으로 하는 새로운 모델을 만드는 것을 스태킹이라 한다.
            
            보통 상대적으로 모델의 복잡도가 높은 모델들로 부스트랩을 학습한다.
            
            - 복잡도가 높은 모델: DT, ANN, SVM
            
            - 복잡도가 낮은 모델: Logistic Regression, LDA, K-NN with large K
            
            [https://github.com/pilsung-kang/Business-Analytics-IME654-/](https://github.com/pilsung-kang/Business-Analytics-IME654-/)
            
        - **Random Forest**
            
            다수의 결정 트리를 배깅한다. 부스트랩마다 데이터 뿐만 아니라, 변수도 랜덤하게 사용해 트리를 여러 개 구성해 예측하는 방법. 
            
            변수 중요도 계산
            
            - 해당 feature가 분기로 설정될 때, 불순도의 평균
            
            - 학습에 사용되지 않은 OOB을 검증할 때, 각각 feature들에 대해 랜덤하게 섞을 때의 성능의 변화를 확인
            
            - 모든 변수를 사용했을 때의 성능을 특정 변수를 빼고 학습했을 때의 성능 차이 확인
            
            [https://velog.io/@vvakki_/랜덤-포레스트에서의-변수-중요도Variable-Importance-3가지](https://velog.io/@vvakki_/%EB%9E%9C%EB%8D%A4-%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8%EC%97%90%EC%84%9C%EC%9D%98-%EB%B3%80%EC%88%98-%EC%A4%91%EC%9A%94%EB%8F%84Variable-Importance-3%EA%B0%80%EC%A7%80)
            
        - **AdaBoost**
            
            어떤 약한 모델로 분류 → 학습데이터에서 잘 못맞춘 데이터에 보다 샘플링이 더 잘 되도록 가중치 부여 → 다시 다른 약한 모델로 분류 →  반복....  
            
            → 만들어진 약한 모델들을 결합
            
        - **Gradient Boosting Model**
            
            Gradient Descent + Boosting 으로, GBM은 Regression, Classification, Ranking 수행가능. 이해 측면에서는 Regression이 가장 쉬움. → 손실함수만 다름
            
            다음 모델은 이전 모델의 잔차를 학습하도록 y데이터를 변경해 학습. 잔차의 학습은 과적합의 위험이 있음
            
            ![Untitled](ML%204179ce334dce4442846cf91407b50f60/Untitled.png)
            
            - 정규화 방안
            
            1. subsampling: 잔차에서는 기존 학습데이터의 80% 정도씩만 사용
                
                ![Untitled](ML%204179ce334dce4442846cf91407b50f60/Untitled%201.png)
                
            2. regularzation: 잔차를 학습한 모델의 가중치는 적게 부여함
                
                ![Untitled](ML%204179ce334dce4442846cf91407b50f60/Untitled%202.png)
                
            3. Early stopping
        - **XGBoost**
            
            GBM에서 일어난 여러 문제들을 보완.
            
            트리의 분기 시 split point를 구간(bucket)을 이용해 근사화 하는 방법으로 변경. (Approximate Algorithm for Split finding)
            
            결측치는 모두 양 사이드로 밀어낸 후 Information Gain의 차이를 본 뒤, 더 큰 쪽으로 세팅(Sparsity-aware split finding)
            
            미리 feature 들에 대해 정렬해 저장해 놓음
            
            미리 가장 많이 사용하는 Gradient나 Hessian을 캐시에 저장
            
            [https://exupery-1.tistory.com/183?category=963328](https://exupery-1.tistory.com/183?category=963328)
            
            [https://www.youtube.com/watch?v=VHky3d_qZ_E](https://www.youtube.com/watch?v=VHky3d_qZ_E)
            
        - **LGBM**
            
            GBM모델은 Feature를 선택하기 위해 모든 Feauture의 IG를 계산, 분할 점을 찾기 위해 모든 데이터를 확인 → 속도 저하 개선
            
            - split points: gradient가 높은 상위 데이터는 계속해서 고정하고, gradient가 작은 인스턴스는 랜덤하게 drop되도록 함, OHEM Loss와 유사한듯 (Gradient-based One-Side Sampling)
            
            - 두 feature를 정보손실이 최대한 안되게 묶어 학습하는 방법 (Exclusive Feature Bundling)
            

- **Unsupervised Learning**
    - **PCA**
        
        데이터의 차원을 축소하는 가장 기본적인 방법. 가장 의미있는 기저로 데이터를 표현하는 것을 목적으로 하며, 새로운 기저는 노이즈를 필터링하거나 숨겨진 구조를 찾기를 기대.
        
        - 과정
            
            공분산행렬 계산 → EVD → 고유값이 큰 K개의 큰 고유벡터 선정 → 고유벡터로 데이터 재표현
            
        - PCA의 가정
            
            선형성(데이터가 비선형구조인 경우 차원 축소 성능 하락)
            
            분산이 가장 큰 것이 중요한 특성
            
            직교성(새로운 기저는 서로 독립)
            
        - 평가: 사용한 고유값/전체 고유값, 왼쪽 식의 Elbow point 등
    - **K-means & GMM**
        
        군집화 방법으로 GMM은 군집에 대한 확률적 할당이 가능하며, K-means는 그렇지 않다. 둘다 EM알고리즘에 기반해 작동한다.
        
        - EM: Expectation 부분에서는 각 데이터마다 각 latent(클러스터)일 확률을 계산한다. K-means는 hard assignment이므로 1,0으로 계산된다. Maximization 부분에서는 각 클러스터의 파라미터에 대하여, Expectation 부분에서 구했던 확률을 토대로 MLE를 수행해 latent(클러스터)의 파라미터를 조정한다.
        - 초기화방안(K-means++): 처음 데이터 포인트는 임의로 잡고, 다음 데이터 포인트는 거리가 멀수록 잘 샘플링 되도록 샘플링 확률 분포를 조정해 K개의 초기 군집점을 선정한다.
            
            [https://lovit.github.io/nlp/machine learning/2018/03/19/kmeans_initializer/](https://lovit.github.io/nlp/machine%20learning/2018/03/19/kmeans_initializer/)
            
    - **t-SNE**
        - **SNE (Stochastic Neighbor Embedding)**
            
            LLE와 유사하게 데이터에서 거리가 가까운 데이터 끼리의 거리를 보존하는 것이 거리가 먼 데이터와의 거리를 보존하는 것 보다 중요하게 생각하는 차원 축소 방법. 
            
            LLE와 두 점이 이웃인 것을 확률적으로 나타내는 것이 다르다.
            
            고차원에서 어떤 한 점을 기준으로 다른 데이터 포인트와의 확률적 거리 분포(가우시안)가, 저차원에서 해당 점을 기준으로한 다른 데이터 포인트와의 확률적 거리 분포(가우시안)와 유사하도록 손실함수를 설정한다. → KL Divergence
            
        - **t-SNE**
            
            저차원의 거리분포를 가우시안 분포로 설정할 경우, 가우시안 분포가 너무 뾰족해서 거리가 먼 정보가 반영이 안됨. 저차원의 거리분포만 t 분포로 변경
            
            [https://www.youtube.com/watch?v=INHwh8k4XhM](https://www.youtube.com/watch?v=INHwh8k4XhM)
            
- **Losses**
    - **MAE & MSE & RMSE**
        
        ${{1}\over{N}}\sum_{i=1}^{N}|\hat{y_{i}} - y_i|$
        
        ${{1}\over{N}}\sum_{i=1}^{N}(\hat{y_{i}} - y_i)^{2}$
        
        $\sqrt{MSE}$
        
        [https://blmoistawinde.github.io/ml_equations_latex/#mean-absolute-errormae](https://blmoistawinde.github.io/ml_equations_latex/#mean-absolute-errormae)
        
    - **CE**
        
        위 Multi class, 아래 binary인 경우
        
        ![Untitled](ML%204179ce334dce4442846cf91407b50f60/Untitled%203.png)
        
        [https://nuguziii.github.io/dev/dev-002/](https://nuguziii.github.io/dev/dev-002/)
        
        - Focal Loss: CE에서 쉬운 샘플(픽셀)에 대하여 손실을 덜 주는 방향으로 수행하는 방식
        - OHEM: 2가지 방식이 있음, CE에서 하나는 어떤 확률 값 이하인 픽셀만 계산하는 방식, 전체 픽셀중 몇 퍼센트의 픽셀만 취하는 방식
    - **Tripplet Loss**
        
        || f(A)- f(P)|| ≤ ||f(A) - f(N)||
        
        → || f(A)- f(P)|| - ||f(A) - f(N)|| ≤  -알파  (알파는 둘다 0으로 만들지 않기 위해, 사용하는 svm의 마진과 같은 것)
        
        위 식이 만족하면, loss를 굳이 음수로 줄 필요가 없기 때문에 아래같이 함.
        
        ![Untitled](ML%204179ce334dce4442846cf91407b50f60/Untitled%204.png)
        
        A, P, N을 고를 때 AP, AN 이 유사한 이미지를 골라야 학습이 잘 되며, facenet paper에서 어떻게 고르는지 확인 가능함
        
        cf) [https://norman3.github.io/papers/docs/arcface.html](https://norman3.github.io/papers/docs/arcface.html)
        
- **Metrics**
    - **False Positive**
        - True/False: 맞음/틀림
        - Positive/Negative 예측한 상태
        
        실제로 아닌데 맞다고 함
        
        이진 분류기의 Threshold를 낮추면 FP는 줄어들고, Precision은 높아지며, FPR이 증가든다.
        
        (Threshold를 낮추면 True Negative 값도 줄어든다)
        
    - **False Positive Rate**
        
        FPR = FP/(FP+TN) = 1-TNR
        
        ROC curve의 x축
        
    - **Precision**
        
        Precision = TP/(TP+FP)
        
        FP에 대한 패널티를 줌
        
    - **ROC Curve (**Receiver Operation Characteristic)
        
        ![Untitled](ML%204179ce334dce4442846cf91407b50f60/Untitled%205.png)
        
        Threshold를 낮추면, Positive로 예측하는 경향이 거지므로 TP, FP를 모두 크게한다.
        
    - **AUROC**
        
        모든 분류 입계값에 걸쳐 성능을 집계하는 측정값을 제공함
        
    - **F1-score**
        
        Recall, Precision의 조화평균 = 2/(P^-1+R^-1)
        
    - **mAP**
        - **Object Detection**
            
            (PR Curve의 면적)/(클래스 수)
            
        - **Recsys**
            
            $MAP@k = {{1}\over{U}}\Sigma_{u=1}^{U} {{1}\over{\min(m,k)}}\Sigma_{k=1}^{\min(n,k)} P(k)\times rel(k)$
            
            n: 추천한 아이템
            
            m: 사용자의 클릭/구매한 수
            
            U: 사용자
            
            rel: 0, 1 지시함수
            
            [https://www.kaggle.com/competitions/h-and-m-personalized-fashion-recommendations/overview/evaluation](https://www.kaggle.com/competitions/h-and-m-personalized-fashion-recommendations/overview/evaluation)