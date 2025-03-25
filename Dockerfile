FROM openjdk:17-slim

WORKDIR /data

ENV MINECRAFT_VERSION=1.21.5-rc2
ENV MINECRAFT_JAR=server.jar
ENV MINECRAFT_DOWNLOAD_URL=https://piston-data.mojang.com/v1/objects/82b8d395a4984987224b97c7df08ced03f78bdff/server.jar
ENV MINECRAFT_MEM_MIN=1G
ENV MINECRAFT_MEM_MAX=2G

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O ${MINECRAFT_JAR} ${MINECRAFT_DOWNLOAD_URL}

RUN echo "eula=true" > eula.txt

EXPOSE 25565

CMD java -Xms${MINECRAFT_MEM_MIN} -Xmx${MINECRAFT_MEM_MAX} -jar ${MINECRAFT_JAR} nogui
