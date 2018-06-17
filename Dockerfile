FROM tomcat
EXPOSE 8080
CMD /Users/testtest/.jenkins/workspace/Test1/java -jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
