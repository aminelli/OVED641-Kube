FROM azul/zulu-openjdk:21-jre
WORKDIR /app
COPY target/demo-0.0.1-SNAPSHOT.jar /app/demo.jar
ENTRYPOINT [ "java", "-jar", " /app/demo.jar" ]
EXPOSE 8080