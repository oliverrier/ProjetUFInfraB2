# Sécurisation sshd

Ce fichier nous permet de regrouper toures les informations concernant la sécurisation du sshd.

Ce fichier est écrit grâce au [pdf de l'anssi](images/PDFAnssiSSH) concernant ssh.

## Protocole SSH

### Installation d'Open-SSH

---

[Lien du tuto suivi](https://phoenixnap.com/kb/how-to-enable-ssh-centos-7)

Open-SSH est installé par défaut sur centOS8, on va juste l'update avec la commande `yum install openssh-server` pour le serveur et `yum install openssh-clients` pour les clients

Pour vérifier que openssh est lancé : `systemctl status sshd`

Pour lancer le service sshd : `systemctl start sshd`

Pour le lancer au boot : `systemctl enable sshd` 

Pour l'arreter : `systemctl stop sshd`

Pour le désactiver au boot : `systemctl disable sshd`

Pour le restart (après modif de config par exemple): `systemctl restart sshd`

On va aussi passer SELinux en permissive grâce à la commande : `setenforce Permissive`
cela nous permettra d'avoir les logs d'utilisation

### Version

---

Seule la version 2 de ssh doit être autorisée.

Ajouter la ligne `Protocol 2` dans le fichier /etc/ssh/sshd_config


### TELNET / RSH / LOGIN

---

Desactivation de Telnet : Telnet n'est pas installé par défaut sur CentOS 8.

Désactivation de RSH : Rsh n'est pas installé par défaut sur CentOS 8

Désactivation de Rlogin : 
