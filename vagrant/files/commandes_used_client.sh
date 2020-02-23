#!/bin/sh

sudo su -
setenforce 0
dnf install http://repo.okay.com.mx/centos/8/x86_64/release/okay-release-1-3.el8.noarch.rpm -y
dnf install libuv-devel -y
dnf install git zlib-devel libuuid-devel libmnl gcc make git autoconf automake pkgconfig curl findutils -y
git clone https://github.com/netdata/netdata.git --depth=100
cd netdata/
./netdata-installer.sh


# add notification /etc/netdata/netdata.conf


# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP
# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP
# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP
# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP
# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP
# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP# !!!!!!!!!!!!!!!!!! ADD BACKUP
