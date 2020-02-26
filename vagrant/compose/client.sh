#!/bin/sh
setenforce 0
dnf install http://repo.okay.com.mx/centos/8/x86_64/release/okay-release-1-3.el8.noarch.rpm -y
dnf install libuv-devel -y
dnf install git zlib-devel libuuid-devel libmnl gcc make git autoconf automake pkgconfig curl findutils -y
# cf https://github.com/netdata/netdata/blob/master/packaging/installer/methods/kickstart-64.md
curl -Ss https://my-netdata.io/kickstart-static64.sh -o kickstart.sh
chmod +x kickstart.sh
./kickstart.sh --dont-wait

echo "
*.* @192.168.56.100:514 #Use @ for UDP protocol
*.* @@192.168.56.100:514 #Use @@ for TCP protocol
" >> /etc/rsyslog.conf
systemctl restart rsyslog
systemctl enable rsyslog

curl localhost:19999/netdata.conf | awk '$0=="[backend]" {iamin="yes"} ; $0=="" {iamin="no"} ; iamin=="yes" && $2=="type" {print "        "$2" "$3" opentsdb"} iamin=="yes" && $2!="type" {print $0} ; iamin!="yes" {print $0} ' | awk '$0=="[backend]" {iamin="yes"} ; $0=="" {iamin="no"} ; iamin=="yes" && $2=="enabled" {print "        "$2" "$3" yes"} iamin=="yes" && $2!="enabled" {print $0} ; iamin!="yes" {print $0} ' | awk '$0=="[backend]" {iamin="yes"} ; $0=="" {iamin="no"} ; iamin=="yes" && $2=="destination" {print "        "$2" "$3" 192.168.56.100:8086"} iamin=="yes" && $2!="destination" {print $0} ; iamin!="yes" {print $0} ' > toto
mv /opt/netdata/etc/netdata/netdata.conf /opt/netdata/etc/netdata/netdata.orig
mv toto /opt/netdata/etc/netdata/netdata.conf