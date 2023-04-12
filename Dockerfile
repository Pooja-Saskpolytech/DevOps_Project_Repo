FROM tomcat:8-jre11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY maven-0.0.1-SNAPSHOT.jar /usr/local/tomcat/webapps/ROOT.jar

EXPOSE 8080
CMD ["catalina.sh", "run"]
