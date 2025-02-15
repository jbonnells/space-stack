#!/bin/bash

docker ps
read -rp "Enter the container ID you want to connect to: " container_id
docker exec -it "$container_id" bash
