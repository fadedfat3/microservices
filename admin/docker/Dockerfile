FROM openjdk:8u272-jre-slim
ADD admin-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","-Duser.timezone=GMT+8","-Dspring.profiles.active=product","/app.jar"]