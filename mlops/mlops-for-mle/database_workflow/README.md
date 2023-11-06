

## DB workflow
  
```bash
docker run -d \
  --name postgres-server \
  -p 5432:5432 \
  -e POSTGRES_USER=myuser \
  -e POSTGRES_PASSWORD=mypassword \
  -e POSTGRES_DB=mydatabase \
  postgres:14.0
```

```bash
PGPASSWORD=mypassword psql -h localhost -p 5432 -U myuser -d mydatabase
```

```bash
python table_creator.py
```

```bash
python data_insertion.py
```

```bash
python data_insertion_loop.py
```

```bash
docker build -t data-generator .
docker network create my-network
docker network connect my-network postgres-server
docker run -d \
  --name data-generator \
  --network "my-network" \
  data-generator "postgres-server"
docker stop <running-data-generator-id>
```

```bash
docker rm --force postgres-server data-generator
```

```bash
# docker compose build --no-cache
docker compose up -d
```
```bash
docker exec -it data-generator /bin/bash
PGPASSWORD=mypassword psql -h postgres-server -p 5432 -U myuser -d mydatabase

```
```sql
select * from iris_data;
```
```bash
docker compose down -v
```

