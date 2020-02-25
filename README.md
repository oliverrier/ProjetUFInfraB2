# Projet Infra UF B2


## Sommaire

## Speech

Ceci est notre projet d'infrastructure et système d'information de 2ème année à Ynov Informatique, où nous avons choisi d'avoir les thèmes principaux suivant:

    - Sauvegarde/Centralisation (Tri) des logs
    - Monitoring / Alerting
    - Documentation
    - Docker & vagrant

Cette infra sera sous un kernel Linux (client et serveur sous CentOS 8).



Nom | reseau | ip
--- | --- | ---
Serveur | 192.168.56.0 | 192.168.56.100
Client-1 | 192.168.56.0 | 192.168.56.111
Client-2 | 192.168.56.0 | 192.168.56.112


## I - Sauvegarde/Centralisation (Tri) des logs

journald - syslog (comment test)

## II - Monitoring/Alerting 

Concernant le monitoring et l'alerting, nous avons mis en place netdata sur nos clients et une centralisation des netdata sur le server visible grâce à grafana (en docker) accessible par interface web à l'adresse suivante: http://192.168.56.100:3000 lorsque le serveur est up. 

## III - Wiki

Pour la documentation interne, nous avons un wikijs (en docker) accessible sur le serveur à l'adresse : http://192.168.56.100:8080
)
