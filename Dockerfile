FROM openjdk
COPY target/devops-1.0.war /usr/bin
CMD cd /usr/bin
CMD java -jar devops-1.0.war
