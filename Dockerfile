FROM openjdk:11

RUN mkdir /apps

COPY ./build/libs/spring-petclinic-2.6.0.jar /apps/docker.jar

EXPOSE 8080

CMD ["java", "-jar", "/apps/docker.jar"]
