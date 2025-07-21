#!/bin/bash

cd ./java/demo
mvn clean install -DskipTests

docker build -t spring-app-demo:1.1.0 .
cd ../..
