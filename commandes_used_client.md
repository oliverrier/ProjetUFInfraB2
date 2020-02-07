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
