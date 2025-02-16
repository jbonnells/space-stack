#!/bin/bash

if [ -n "$1" ]; then
  container_id="$1"
else
  docker ps
  read -rp "Enter the container ID you want to connect to: " container_id
fi

docker exec -it "$container_id" bash
