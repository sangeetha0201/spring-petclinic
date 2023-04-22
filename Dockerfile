FROM sandeep4642/java-11:1

RUN mkdir /apps

COPY ./*.jar /apps/spring-petclinic.jar

EXPOSE 8080

CMD ["java", "-jar", "/apps/spring-petclinic.jar"]
