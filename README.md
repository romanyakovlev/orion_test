
## Установка зависимостей
```sh
$ pip install -r requirements.txt
```
## Установка бэкапа базы данных

```sh
$ /usr/bin/pg_dumpall --file "/backup.sql" --host "localhost" --port "5432" --username "postgres" --no-password --database "postgres" --verbose --role "postgres"
```

## Запуск приложения

```sh
$ python orion.py -u 'postgresql://postgr:postgres@localhost/orion_test'
```
