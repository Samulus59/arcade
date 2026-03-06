# Documentation d'ajout d'un jeu à la borne d'arcade

## Pré-requis
Avant d'ajouter un nouveau jeu, assurez-vous que la borne d'arcade est fonctionnelle et que vous avez bien exécuté le fichier `setup_arcade.sh`.  
Egalement, pour éviter l'installation de bibliothèques supplémentaires qui invalideraient le fonctionnement du git original, le jeu que vous développerez devra soit être codé en Java et utiliser MG2D, soit être codé en Python et utiliser PyGame et Librosa.

### Info sur les contrôles
Pour que votre jeu soit jouable sur la borne, il doit uniquement utiliser les contrôles de celle-ci.
Ils sont au nombre de 7 pour un joueur : 
- Un joystick
- 6 Boutons : A, B, C pour les 3 boutons du haut, et X, Y, Z pour ceux du bas.
Pour un 2e joueur, le même set de boutons existe.

Pour détecter les inputs, vous utiliserez :
- getJoyJ1GaucheTape()
- getJoyJ1DroiteTape()
- getJoyJ1HautTape()
- getJoyJ1BasTape()
- getBoutonJ1ATape()
- getBoutonJ1BTape()
- getBoutonJ1CTape()
- getBoutonJ1XTape()
- getBoutonJ1YTape()
- getBoutonJ1ZTape()  
Pour des touches enfoncées, remplacez la fin `Tape()` par `Enfoncee()`  
En cas de 2e joueur, remplacez simplement les J1 par des J2 pour détecter ces inputs également.

## Ajouter le jeu à la borne
- Placez le dossier contenant votre jeu à l'intérieur du dossier `projet` comme ceci
```
borne_arcade
|
|__ projet
    |
    |__ UnJeu
    |
    |__ UnAutrejeu
    |
    |__ VotreJeu
        |
        |__ *Contenu du jeu*
```
  
## Rendre le jeu fonctionnel sur la borne
Ensuite, afin que le jeu puisse être compris par le menu de la borne d'arcade, ajoutez ces trois fichiers dans le dossier de votre jeu :

### Boutons
Le fichier `bouton.txt`, qui affichera à l'écran les contrôles de votre jeu. Son contenu prend  par exemple cette forme :  
```Déplacement Sauter:Attaquer:rien:Se baisser:rien:rien:rien```  
c'est à dire le rôle de chaque touche, dans cet ordre :  
```Joystick bouton_haut_gauche:bouton_haut_centre:bouton_haut_droit:bouton_bas_gauche:bouton_bas_centre:bouton_bas_droit```.

### Photo
Une photo nommée `photo_small.png`, qui s'affichera quand le sélecteur sera sur votre jeu.

### Description
Le fichier `description.txt`, un court texte descriptif de votre jeu. Passez régulièrement des lignes, même au cours d'une phrase, pour éviter que le texte sorte du cadre d'affichage.

## Rendre le jeu éxécutable

A la racine du projet (sous borne_arcade), créez un fichier `votre_jeu.sh`.

### Jeu Java

Ajoutez-y ce contenu :
```
#!/bin/bash
xdotool mousemove 1280 1024
cd projet/VotreJeu
javac Main.java
java Main
```
Au besoin, remplacez `Main` par le fichier principal de votre jeu.

### Jeu Python

Ajoutez-y ce contenu :
```
cd projet/VotreJeu
bash -l -c "$HOME/arcade-venv/bin/python main.py"
```
Au besoin, remplacez `main` par le fichier principal de votre jeu.

## Architecture finale
```
borne_arcade
|
|__ votre_jeu.sh
|
|__ projet
    |
    |__ VotreJeu
        |
        |__ *Contenu du jeu*
        |
        |__ Main.java ou main.py
        |
        |__ bouton.txt
        |
        |__ description.txt
        |
        |__ photo_small.png
```
