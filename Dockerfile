FROM frolvlad/alpine-glibc

RUN apk add --update --no-cache libaio nodejs nodejs-npm

ADD ./oracle/linux/ .

RUN mkdir -p /opt/oracle \
  && unzip instantclient-basiclite-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
  && unzip instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle  \
  && rm *.zip \
  && mv /opt/oracle/instantclient_12_2 /opt/oracle/instantclient \
  && ln -s /opt/oracle/instantclient/libclntsh.so.12.1 /opt/oracle/instantclient/libclntsh.so \
  && ln -s /opt/oracle/instantclient/libocci.so.12.1 /opt/oracle/instantclient/libocci.so

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"
ENV OCI_HOME="/opt/oracle/instantclient"
ENV OCI_LIB_DIR="/opt/oracle/instantclient"
ENV OCI_INC_DIR="/opt/oracle/instantclient/sdk/include"