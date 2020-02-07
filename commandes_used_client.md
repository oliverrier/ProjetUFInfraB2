MAJ:

```
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