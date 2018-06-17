FROM tomcat
EXPOSE 7070
CMD java -jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
