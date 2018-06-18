FROM alpine:3.7
EXPOSE 8080
CMD java -jar /Users/testtest/.jenkins/workspace/Test1/target/SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
