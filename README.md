# Projet_CD

Ce projet traite du déployment d'une plateforme d'intégration continue (PIC) tout en intégrant des outils de CI/CD.
Le but est de développer une chaîne complète de déploiement continue permettant de faire des mise en production (MEP) automatiquement, avec possibilité de rollback.


Pré-requis :

Installer VirtualBox et Vagrant sur votre poste de travail.
Les machines virtuelles sont configurés à partir d'un Vagrantfile spécifique à chaque machine. Pour les lancer, il suffit de lancer la commande "vagrant up".

- VM 1 : installation d'une VM master "Master" avec Ansible et Git
- VM 2 : installaion d'un noeud Jenkins "node" 
- VM 3 : installation d'un serveur test "test_server"
- VM 4 : installation d'un serveur app "app_server"

Installation :

Une paire de clé ssh est générée sur la Master ainsi que sur le node afin d'établire une connxion entre les différentes VM.
La Master est connecté au noeud, au test_server ainsi qu'au app_server. Et le node est connecté au test_server et au app_server.

Des rôles ansible ont été créés afin de configurer les différentes VM.
Sur la machine Master, nous avons exécuté le playbook_install_master.yml pour installer Java8, Jenkins et Maven.
De plus, on a exécuté le playbook_install_noeud.yml depuis la Master, afin d'installer Java8, Maven, Ansible et Docker sur le node. Et un playbook_install_server.yml, pour installer Docker et des dépendances python/ansible sur les servers app et test.

Un Job pipeline a été effectué sur la Master Jenkins. Cette pipeline effectue les tâches suivantes :
- clone du projet depuis le repo distant suivant : https://github.com/aaugrain/devopsapps.git
- build du projet à l'aide de Maven avec la commande suivante : mvn clean package
- génération d'un rapport de tests unitaires JUnit pour les features
- création d'une image à partir d'un Dockerfile récupré sur le repo : https://github.com/aaugrain/Projet_CD.git
- image pushé sur Dockerhub pour les features et la master : mounabal/image_test et mounabal/image_prod respectivement
- deploiement avec ansible d'un contener contentant l'imge précédemment pushé avec l'environnement java et lappli buildé

Démarrage : 

Fabriqué avec :

- Git/Github: Dépôt distant 
- DockerHub: Bibliothèque d'images
- Ansible: Gestionnaire de configuratiuons
- Docker: Outil permettant de créer des conteneurs
- Jenkins: Orchestrateur d'outils
- Maven : Gestionnaire des dépendances/Build 

Versions : 


Auteurs :

- Alexandre AUGRAIN alias @aaugrain
- Mouna BALGHADDAR alias @Mounagit

License : 
