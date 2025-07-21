FROM azul/zulu-openjdk:21-jre
WORKDIR /app
COPY ./target/demo-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT [ "java", "-jar", "demo.jar" ]
EXPOSE 8080