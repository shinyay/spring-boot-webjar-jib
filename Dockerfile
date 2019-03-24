### Builder Image
FROM maven:3.6.0-jdk-11-slim as builder
# Create App Folder for Sources
RUN mkdir -p /build
WORKDIR /build
COPY pom.xml /build
#Download All Required Dependencies into one layer
RUN mvn -B dependency:resolve dependency:resolve-plugins
#Copy Source Code
COPY src /build/src
# Build Application
RUN mvn package

### Runtime Image
FROM maven:3.6.0-jdk-11-slim as runtime
EXPOSE 8080
#Set Application Home Directory
ENV APP_HOME /app
#JVM Options (https://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html)
ENV JAVA_OPTS=""

#Create Base App Directory
RUN mkdir $APP_HOME
#Create Directort to Save Configuration Files
RUN mkdir $APP_HOME/config
#Create Directory with Application Logs
RUN mkdir $APP_HOME/log

VOLUME $APP_HOME/log
VOLUME $APP_HOME/config

WORKDIR $APP_HOME
#Copy Executable Jar File from the Builder Image
COPY --from=builder /build/target/*.jar app.jar

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar" ]
#Second option using shell form:
#ENTRYPOINT exec java $JAVA_OPTS -jar app.jar $0 $@
