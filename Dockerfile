FROM maven:3.8.6-openjdk-11 as build
WORKDIR /app
COPY . ./
RUN mvn clean install

FROM openjdk:11
COPY --from=build /app/target/*.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]