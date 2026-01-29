# Build stage
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM tomcat:10.1.20-jdk21-temurin-jammy
LABEL maintainer="kastrov"
LABEL version="2.0.0"
LABEL description="Amazon Prime Video Clone Application"

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from build stage
COPY --from=build /app/target/amazon-prime-clone.war /usr/local/tomcat/webapps/ROOT.war

# Create non-root user for security
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat
USER tomcat

# Expose Tomcat port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Set environment variables
ENV CATALINA_OPTS="-Xms512m -Xmx1024m -XX:+UseG1GC -Djava.security.egd=file:/dev/./urandom"
ENV JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8"

# Start Tomcat
CMD ["catalina.sh", "run"]
