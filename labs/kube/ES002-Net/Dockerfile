# k8sutils
FROM debian:12
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install --no-install-recommends dnsutils && \
    apt-get -y install wget && \
    apt-get -y install curl && \
    apt-get -y install htop && \
    apt-get -y install nano && \
    apt-get -y install net-tools && \
    apt-get -y install iputils-ping && \
    apt-get -y install tcpdump && \
    apt-get -y install traceroute && \
    apt-get -y install nmap && \
    apt-get -y install iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
