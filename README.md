# Je veux être prêt pour le XKE

## installer les logiciels aux bonnes versions

docker-compose : https://docs.docker.com/compose/install/

docker : https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04 + https://docs.docker.com/install/linux/linux-postinstall/

ansible : https://linuxconfig.org/how-to-install-ansible-on-ubuntu-18-04-bionic-beaver-linux paragraphe `Install Ansible from PPA repository`

## pull les images docker
Afin d'être sur d'avoir tout ce qu'il faut pour demain, vous n'avez qu'à taper :

```
make docker-build
make run-hadoop-docker
make down-hadoop-docker
```

La première commande construira l'image correspondant au dockerfile du repo, la deuxième lancera toutes les images docker et téléchargera celles qui vous manquent, la dernière arrête toutes les images.

A bientôt pour un super talk de qualité (j'espère).