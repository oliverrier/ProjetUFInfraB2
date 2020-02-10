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

## Postgre pour wiki js

[Tuto postgre](https://www.postgresql.org/download/linux/redhat/)

Commandes à faire :

```
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

dnf -qy module disable postgresql

dnf install -y postgresql12

dnf install -y postgresql12-server

/usr/pgsql-12/bin/postgresql-12-setup initdb
systemctl enable postgresql-12
systemctl start postgresql-12
```

## Docker pour wiki js

Suivre commande pour docker pour le client

faire un docker compose avec la doc wiki js

https://docs.docker.com/compose/gettingstarted/

```
docker run -d
     -p 8080:3000
     --name wiki 
     --restart unless-stopped 
     -e "DB_TYPE=postgres" 
     -e "DB_HOST=db" 
     -e "DB_PORT=5432" 
     -e "DB_USER=wikijs" 
     -e "DB_PASS=wikijsrocks" 
     -e "DB_NAME=wiki" 
     requarks/wiki:2

```


