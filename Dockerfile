FROM tomcat
EXPOSE 8080
CMD java -jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
