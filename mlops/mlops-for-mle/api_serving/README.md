

## DB workflow
  
```bash

$ python download_model.py --model-name sk_model --run-id <run-id>
$ docker compose up -d                                                                                      
$ curl -X POST http://localhost:8000/predict -H "Content-Type: application/json" -d '{"sepal_length": 6.7, "sepal_width": 3.3, "petal_length": 5.7, "petal_width": 2.1}'
$ docker compose down -v
```