FROM openjdk
COPY target/devops-1.0.war /usr/bin
CMD /usr/bin/java -jar /usr/bin/devops-1.0.war
