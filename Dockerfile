FROM tomcat
EXPOSE 8080
COPY *.jar /usr/local/
CMD /Users/testtest/.jenkins/workspace/Test1/java -jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
