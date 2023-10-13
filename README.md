# PHP App de Nicolas Kieger
# Configuration et mise en place:
## - Commande afin de build le contenaire :
    docker compose up --build -d
## - Commande pour le run et ouvrir une interface bash :
    docker compose exec -it php bash
## - Une fois dans l'interface bash, mettre cette commande afin de démarrer le serveur :
    php server.php
## - Dans le navigateur, mettre l'URL suivante pour accéder à la page client: 
    http://localhost:8080/client.php
## - Dans le navigateur, mettre l'URL suivante pour accéder à la vidéo envoyé : 
    http://localhost:8080/video.mp4

## Source
<https://github.com/ProdigyView-Toolkit/Microservices-Examples-PHP>