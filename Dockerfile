FROM openjdk:11-jdk-alpine
ENV TZ="Asia/Seoul"
ARG JAR_FILE=build/libs/*.war
COPY ${JAR_FILE} app.war

HEALTHCHECK --interval=5s --timeout=5s --start-period=15s --retries=10 CMD wget http://localhost:8080/actuator/health --quiet --output-document - >/dev/null 2>&1

ENTRYPOINT ["java","-jar","/app.war"]