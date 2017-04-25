FROM debian

RUN apt-get update &&  \
    apt-get install -y ssl-certificates && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://github.com/gilbertchen/duplicacy-cli/releases/download/v1.2.5/duplicacy_linux_x64_1.2.5 /duplicacy
RUN chmod +x /duplicacy

ENTRYPOINT ["/duplicacy"]
