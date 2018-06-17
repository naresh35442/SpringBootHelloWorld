FROM tomcat
ADD crash.sh /
CMD /bin/bash /crash.sh
EXPOSE 7070
ENTRYPOINT ["java", "-jar", "SpringBootHelloWorld-0.0.1-SNAPSHOT.jar"]
