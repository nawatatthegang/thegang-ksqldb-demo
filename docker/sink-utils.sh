#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "Usage:"

  echo -e "./utils.sh get [connector name]"
  echo -e "\tGets the config for the connector"
  echo -e "./utils.sh status [connector name]"
  echo -e "\tGets the status for the connector"

  echo -e "./utils.sh add [path to connector config]"
  echo -e "\tAdds connector to Kafka Connect"
  echo -e "./utils.sh update [connector name] [path to new connector config]"
  echo -e "\tUpdates connector specified by name with the new config"
  echo -e "./utils.sh delete [connector name]"
  echo -e "\tRemoves connector from Kafka Connect"

  echo -e "./utils.sh pause [connector name]"
  echo -e "\tPauses connector"
  echo -e "./utils.sh resume [connector name]"
  echo -e "\tResumes connector"

  echo -e "./utils.sh stop [connector name]"
  echo -e "\tStops connector"
  echo -e "./utils.sh restart [connector name]"
  echo -e "\tRestarts connector"
fi

if [[ $1 == "get" ]]; then
  curl "http://localhost:8084/connectors/$2" 2>/dev/null | jq
elif [[ $1 == "status" ]]; then
  curl "http://localhost:8084/connectors/$2/status" 2>/dev/null | jq

elif [[ $1 == "add" ]]; then
  curl -X POST -H "Content-Type:application/json" -d "@$2" http://localhost:8084/connectors 2>/dev/null
elif [[ $1 == "update" ]]; then
  curl -X PUT -H "Content-Type:application/json" -d "$(jq '.config' $3)" "http://localhost:8084/connectors/$2/config" 2>/dev/null
elif [[ $1 == "delete" ]]; then
  curl -X DELETE "http://localhost:8084/connectors/$2" 2>/dev/null

elif [[ $1 == "pause" ]]; then
  curl -X PUT "http://localhost:8084/connectors/$2/pause" 2>/dev/null
elif [[ $1 == "resume" ]]; then
  curl -X PUT "http://localhost:8084/connectors/$2/resume" 2>/dev/null

elif [[ $1 == "stop" ]]; then
  curl -X PUT "http://localhost:8084/connectors/$2/stop" 2>/dev/null
elif [[ $1 == "restart" ]]; then
  curl -X POST "http://localhost:8084/connectors/$2/restart?includeTasks=true" 2>/dev/null
fi
