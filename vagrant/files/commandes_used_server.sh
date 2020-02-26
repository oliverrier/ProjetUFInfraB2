#!/bin/sh

sudo su -
systemctl disable firewalld
setenforce 0
# yum check-update
# yum update -y kernel
# yum update -y
dnf remove -y podman-manpages
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf list docker-ce
dnf install docker-ce --nobest -y
systemctl start docker
systemctl enable docker


# curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose



mkdir /srv/docker/
mkdir /srv/docker/grafana
echo "INFLUXDB_DATA_ENGINE=tsm1
INFLUXDB_REPORTING_DISABLED=false
INFLUXDB_DB=opentsdb" >> /srv/docker/grafana/env.influxdb
echo "GF_INSTALL_PLUGINS=grafana-clock-panel,briangann-gauge-panel,natel-plotly-panel,grafana-simple-json-datasource
" >> /srv/docker/grafana/env.grafana
mkdir data
chown -R 472:472 /srv/docker/grafana/data
echo "version: '3'
services:

#   dbpostgre:
#     image: postgres:11-alpine
#     environment:
#       POSTGRES_DB: wiki
#       POSTGRES_PASSWORD: wikijsrocks
#       POSTGRES_USER: wikijs
#     volumes:
#       - db-data:/var/lib/postgresql/data
#     networks:
#       wikijs:
#         aliases:
#           - db

#   wiki:
#     image: requarks/wiki:2
#     depends_on:
#       - dbpostgre
#     environment:
#       DB_TYPE: postgres
#       DB_HOST: db
#       DB_PORT: 5432
#       DB_USER: wikijs
#       DB_PASS: wikijsrocks
#       DB_NAME: wiki
#     ports:
#       - '8080:3000'
#     networks:
#       wikijs:
#         aliases:
#           - wikijs

  influxdb:
    image: influxdb:latest
    container_name: influxdb
    ports:
      - '8086:8086'
    env_file:
      - '/srv/docker/grafana/env.influxdb'
    volumes:
      # Data persistency
      # sudo mkdir -p /~/docker/influxdb/data
      - influxdb-data:/var/lib/influxdb
      - /srv/docker/influxdb.conf:/etc/influxdb/influxdb.conf
    networks:
      grafana:
        aliases:
          - influx

  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - '3000:3000'
    env_file:
      - '/srv/docker/grafana/env.grafana'
    user: '0'
    links:
      - influxdb
    volumes:
      # Data persistency
      # sudo mkdir -p /srv/docker/grafana/data; chown 472:472 /root/docker/grafana/data
      - grafana-data:/var/lib/grafana
    networks:
      grafana:
        aliases:
          - grafana


volumes:
  db-data:
  grafana-data:
  influxdb-data:


networks:
  wikijs:
  grafana:
" >> /srv/docker/docker-compose.yml
touch /srv/docker/influxdb.conf
echo "[meta]
  dir = '/srv/docker/influxdb/meta'

# [data]
#   dir = '/srv/docker/influxdb/data'
#   engine = 'tsm1'
#   wal-dir = '/var/lib/influxdb/wal'
  
[[opentsdb]]
  enabled = true
  bind-address = ':8086'
  database = 'opentsdb'
  " >> /srv/docker/influxdb.conf
chown vagrant:vagrant /srv/docker/docker-compose.yml
chmod 755 /srv/docker/docker-compose.yml