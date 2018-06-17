FROM tomcat
ADD target/SpringBootHelloWorld-0.0.1-SNAPSHOT.jar /usr/*jar
EXPOSE 7070
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
CMD java -jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
