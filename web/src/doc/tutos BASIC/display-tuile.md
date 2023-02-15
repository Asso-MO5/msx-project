---
title: "Afficher une tuile"
slug: "afficher-tuile"
description: "Tuto pour afficher une tuiles"
---

## Fonctionnement

Cet article a pour but de présenter l'affichage de caractères utilisateur, ou tuiles, sur l'écran du MSX.

C'est sur le fond d'écran, c'est à dire derrière tous les sprites potentiellement affichés, que ces fruits sont élus affection sur une grille fixe de 40 lignes de 38 tuiles.

Nous allons traiter ici le mode d'écran 1.

Il faut trois informations pour afficher un caractère à l'écran. Tout d'abord, son numéro, ou index, dans une bibliotheque de 256 caractères. Il faut aussi renseigner une paire de couleurs : couleur d'écriture et couleur de fond. Enfin,


## exemple

avec du code

```BASIC
100 REM EXEMPLE POUR CHARGER UN 'PATTERN' EN VRAM
110 COLOR 5,1,1:SCREEN 1,0,0 ' Initialisation de l'écran en Mode 1
120 GOSUB 3000 'Appel définition TUILES
130 GOSUB 5100 'Couleurs des tuiles
140 GOSUB 7000 'PLACEMENT DES TUILES
150 GOTO 150

3000 REM ____________________________________PATTERNS
3010 DATA 01,02,04,08,10,20,40,80
3020 DATA 80,40,20,10,08,04,02,01
4000 DATA *

5000 S=BASE(7)
5010 RESTORE 3010
5020 READ R$
5030 IF R$="*" THEN RETURN ELSE VPOKE S,VAL("&H"+R$):S=S+1
5040 GOTO 5020

5100 REM ____________________________________COLORS
5110 S=BASE(6)
5120 FOR I=0 TO 31: VPOKE S+I, &H50: NEXT I
5130 RETURN

6000 REM ____________________________________COORD TUILES
6010 REM ___________________TELEPHONE

6990 DATA *,*,*

7000 S=BASE(5)
7010 FOR I=0 TO 24*32-1
7020 VPOKE S+I,I AND 255
7030 NEXT I
7040 RETURN
```

## limitations
