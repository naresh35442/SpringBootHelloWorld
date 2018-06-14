FROM tomcat
COPY /Users/Shared/Jenkins/Home/workspace/Demo5/target/SpringBootHelloWorld-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/
EXPOSE 8080
