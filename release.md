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
./bin/goslash eval "Goslash.ReleaseTasks.migrate"
```
