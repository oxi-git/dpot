FROM alpine

# Based on Marco Ochse great Glutton / T-Pot template

# Setup apk
RUN apk -U --no-cache add \
    build-base \
    git \
    go \
    g++

# Setup go, medpot
RUN    export GOPATH=/opt/go/ && \
    # mkdir /opt && \
    mkdir /opt/go && \
    cd /opt/go && \
    mkdir ./src && cd src && \
    git clone https://github.com/schmalle/medpot.git && \
    go get -d -v github.com/davecgh/go-spew/spew && \
    go get -d -v github.com/go-ini/ini && \
    go get -d -v github.com/mozillazg/request && \
    go get -d -v go.uber.org/zap && \
    cd /opt/go/src/medpot && \
    go build medpot && \
    cp ./medpot /usr/bin/medpot

RUN cd /opt/go/src/medpot/template && \ 
    mkdir /var/log/medpot && \
    cp ./medpot.log  /var/log/medpot/medpot.log && \
    mkdir /data && \
    mkdir /data/medpot && \
    cp ./ews.xml /data/medpot/ && \
    cp ./dummyerror.xml /data/medpot/ && \
    touch /etc/ews.cfg


# Setup user, groups and configs
RUN    addgroup -g 2000 medpot && \
    adduser -S -s /bin/ash -u 2000 -D -g 2000 medpot && \
    mkdir -p /var/log/medpot

# Clean up
RUN    apk del --purge build-base \
    git \
    go \
    g++ && \
    rm -rf /var/cache/apk/* \
    /opt/go \
    /root/dist

# Start medpot
WORKDIR /opt/go/src/medpot
USER medpot:medpot
VOLUME [ "/var/log/medpot" ]
ENTRYPOINT [ "medpot" ]
EXPOSE 2575