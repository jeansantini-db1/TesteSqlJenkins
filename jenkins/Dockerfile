FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl unzip libaio1 git jq wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/oracle

RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linux.x64-21.9.0.0.0dbru.zip && \
    wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-sqlplus-linux.x64-21.9.0.0.0dbru.zip && \
    unzip instantclient-basiclite-linux.x64-21.9.0.0.0dbru.zip && \
    unzip instantclient-sqlplus-linux.x64-21.9.0.0.0dbru.zip && \
    rm *.zip

ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_21_9
ENV PATH=$PATH:/opt/oracle/instantclient_21_9

RUN sqlplus -v
