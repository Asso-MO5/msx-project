# Commandes spécifiques utilisées

## `CIRCLE (x,y),Rayon,Couleur,Début,Fin,Aspect`

Trace un cercle ou une ellipse.

- *Coordonnées* : les coordonnées du centre de la forme.
- *Rayon* : la longueur du plus grand rayon de la forme.
- *Début* : angle en radian du début du tracé du cercle.
- *Fin* : angle en radian de la fin du tracé du cercle.
- *Aspect* : aspect entre la rayon horizontal et vertical. Si l'aspect est 1, alors c'est un cercle.

## `COLOR Stylo,Fond,Bordure`

Défini les couleurs utilisées à partir de maintenant.

- *Stylo* : la couleur utilisée pour les futurs pixels
- *Fond* : la couleur de fond de l'écran
- *Bordure* : la couleur de la bordure de l'écran

Il est possible de ne pas spécifier un des paramètres.

## `LINE (x1,y1)-(x2,y2),Couleur,Forme`

Trace une ligne ou un rectangle entre deux points.

- *Coordonnées* : un couple de coordonnées indiquant les deux extrémités de la ligne. Si les premières coordonnées sont omise, la ligne sera tracée depuis le dernier point tracé par une autre commande graphique.
- *Couleur* : la couleur de tracé. De 0 à 15 en mode 2.
- *Forme* : `B` pour un rectangle, `BF` pour un rectangle rempli. Si le paramètre est omis, alors c'est une ligne qui est tracée.

## `PEEK(&HFBED)`

PEEK à cette adresse particulière renvoie l'état de certaines touches.

- Bit 1 : touche HOME
- Bit 4 : flèche DROITE
- Bit 5 : flèche BAS
- Bit 6 : flèche HAUT
- Bit 7 : flèche GAUCHE

## `PSET/PRESET (x,y),Couleur`

Affiche ou enlève un point aux coordonnées spécifiées dans la couleur spécifiée.

- `PSET` affiche avec la couleur de stylo par défaut.
- `PRESET` affiche avec la couleur de fond par défaut.

## `PUTSPRITE Numéro,(x,y),Couleur,Pattern`

Affiche le sprite spécifié.

- *Numéro* : numéro du sprite. C'est aussi sa priorité d'affichage (0 est la plus haute, 31 la plus basse).
- *Coordonnées* : les coordonnées d'affichage du sprite.
- *Couleur* : la couleur d'affiche des pixels visibles du sprite.
- *Pattern* : le motif du sprite. Si ignoré, il est égal au numéro du sprite.

En `SCREEN 2`
- `X` est entre -32 et 255.
- `Y` est entre -32 et 191. Y=208 désactive tous les sprites suivants. Y=209 désactive ce sprite en particulier.

## `SCREEN`

Ici, la commande est utilisée simplement pour passer dans le mode d'affichage numéro 2, qui est pratique pour manipuler des pixels unitairement.

En mode 2, l'écran est constitué de 32 blocs en largeur, et de 3 fois 8 blocs en hauteur. Les blocs font 8 par 8 pixels. Cela donne une résolution totale de 256 par 192.

Il est possible d'avoir 16 couleurs en simultané à l'écran, avec des restrictions sur les blocks.

## `SPRITE$(n)`

Défini ou récupère le motif du sprite en paramètre.

- Si suivi de '=' et d'une chaîne de caractères, alors c'est une définition de motif.
- Si interrogé comme une fonction, renvoie le motif du sprite.

La chaîne de définition est d'une taille de 8 caractères ou 32 caractères, chacun d'entre eux représentant, sous sa représentation binaire, le motif d'une ligne ou demi-ligne de sprite (1 = pixel affiché, 0 = transparence).

Un sprite 8x8 est composé de 8 caractères. Un sprite 16x16 est composé de 32 caractères.

## `STEP(x,y)`

Une coordonnée peut-être décorée par `STEP` pour spécifier une coordonnée relative au dernier point tracé par une commande graphique.

## `STRIG(n)`

Renvoie la valeur de la barre espace ou d'un bouton de périphériques d'entrée de type joystick, souris,...

Le paramètre est le numéro de périphérique.

- 0 : barre espace
- 1 : bouton 1 du port 1
- 2 : bouton 1 du port 2
- 3 : bouton 2 du port 1
- 4 : bouton 2 du port 2

Il est aussi possible d'utiliser cette commande de manière évènementielle avec `ON STRIG GOSUB`.

## `VDP(1)`

Renvoie ou accède au registre 1 du VDP.

- Bit 0 : si à 1, la taille d'affichage des sprites est doublée.
