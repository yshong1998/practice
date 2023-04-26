FROM openjdk:11-jdk-alpine
ENV TZ="Asia/Seoul"
ARG JAR_FILE=build/libs/practice-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

HEALTHCHECK --interval=5s --timeout=5s --start-period=15s --retries=10 CMD wget http://localhost:8080/actuator/health --quiet --output-document - >/dev/null 2>&1

ENTRYPOINT ["java","-jar","/app.jar"]