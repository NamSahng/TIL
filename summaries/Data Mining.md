# Data Mining

- Random Projection
    - Gaussian Random Projection
        
        n x m차원 데이터 n x p 로 줄이고 싶다면 그냥 표준정규분포에서 m x p 행렬을 샘플링해 곱하고 1/루트(p)로 곱해주면 된다. 단 데이터 샘플에 대한 distortion 비율은 Johson-Lnderstrausss Lemma 정리에 따라 허용하는 오차 내에서의 차원 p를 정하는 것이 좋긴하다.
        
        ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled.png)
        
        장점: 
        
        데이터가 너무 고차원 적이라 PCA/MDS와 같은 방법이 어려운 경우. 실시간 데이터와 같이 데이터에 접근하기 어려운 경우 → 실제로 PCA와 성능이 거의 차이가 없는 논문도 꽤 많음
        
        연산량 비교는 PCA와 차이가 굉장히 많이남
        
        ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%201.png)
        
        cf. 근접이웃을 알고리즘을 찾는 Locality Sensitive Hashing 알고리즘, Spotify Annoy 등에 사용
        
        - Approximate Nearest Neighbor 찾기 알고리즘 비교: https://github.com/erikbern/ann-benchmarks
        
    - 작동원리
        - 어떤 임의 벡터 2개는 굉장히 큰 고차원에서는 almost orthogonal하다. 따라서 고차원 벡터로 구성한 행렬은 직교행렬과 유사함
            
            → 그냥 랜덤한 고차원 행렬 U^T U ~ I 가 됨
            
            첫 번째 가정이 큰 수의 법칙과 중심극한의 정리로 된다는데 크게 이해가 안됨;;;
            
            [https://math.stackexchange.com/questions/995623/why-are-randomly-drawn-vectors-nearly-perpendicular-in-high-dimensions](https://math.stackexchange.com/questions/995623/why-are-randomly-drawn-vectors-nearly-perpendicular-in-high-dimensions)
            
            Hercht-Neilson, 1994, “Context vectors: general purpose approximate meaning representations self-organized from raw data.”
            
        - Johnson-Linderstrauss Lemma(보조정리)
            
            고차원 공간의 점들은 저차원 공간으로 거리가 거의 보존된 상태로 선형변환 할 수 있다. n개의 데이터가 있고 약 $\epsilon$ 정도의 오류를 허용한다면, p정도 이상의 저차원으로 변환이 가능하다. 이 때 고차원의 feature 수가 아니라 고차원의 데이터 개수만 보는 것을 알 수 있음.
            
            (아래식은, 위키, scikit-learn 등 조금씩 다 배수가 다르긴함 ;)
            
            ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%202.png)
            
            ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%203.png)
            
            - 참고.
                
                [https://www.youtube.com/watch?v=bfS7JAjiOMI&t=195s](https://www.youtube.com/watch?v=bfS7JAjiOMI&t=195s)
                
                [https://en.wikipedia.org/wiki/Johnson–Lindenstrauss_lemma](https://en.wikipedia.org/wiki/Johnson%E2%80%93Lindenstrauss_lemma)
                
                [https://scikit-learn.org/stable/auto_examples/miscellaneous/plot_johnson_lindenstrauss_bound.html#sphx-glr-auto-examples-miscellaneous-plot-johnson-lindenstrauss-bound-py](https://scikit-learn.org/stable/auto_examples/miscellaneous/plot_johnson_lindenstrauss_bound.html#sphx-glr-auto-examples-miscellaneous-plot-johnson-lindenstrauss-bound-py)
                
                [https://lovit.github.io/machine learning/vector indexing/2018/03/28/lsh/](https://lovit.github.io/machine%20learning/vector%20indexing/2018/03/28/lsh/)
                
- K-means
    - EM:
        
        K-means, GMM을 학습할 때 사용하는 알고리즘으로, Expectation 부분과 Maximization 부분으로 나뉜다. Expectation 부분에서는 각 데이터마다 각 latent일 확률을 계산한다. K-means는 hard assignment이므로 1,0으로 계산된다. Maximization 부분에서는 각 클러스터의 파라미터에 대하여, Expectation 부분에서 구했던 확률을 토대로 MLE를 수행해 latent의 파라미터를 조정한다.
        
    - 초기화 방법 (K-means++)
        
        K개의 클러스터의 중앙점을 초기화할 때 위치가 멀리 떨어져야 더 좋은 군집화 방법과 학습이 빠르게 된다. 
        
        방법: 
        
        1. 첫 시작 클러스터의 중앙점을 임의로 c1 선택 
        2. 다음 ct는 다른 점들에서 먼 point가 선택되도록 아래와 같은 확률 분포에서 샘플링해 설정 → K번 반복
        
        ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%204.png)
        
        → ct-1과 ct+1의 거리는 가까울 수 있는데 이는 ct-1을 선택할 때 해당 포인트에서 D만큼 거리가 가까운 점들은 모두 제거하는 방법으로 해결 가능하다.
        
        ref. [https://lovit.github.io/nlp/machine learning/2018/03/19/kmeans_initializer/](https://lovit.github.io/nlp/machine%20learning/2018/03/19/kmeans_initializer/)
        

- spherical k-means
    
    아래와 같은 코사인 거리를 활용해 K-means를 수행
    
    ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%205.png)
    
    - 기존 K-means에서 input 데이터를 l2 norm으로 나누어 unit vector로 만들어줌
    - Centroid Update 할 때, l2 norm으로 나누어 unit vector로 만들어줌
    
    K-means ++ 는 Sphere K-means에서는 의미가 없다. 블로그 저자는 “Improving spherical k-means for document clustering”를 통해 similar_cut 초기화 방안을 제안 함. 아직 설명은 없으나 코드는 있음
    
    [https://lovit.github.io/nlp/machine learning/2018/10/16/spherical_kmeans/](https://lovit.github.io/nlp/machine%20learning/2018/10/16/spherical_kmeans/)
    
- DBSCAN
    - 밀도기반 클러스터링으로 군집으로 허용할 최소 군집 개수와 군집 내 거리 epsilon 값을 설정해 군집화하는 알고리즘
    - 특징:
        - K-Means와 같이 클러스터의 수를 정하지 않아도됨
        - 클러스터의 밀도에 따라서 클러스터를 서로 연결하기 때문에 기하학적인 모양을 갖는 군집도 잘 찾을 수 있음
        - Noise를 통해 이상치 검출 가능
    
    → 실제로 Maceral 프로젝트에서 cosine 거리기반 DBSCAN을 통해 이상 군집 설정해 이상 이미지 검출
    
- spotify-annoy
    
    Random Projection을 활용해 차원을 축소한 후, 임의의 점 2개를 선택해, 두점을 잇는 직선과 수직인 hyperplane으로 공간을 나눈다. hyperplane 기준으로 위 아래 있는 면적에서 다시, 2점을 선택하고 최종 공간이 K개 남을 때까지 공간을 나누어 트리를 구성한다.
    
    ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%206.png)
    
    새로운 점이 들어오면, 해당 점이 루트의 평면보다 위인지 아래인지를 통해 탐색해 최종 노드에 들어갈 수 있으며, 최종 노드의 K개의 점들과의 비교를 통해 근접이웃을 찾을 수 있다.
    
    위와 같은 트리를 여러 개 만들어 더 정확성이 높은 근접 이웃을 찾을 수 있음. 
    
    단순하게 거리 비교알고리즘만 비교 시: O(N) → O(logN), RP 부분을 수행하면 더 줄어들 것임
    

- LSH
    
    Locality Sensitive Hashing은 데이터를 해싱했을 때, 유사한 데이터 끼리 동일한 버킷에 포함될 가능 성이 높도록 설계된 해싱함수를 사용한다.
    
    ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%207.png)
    
    - shingling: K-gram으로 document를 토큰화한다.
    - MinHash: ([https://www.youtube.com/watch?v=bQAYY8INBxg&t=498s](https://www.youtube.com/watch?v=bQAYY8INBxg&t=498s), )
        
        → 이부분을 Random Projection으로 수행가능하다 이를 SimHash라고 함.
        
        ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%208.png)
        
        n-gram의 요소가 행이고 열이 각 문서를 의미한다 했을 때, 인덱스를 무작위 순열로 섞은다음 1번 인덱스부터 해당 문서가 r,c의 요소가 1이라면 해당 인덱스를 signature로 요소로 갖는 signature 행렬을 만들어준다.
        
        이 때, Signature의 두 열에 대한 자카드 유사도의 기댓값은, 기존 문서의 자카드 유사도와 같아진다. Signature Matrix를 크게 할수록 기존 문서의 자카드 유사도와 같아질 것이다.
        
    - LSH (Band Partition Algorithm)
        
        목표: 문서의 자카드 유사도가 적어도 t인 문서를 찾자
        
        ![Untitled](Data%20Mining%20c364ff35a25f496d9fc4fd8fba019fe2/Untitled%209.png)
        
        - Band Partition Algorithm
            - signature matrix에서 r개의 row단위로 b개의 band를 만든다.
            - 각 band의 document들을 모두 k개의 bucket으로 해싱한다
            - A라는 문서가 B라는 문서랑 bucket이 적어도 한번이라도 겹친다면, B문서는 유사문서 후보가 될 수 있다.
            - 유사한 문서를 같은 bucket에 넣기위해 b와 r을 조정한다.
        - Ref
            
            [https://towardsdatascience.com/understanding-locality-sensitive-hashing-49f6d1f6134](https://towardsdatascience.com/understanding-locality-sensitive-hashing-49f6d1f6134)
            
            [https://haandol.github.io/2019/05/25/minhash-algorithm-explained.html](https://haandol.github.io/2019/05/25/minhash-algorithm-explained.html)
            
            [https://haandol.github.io/2019/05/28/lsh-minhash-explained.html](https://haandol.github.io/2019/05/28/lsh-minhash-explained.html)
            
            [http://www.mmds.org/](http://www.mmds.org/)