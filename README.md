# Projet Infra UF B2


## Sommaire

## Speech

Ceci est notre projet d'infrastructure et système d'information de 2ème année à Ynov Informatique, où nous avons choisi d'avoir les thèmes principaux suivant:

    - Administration SSH
    - Sauvegarde/Centralisation (Tri) des logs
    - Monitoring / Alerting
    - Documentation
    - Management de configuration
    - Sécurisation infra
    - Remise en place d'un service s'il tombe

Cette infra sera sous un kernel Linux (client et serveur sous CentOS 8 et Debian pour l'administrateur).

Monter un vagrant file pour up fast

## I - Administration SSH

Anssi sshd (pdf)

## II - Sauvegarde/Centralisation (Tri) des logs

journald - syslog (comment test)

## Backup

## III - Monitoring/Alerting 

netdata (docker)

## IV - Documentation

Wikijs (soucis sur install postgresql)

## Ticketing

## DNS

## V - Management de configuration

## Annuaire ldap

## VI - Sécuriser l'infra

## VII - Remise en place de service s'il est down







Nom | reseau | ip
--- | --- | ---
Serveur | 10.0.2.0 | 10.0.2.10
Admin | 10.0.2.0 | 10.0.2.20
Client | 10.0.2.0 | 10.0.2.30
3



Netdata -> add la lib 
sudo dnf -y install https://extras.getpagespeed.com/release-el8-latest.rpm
yum install -y libuv-devel
sudo firewall-cmd --add-port=19999/tcp lui en permanant
et c'est bon pute

annuaire ldap 
  * openldap = vieux, mature, compliqué à appréhender
  * zentyal = pas pour grosse prod, adapté pme, jeune, yolo, embarque moult trucs
  * freeipa = rcent, moderne, robuste, compliqué à mettre en oeuvre, doc très succincte, adapté quasi que à rhel-based
backup
*monitoring*
Ticketing
    * méthode kanban
    * wekan

DNS
  * ipam
    * netbox
    * phpipam

