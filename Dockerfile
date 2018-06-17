FROM tomcat
ADD /Users/Shared/Jenkins/Home/workspace/Demo5/target/SpringBootHelloWorld-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/
EXPOSE 7070
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
CMD java -jar SpringBootHelloWorld-0.0.1-SNAPSHOT.jar
