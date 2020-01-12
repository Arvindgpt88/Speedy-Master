FROM java:8-jre

EXPOSE 9999

CMD ["java", "-jar", "/opt/sparktodo-jar-with-dependencies.jar"]
