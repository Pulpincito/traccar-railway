FROM openjdk:17-jdk-slim

ENV TRACCAR_VERSION=5.11

RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/traccar/traccar/releases/download/v${TRACCAR_VERSION}/traccar-linux-64-${TRACCAR_VERSION}.zip -O /tmp/traccar.zip \
    && unzip /tmp/traccar.zip -d /opt/traccar \
    && rm /tmp/traccar.zip

WORKDIR /opt/traccar

EXPOSE 8082

CMD ["java", "-jar", "tracker-server.jar"]
