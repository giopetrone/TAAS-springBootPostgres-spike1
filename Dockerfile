FROM openjdk:13-alpine
RUN addgroup -S spring && adduser -S spring -G spring
#USER spring:spring
VOLUME /tmp
EXPOSE 8080
ARG DEPENDENCY=target
#ARG DEPENDENCY=target/dependency
#COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
#COPY ${DEPENDENCY}/META-INF /app/META-INF
#COPY ${DEPENDENCY}/BOOT-INF/classes /app
ADD ${DEPENDENCY}/*.jar app.jar
#ENTRYPOINT ["java","-cp","app:app/lib/*","pl.codeleak.samples.springboot.tc.SpringBootTestcontainersApplication"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
