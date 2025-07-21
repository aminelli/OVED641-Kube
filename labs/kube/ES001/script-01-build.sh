#!/bin/bash

cd ./java/demo
mvn clean install -DskipTests

docker build -t spring-app-demo:1.1.0 .

docker run -d -p 8080:8080 --name webapp01 --hostname webapp01 spring-app-demo:1.1.0

docker logs -f webapp01