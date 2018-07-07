# Loader for the instruments database

## Setup database schema

    psql picobank -f database/initdb/schema.sql

## Running migrations

    goose -dir database/migrations && goose -dir database/migrations postgres "user=instruments password=raspberry host=localhost port=5432 dbname=picobank sslmode=disable search_path=etl" up

Reverting back to an empty schema:

    goose -dir database/migrations postgres "user=instruments password=raspberry host=localhost port=5432 dbname=picobank sslmode=disable search_path=etl" down-to 0

## Loading data

    scripts/pgloader-all.sh