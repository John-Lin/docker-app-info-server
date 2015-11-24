FROM linton/nodejs

MAINTAINER John Lin <linton.tw@gmail.com>

# Download applications infomation server
RUN apt-get update && \
    apt-get install -qy --no-install-recommends unzip wget && \
    wget -O /opt/appInfoServer.zip "https://github.com/John-Lin/app-info-server/archive/master.zip" --no-check-certificate && \
    unzip -q /opt/appInfoServer.zip -d /opt && \
    cd /opt/appInfoServer && npm install

# Clean up APT and zip when done.
RUN apt-get clean && rm -rf /opt/appInfoServer.zip

WORKDIR /opt/appInfoServer

CMD ["npm", "start"]
