FROM centos:7
MAINTAINER Marco Palladino, marco@mashape.com

RUN yum -y install wget

RUN wget https://github.com/Mashape/kong/releases/download/0.3.2/kong-0.3.2.el7.noarch.rpm \
    && yum install -y kong-0.3.2.el7.noarch.rpm

VOLUME ["/etc/kong/"]

COPY config.docker/kong.yml /etc/kong/kong.yml

CMD kong start

EXPOSE 8000 8001
