# Je veux pull les images dockers pour me préparer pour le talk de demain

Afin d'être sur d'avoir tout ce qu'il faut pour demain, vous n'avez qu'à taper :

```
make docker-build
make run-hadoop-docker
make down-hadoop-docker
```

La première commande construira l'image correspondant au dockerfile du repo, la deuxième lancera toutes les images docker et téléchargera celles qui vous manquent, la dernière arrête toutes les images.

A bientôt pour un super talk de qualité (j'espère).