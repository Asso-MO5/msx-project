---
title: "Afficher une tuile"
slug: "afficher-tuile"
description: "Tuto pour afficher une tuiles"
---

## Fonctionnement

Cet article a pour but de présenter l'affichage de caractères utilisateur, ou tuiles, sur l'écran du MSX.

C'est sur le fond d'écran, c'est à dire derrière tous les sprites potentiellement affichés, que ces fruits sont élus affection sur une grille fixe de 40 lignes de 38 tuiles.

Nous allons traiter ici le mode d'écran 1.

Il faut trois informations pour afficher un caractère à l'écran. Tout d'abord, son numéro, ou index, dans une bibliothèque de 256 caractères. Il faut aussi renseigner une paire de couleurs : couleur d'écriture et couleur de fond. Enfin, il faut indiquer où l'on veut voir apparaître le caractère.

Enfin, pour que les caractères soient des caractères utilisateurs, il faut les définir quelque part.

## Définition d'un pattern

La définition d'un caractère utilisateur se fait de la même manière que pour un sprite. Dans un tableau de 8 par 8, on peut dessiner un motif qui est ensuite converti en une suite de 8 entiers de 8 bits. La conversion se fait en prenant par exemple toutes les cases pleines en 1 et toutes les cases vides en zéros.

Par exemple, un M stylisé pourrait donner ceci :

```
1......1
11....11
11111111
1.1111.1
1......1
1......1
1......1
1......1
```

En remplaçant les points par des zéros et en effectuant une conversion ligne par ligne en nombres hexadécimaux, cela donne : &h81, &hC3, &hFF, &hBD, &h81, &h81, &h81, &h81. On retrouve ces données dans le programme exemple en ligne 3010.

## Les couleurs

En mode d'écran 1, chaque tuile peut avoir deux couleurs. Une couleur est associée au 1 (case pleine), et une autre couleur au 0 (case vide). Cette paire de couleur est encodée sur un seul octet. Les 4 bits de poids fort représentent la couleur associée au 1, et les 4 bits de poids faible représente la couleur associée au 0.

La représentation hexadécimale facilite la lecture, puisque chaque chiffre hexadécimal représente 4 bits. Par exemple, la valeur &h56 indique que la couleur associée au 1 est la couleur 5 (bleu), et la couleur associée au 0 est la couleur 6 (rouge).

Une contrainte cependant : les tuiles sont associées par index à un couple de couleur fixe, par blocs de 8. Ainsi, les 8 premiers indexes de caractères sont associés au couple 0, les 8 suivant au couple 1, etc. Les 8 derniers sont associés au couple d'index 31.

Sur le programme exemple, on déclare en VRAM 32 couples de couleurs.

## Exemple

Dans l'exemple, les caractères d'index 0, 1 et 2 sont redéfinis. Les couples de couleurs 0 à 31 sont définis. Puis l'écran est rempli de l'ensemble des caractères présents en VRAM trois fois de suite.

```BASIC
100 ' EXEMPLE POUR CHARGER DES 'PATTERN's EN VRAM ET LES AFFICHER
110 COLOR 5,1,1:SCREEN 1,0,0 ' Initialisation de l'écran en Mode 1
120 GOSUB 3000 ' Définition des TUILES
130 GOSUB 5100 ' Couleurs des TUILES
140 GOSUB 7000 ' Placement des TUILES
150 GOTO 150

3000 REM ____________________________________PATTERNS
3010 DATA 81,C3,FF,BD,81,81,81,81
3020 DATA 3C,7E,66,C3,C3,66,7E,3C
3030 DATA FF,FF,80,FC,FE,01,FF,FE
4000 DATA *

5000 S=BASE(7)
5010 RESTORE 3010
5020 READ R$
5030 IF R$="*" THEN RETURN ELSE VPOKE S,VAL("&H"+R$):S=S+1
5040 GOTO 5020

5100 REM ____________________________________COLORS
5110 S=BASE(6)
5120 FOR I=0 TO 31:VPOKE S+I,&H30+I:NEXT I
5130 RETURN

7000 S=BASE(5)
7010 FOR I=0 TO 24*32-1
7020 VPOKE S+I,I AND 255
7030 NEXT I
7040 RETURN
```

## limitations
