# Releases

## Running DB Migration
1. After DB image is up, ensure Database is created:

```
docker exec -it goslash_db_1 sh
su postgres

# goslash_prod for prod db
createdb goslash_dev
```

2. Run ReleaseTasks

```
docker-compose run db-migrations
```

Alternatively:
```
docker exec -it goslash_web_1 sh
./bin/goslash eval "Goslash.ReleaseTasks.migrate"
```


## Docker Compose

### Running on Remote

```
docker-compose --context goslash -f prod-docker-compose.yml --env-file .env.secret up -d
```
### Checking Docker config
```
 docker-compose -f prod-docker-compose.yml --env-file .env.secret config
```
