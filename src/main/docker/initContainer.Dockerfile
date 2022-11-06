FROM gradle:jdk11 as gradleimage
ARG VERSION
WORKDIR /home/gradle/source
COPY . /home/gradle/source
RUN ./gradlew jar -P version=${VERSION}

FROM busybox
ARG VERSION
COPY --from=gradleimage /home/gradle/source/build/libs/keycloak-metrics-spi-${VERSION}.jar /keycloak-metrics-spi/
