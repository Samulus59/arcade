# Documentation d'installation de la borne d'arcade


## Installation du Raspberry Pi
Suivez l'installation de Rasperry Pi OS :  
https://www.raspberrypi.com/software/operating-systems/
  
## Installation de Git
Faites `sudo apt update` puis `sudo apt install git -y`.  
Ensuite, pour télégarger le code de la borne d'arcade, récupérez le projet avec : `git clone https://github.com/Samulus59/arcade.git`.

## Installation de la borne et des langages
Une fois le dossier borne_arcade téléchargé, ouvrez un terminal à la racine du projet télégargé et éxécutez le fichier setup_arcade.sh avec `./setup_arcade.sh`.  
Si cela ne fonctionne pas, vous devez donner les droits d'éxécution, faites `chmod +x setup_arcade.sh` puis réessayez.  

Le programme va ensuite tenter d'installer tous les langages et biblithèques nécessaires au bon fonctionnement de la borne, à savoir :  
- La dernière version de Python
- La dernière version de Java
- Love, pour le jeu codé en Lua
- Une venv python avec les bibliothèques Pygame et Librosa

Il ne vous reste plus qu'à installer la bibliothèque MG2D et la mettre en variable d'environnement comme indiqué dans cette notice :  https://github.com/synave/MG2D/blob/main/installation_de_la_bibliotheque.  

Vous pouvez maintenant lancer la borne et y jouer!