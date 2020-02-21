MAJ:

```
sed -i 's/ONBOOT="no"/ONBOOT="on"/g' /etc/sysconfig/network-scripts/ifcfg-enp0s3
reboot
systemctl disable firewalld
yum check-update
yum update -y kernel
yum update -y
reboot
```

![reboot vm with vagrant](/image/reboot_vm_with_vagrant.png)


Installation docker:
```
dnf remove -y podman-manpages
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf list docker-ce
dnf install docker-ce --nobest -y
systemctl start docker
systemctl enable docker
```

RUN netdata sous docker:
```
docker run -d --name=netdata \
  -p 19999:19999 \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata
```

Pour être root après création vagrant
```
sudo su -
```

Run netdata avec docker-compose

faire un dossier docker, y mettre un fichier docker-compose.yml

le remplir avec ça

```
version: '3'
services:
  netdata:
    image: netdata/netdata
    hostname: example.com # set to fqdn of host
    ports:
      - 19999:19999
    cap_add:
      - SYS_PTRACE
    security_opt:
      - apparmor:unconfined
    volumes:
      - /etc/passwd:/host/etc/passwd:ro
      - /etc/group:/host/etc/group:ro
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
```

ensuite faire un docker-compose up -d pour le lancer


faire un docker-compose ps pour vérifier qu'il est bien up














































Installation netdata:

```
sudo dnf -y install git zlib-devel libuuid-devel libmnl gcc make git autoconf automake pkgconfig curl findutils
git clone https://github.com/netdata/netdata.git --depth=100
sudo dnf -y install https://extras.getpagespeed.com/release-el8-latest.rpm
yum install -y libuv-devel
cd netdata/
./netdata-installer.sh
sudo firewall-cmd --add-port=19999/tcp --permanent (pas bon, à revoir le côté perma) 
sudo ss -alnpt (pour voir le port utilisés)
```

Installation netdata nouvelle version:

```
dnf install http://repo.okay.com.mx/centos/8/x86_64/release/okay-release-1-3.el8.noarch.rpm -y
dnf install libuv-devel -y
dnf -y install git zlib-devel libuuid-devel libmnl gcc make git autoconf automake pkgconfig curl findutils -y
git clone https://github.com/netdata/netdata.git --depth=100
cd netdata/
./netdata-installer.sh
sudo firewall-cmd --add-port=19999/tcp --permanent (pas bon, à revoir le côté perma) 
sudo ss -alnpt (pour voir le port utilisés)
```