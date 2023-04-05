FROM maven:3.8.6-openjdk-11 as build
WORKDIR /app
COPY . ./
RUN mvn clean install

FROM openjdk:11
LABEL maintainer="dxcOCBC"
COPY --from=build /app/target/*.jar /usr/local/lib/app.jar
# EXPOSE 9001
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]