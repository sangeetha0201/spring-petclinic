FROM sandeep4642/java-11:2

RUN mkdir /apps

COPY target/*.jar /apps/spring-petclinic.jar

EXPOSE 8080

CMD ["java", "-jar", "spring-petclinic.jar"]
