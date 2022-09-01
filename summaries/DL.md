# DL

- **딥러닝이란**
- **오버피팅은 어떻게 해결하는가**
    - **데이터 증강**
    - **drop out**
    - **norm penalty / weight decay**
        
        weight 들의 norm(제곱 또는 절대값)이 특정 크기 이하를 갖도록 정규화하는 것이다. 이를 라그랑주 승수법을 통해 새로운 손실함수를 만들면, 정규화항을 추가하는 것이 된다.
        
        l1 norm은 특정 featue의 weight이 0이 될 수 있어 feature selection을 하는 효과를 볼 수 있지만 미분이 불가능해 수치최적화 기법을 통해 최적화를 해야한다.
        
        [https://sanghyu.tistory.com/13](https://sanghyu.tistory.com/13)
        
    - **batch normalization**
        
        x가 입력이라면, 배치별로 표준화(평균을 빼고 표준편차로 나누는)를 수행한 다음에, 입력에 감마와 베타를 더한다. 그리고, 감마와 베타를 학습파라미터로 설정해 학습한다.
        
        이는 데이터를 베타라는 새로운 평균과 감마제곱이라는 새로운 분산으로 데이터를 뿌려주는 것과 같은데, 입력 배치가 너무 각단 값에 몰리거나 0근처(sigmoid 경우 0근처에서는 너무 선형과 같아서)인 경우, 비선형 활성함수를 사용하더라도 선형처럼 작동하는 경우가 있어, 잘 학습할 수 있는 곳으로 뿌리는 것이다.
        
        [https://www.youtube.com/watch?v=m61OSJfxL0U](https://www.youtube.com/watch?v=m61OSJfxL0U)
        
- **Curse of Dimensionality**
    
    데이터의 차원이 증가할수록 해당 공간의 크기(부피)가 기하급수적으로 증가하기 때문에 동일한 개수의 데이터의 밀도는 차원이 증가할수록 급속도로 희박해짐. → 차원이 증가할수록 데이터의 분포 분석 또는 모델추정에 필요한 샘플 데이터의 개수가 기하급수적으로 증가
    
- **CNN**
    
    convolution filter라는 제약을 주어, 지역적으로 근처에 있는 입력끼리 학습해 특징을 추출하도록 하는 뉴럴 빌딩블락. Num filter, filter size, padding 등으로 변화를 줄 수 있다.
    
- **RNN**
    
    시퀀스 데이터를 처리하기 위해 개발된 뉴럴빌딩 블락
    
    입력 시퀀스와 출력 시퀀스의 길이에 따라 one2one, one2many, many2one, many2many로 나눌 수 있으며, 현재 timestamp에 대한 은닉층은 이전 timestamp에 은닉층의 파라미터를 입력받는 것이 특징이다. gradient vanishing, long term dependency 문제 등이 있었다.
    
    RNN이 기계 번역과 같은 seq2seq에 들어가게 되면, 가장 마지막 hidden state만 context vector(decoder의 input)로 사용하기 때문에 가장 마지막 input의 영향이 크고, long term의 context는 반영하기 어려운 점이 있다.
    
    이를 위해 LSTM, GRU가 개발되었지만 완벽하게 완화되지 않았다.
    
- **Attention**
    
    Attention Mechanism은 현재 output에는 어떤 input을 주목해야 하는지 확인하기 위해, 임베딩된 모든 hidden state를 decoder에 다 넘겨준다.
    
    ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled.png)
    
    seq2seq 이외에도 일반적으로 하나의 입력에 sigmoid를 통과시키고 기존 입력에 합치는 게이트 메커니즘을 사용하는 모듈도 어떤 입력이 중요한지 선택하기 때문에 어텐션 메커니즘으로 불린다.
    
- **Transformer**
    
    [https://jalammar.github.io/illustrated-transformer/](https://jalammar.github.io/illustrated-transformer/)
    
    [https://www.youtube.com/watch?v=Yk1tV_cXMMU](https://www.youtube.com/watch?v=Yk1tV_cXMMU)
    
    기존 seq2seq에서의 Attention 메커니즘은 sequential하게 작동해 병렬화가 어려움을 극복함
    
    ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled%201.png)
    
    - Encoder
        - Input Embedding
            
            word2vec, glove와 같은 pretrained ebedding 활용
            
        - Positional Encoding
            
            위치 정보를 보존하기 위해 사용, sin 과 cos 함수를 이용해, 각 포지션에 해당하는 위치의 값은 0이되고 멀리갈 수록 큰 값을 가지도록 함.
            
        - Self Attention
            - Query: 현재 단어의 표현
            - Key: 쿼리에 대한 레이블과 같은 것
            - Value: value는 실제 단어의 표현
            
            입력 임베딩에 대해 Q, K, V에 해당하는 임베딩 행렬을 행렬곱을 한 뒤에, 나온 q, k에 대해서는 어떤 값이 중요한지 softmax를 취하고 v를 행렬곱을 한다.
            
            ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled%202.png)
            
            ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled%203.png)
            
        - Multi head Attention은 위 어탠션을 여러개 둔 뒤, weight matrix를 행렬곱을 이용해 최종적으로 입력 임베딩의 차원과 같도록 한다. 이후 입력 임베딩을 더하고 layer norm한다.
            
            ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled%204.png)
            
        - Feed Forward Network
    - Decoder
        
        Seq2Seq를 위한 구조이므로 디코더의 첫 단어 예측을 위한 정보는 두 번째 단어 이후의 정보를 가지면 안되기 때문에 masking을 해준다. 순차적으로 하지 않게 하기 위해 q, k 임베딩 이후, 행렬 곱 이후 오른 쪽 위 대각 성분을 모두 음의 무한대로 바꿔준다. 최종적으로 softmax계산시 0으로 보내지는 효과를 가진다.
        
        ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled%205.png)
        

- SSL
    - SimSiam
        - 기존 SimCLR이나 Moco와 달리 Negative Pair, 큰 배치 사이즈, 모멘텀 인코더(Negative Pair를 위한 큐)가 필요없이 의미 있는 representation learning 수행. stop gradient는 collapsing을 방지
        
        Collapsing: 데이터의 변화에 상관없이 일정한 벡터를 뽑는 것
        
        cf. mode collapse(in GAN): Generator 가 다양한 output을 만들지 않는 현상
        
        - 학습방법
            
            하나의 이미지를 데이터 증강 샘플러에 넣어 나온 두 이미지를 CNN인코더 - Projector - Predictor (모두 weight 공유함) 에 넣음
            
            서로 다른 이미지에 대하여 Projector에 나온 벡터와 Predictor에 나온 벡터에 대하여 코사인 거리를 계산 후 Backpropagation을 수행
            
            Projector에 나온 벡터에 대해서는 pytorch의 detach를 통해 stop gradient를 수행
            
            이미지의 표현 벡터로는 Projector/Predictor MLP가 아닌 CNN인코더만 거친 표현을 사용함
            
            ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled%206.png)
            
            (마세랄 이미지 출처: [https://coalandcarbonatlas.siu.edu/coal-macerals/scroll.php](https://coalandcarbonatlas.siu.edu/coal-macerals/scroll.php))
            
            논문에서 모델의 학습은 collapse를 확인하기 위해, 각 output feature 기준으로 std를 계산한 값들의 평균이 $1/\sqrt{d}$ 가 유지될 때까지 학습. (d: feature output 벡터크기)
            
            ![Untitled](DL%203a54e4c4b61e4fabb4f163d87a236474/Untitled%207.png)