#!/bin/bash

# basic
setenforce 0
yum update -y
yum autoremove -y

# install docker
# cf https://docs.docker.com/install/linux/docker-ce/centos/
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# cf https://serverfault.com/questions/990187/dnf-cannot-install-the-best-candidate-for-the-job pour cette commande :
dnf install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable --now docker

# add vagrant user to docker group
usermod -aG docker vagrant

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /bin/docker-compose
chmod +x /bin/docker-compose

# create directories for all docker services
mkdir -p /srv/docker/monitoring
mkdir -p /srv/docker/wiki
chown vagrant:vagrant /srv/docker/monitoring
chown vagrant:vagrant /srv/docker/wiki
mv /home/vagrant/monitoring-compose.yml /srv/docker/monitoring/docker-compose.yml
mv /home/vagrant/wiki-compose.yml /srv/docker/wiki/docker-compose.yml
docker-compose -f /srv/docker/monitoring/docker-compose.yml up -d && \
docker-compose -f /srv/docker/wiki/docker-compose.yml up -d