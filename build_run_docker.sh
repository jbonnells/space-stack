#!/bin/bash

docker build -t space-stack .
docker run  -p 8000:8000 -it space-stack