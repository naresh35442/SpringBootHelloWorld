FROM tomcat
EXPOSE 8080
CMD echo "Hello Springboot app"
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
