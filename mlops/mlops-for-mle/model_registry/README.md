## mode

```bash
make all
```
```bash
python save_model_to_registry.py --model-name "sk_model"
```
```bash
python load_model_from_registry.py --model-name "sk_model" --run-id "RUN_ID"
```
```bash
all-clean
```


- changes
    - minio healhcheck
        - https://github.com/minio/minio/issues/18373
        - https://github.com/minio/minio/issues/18373#issuecomment-1793010380