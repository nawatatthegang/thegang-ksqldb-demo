FROM confluentinc/cp-kafka-connect-base:7.6.1
RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-avro-converter:latest && \
    confluent-hub install --no-prompt confluentinc/kafka-connect-replicator:latest