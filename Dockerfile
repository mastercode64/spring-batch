FROM openjdk:8-jdk-alpine

VOLUME /tmp
WORKDIR /app

COPY ./build/libs/batch-example-0.0.1-SNAPSHOT.jar /app/batch-example.jar

ENV TIMEZONE=America/Sao_Paulo

RUN sh -c 'touch /app/batch-example.jar' && echo "${TIMEZONE}" > /etc/timezone

CMD java -Dspring.profiles.active=${ENVIRONMENT} -Dspring.batch.job.names=${SPRING_BATCH_JOB_NAMES} -jar batch-example.jar