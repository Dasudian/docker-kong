FROM centos:7
MAINTAINER Mengz, mz@dasudian.com

ENV KONG_VERSION="0.8.3" \
  KONG_CONFIG="/etc/kong/kong.yml"

# Default CONFIG
  # DATABASE="postgres" \
  # PG_HOST="postgres.db" \
  # PG_DB="kong" \
  # PG_USER="kong" \
  # PG_PASSWD="kong"

RUN yum install -y https://github.com/Mashape/kong/releases/download/$KONG_VERSION/kong-$KONG_VERSION.el7.noarch.rpm && \
  yum clean all

COPY config.docker/kong.yml /etc/kong/

COPY setup.sh /

CMD /setup.sh && kong start

EXPOSE 8000 8443 8001 7956
