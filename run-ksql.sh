#!/bin/bash

if [[ $1 == 'src' ]]; then
  port=8088
else
  port=8089
fi

docker exec -it ksqldb-cli ksql "http://ksqldb-server-$1:$port"
