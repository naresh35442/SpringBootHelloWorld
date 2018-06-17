FROM tomcat
COPY SpringBootHelloWorld-0.0.1-SNAPSHOT.jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
EXPOSE 7070
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
CMD java -jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
