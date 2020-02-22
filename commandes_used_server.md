# Commandes à suivre pour mettre en place le serveur

## Installation

Installer docker et docker-compose : 

```
dnf remove -y podman-manpages
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf list docker-ce
dnf install docker-ce --nobest -y
systemctl start docker
systemctl enable docker


curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose



cd /srv/
mkdir grafana
cd grafana/
touch env.influxdb
echo "INFLUXDB_DATA_ENGINE=tsm1
INFLUXDB_REPORTING_DISABLED=false" >> env.influxdb
touch env.grafana
echo "GF_INSTALL_PLUGINS=grafana-clock-panel,briangann-gauge-panel,natel-plotly-panel,grafana-simple-json-datasource
" >> env.grafana
mkdir data
cd /srv/
mkdir docker/
touch docker-compose.yml
chown -R 472:472 /srv/docker/grafana/data
echo "version: "3"
services:

  dbpostgre:
    image: postgres:11-alpine
    environment:
      POSTGRES_DB: wiki
      POSTGRES_PASSWORD: wikijsrocks
      POSTGRES_USER: wikijs
    volumes:
      - db-data:/var/lib/postgresql/data
    networks:
      wikijs:
        aliases:
          - db

  wiki:
    image: requarks/wiki:2
    depends_on:
      - dbpostgre
    environment:
      DB_TYPE: postgres
      DB_HOST: db
      DB_PORT: 5432
      DB_USER: wikijs
      DB_PASS: wikijsrocks
      DB_NAME: wiki
    ports:
      - "8080:3000"
    networks:
      wikijs:
        aliases:
          - wikijs

  influxdb:
    image: influxdb:latest
    container_name: influxdb
    ports:
      - "4242:4242"
    env_file:
      - '/srv/docker/grafana/env.influxdb'
    volumes:
      # Data persistency
      # sudo mkdir -p /~/docker/influxdb/data
      - /srv/docker/influxdb/data:/var/lib/influxdb
      - /srv/docker/influxdb.conf:/etc/influxdb/influxdb.conf
    networks:
      grafana:
        aliases:
          - influx

  grafana:
    image: grafana/grafana:latest
    container_name: grafana
    ports:
      - "3000:3000"
    env_file:
      - '/srv/docker/grafana/env.grafana'
    user: "0"
    links:
      - influxdb
    volumes:
      # Data persistency
      # sudo mkdir -p /srv/docker/grafana/data; chown 472:472 /root/docker/grafana/data
      - /root/docker/grafana/data:/var/lib/grafana
    networks:
      grafana:
        aliases:
          - grafana


volumes:
  db-data:

networks:
  wikijs:
  grafana:
" >> docker-compose.yml
chown vagrant:vagrant docker-compose.yml
chmod 755 docker-compose.yml
```
 
 
 
 
 
 
 
 
 
 
 
 
 









 
 
 
 ## SELINUX

 [tuto Selinux](https://www.tecmint.com/disable-selinux-on-centos-8/)

 setenforce Permissive


## SysLog

[tuto Syslog](https://www.unixmen.com/logging-journald-rhel7centos7/)

[root@localhost ~]# vim /etc/rsyslog.conf

```bash
#rsyslog configuration file
# For more information see /usr/share/doc/rsyslog-*/rsyslog_conf.html
# If you experience problems, see http://www.rsyslog.com/doc/troubleshoot.html
#### MODULES ####
# The imjournal module bellow is now used as a message source instead of imuxsock.
$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
$OmitLocalLoggin off
$ModLoad imjournal # provides access to the systemd journal
#$ModLoad imklog # reads kernel messages (the same are read from journald)
#$ModLoad immark # provides --MARK-- message capability
# Provides UDP syslog reception
#$ModLoad imudp
#$UDPServerRun 514
# Provides TCP syslog reception
#$ModLoad imtcp
#$InputTCPServerRun 514
#### GLOBAL DIRECTIVES ####
```

[root@localhost ~]# vim /etc/rsyslog.d/listen.conf

```bash
$SystemLogSocketName /run/systemd/journal/syslog
```


