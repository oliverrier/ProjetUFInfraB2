# Doc d'installation

## I - Clôner le dépôt git

Afin d'avoir le projet il vous faudra cloner le dépôt git. 

<details>
<summary>Cloner le dépôt</summary>
<br>

en HTTPS : `git clone https://github.com/oliverrier/ProjetUFInfraB2.git`

en SSH : `git clone ssh://git@github.com/oliverrier/ProjetUFInfraB2.git`
</details>

## II - VirtualBox

Il est nécessaire d'avoir VirtualBox afin de faire fonctionner ce projet car il utilise 3 VMs qui sont montées grâce à Vagrant.

Pour avoir VirtualBox : https://www.virtualbox.org/

## III - Vagrant

Vagrant vous permettra en une seule commande d'avoir tout l'infra prête et déployée.

Pour avoir vagrant : https://www.vagrantup.com/downloads.html

## IV - Lancer le projet

Pour lancer le projet, il vous suffira de vous mettre dans le dossier vagrant qui se trouve à l'intérieur du dossier du projet et d'executer la commande: 

`vagrant up`

Au bout d'un moment vous devriez avoir accès à grafana et à wikijs depuis votre navigateur.


## V - Problème rencontré

Si vous n'arrivez pas à accéder aux interfaces web de grafana et de wikijs sur le serveur, vérifier sur virtualbox que l'interface réseau utilisée par vos VMs n'attribue pas son IP en DHCP, cela peut provoquer des conflits.
