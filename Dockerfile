FROM tomcat
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
