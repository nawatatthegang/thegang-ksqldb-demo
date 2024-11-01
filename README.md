# ksqlDB Demo for KS Session

## Overview

This demo includes 2 main parts:

1. Deploying Kafka Connect and configuring its connectors, including
    1. Debezium for ingesting data from Postgres into Kafka
    2. Kafka Replicator for ingesting data from one Kafka cluster to another
    3. JDBC Sink for ingesting data from Kafka into Postgres
2. Running ksqlDB to transform data in Kafka, focusing on
    1. Creating streams and tables
    2. Performing table-table joins
    3. Performing stream-table joins
    4. Performing stream-stream joins

Before running the demo, deploy the services required by running the following command in the `/docker` directory

```shell
docker compose up -d
```

## Kafka Connect

### Debezium

The connector config can be found in `docker/connectors/source-*-debezium.json`. The differences between each config is:

- `source-flat-avro-debezium.json` ingests the data into Kafka as Avro format
- `source-flat-schema-debezium.json` ingests the data into Kafka as JSON format with schema
- `source-flat-debezium.json` ingests the data into Kafka as JSON format without schema
- `source-full-debezium.json` ingests the data into Kafka as JSON format without schema and includes what a row looks
  like before the update to that row

Each connector can be added by running the following command in the `/docker` directory

```shell
./src-utils.sh add connectors/source-...-debezium.json
```

## Kafka Replicator

The connector config can be found in `docker/connectors/sink-kafka-replicator.json` and can be added by running the
following command in the `/docker` directory

```shell
./sink-utils.sh add connectors/sink-kafka-replicator.json
```

## JDBC Sink

The connector config can be found in `docker/connectors/sink-jdbc-*.json`. Each config reads different topics created by
Debezium into Postgres. Do keep in mind that the flat connector will not work.

## ksqlDB

There are 2 ksqlDB servers created, one for source and one for sink. Each can be accessed by running the following
script.

```shell
./run-ksql.sh src # for source
./run-ksql.sh sink # for sink
```

The scripts can be found in the `/ksql` directory. Make sure to run the SQL scripts with the same number prefix in the
`/data_generator` directory before running each ksql script.

### Prefixes

- `01_*` are for creating the source streams from Debezium
- `02_*` are for creating tables and doing table-table joins
- `03_*` are for doing stream-table joins
- `04_*` are for repartitioning and doing stream-stream joins
- `05_*` are for merging multiple streams into one