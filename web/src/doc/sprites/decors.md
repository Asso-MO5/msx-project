---
title: "Les décors"
slug: "background"
description: "Tuiles des décors"
---

<center>

![le Sujet](/msx-project/assets/bg/poc2.png)

*Cette image est une illustration visant à donner un aperçu du style voulu.*

*Notez le contour noir autour du personnage, à terme, il s'agira de sprites non essentiels du personnages.*

</center>

### Composition
- tuiles de 8 X 8 pixels
- Toujours de haut en bas et de gauche à droite

```BASIC

REM ____________________________________COMMODE_TEL.

DATA 07,09,03,0F,00,FF,FF,00
DATA E0,90,C0,E0,00,FF,FF,00
DATA 7F,40,5F,5F,5D,5F,5F,5F
DATA FE,02,FA,FA,BA,FA,FA,FA

REM ____________________________________MURS.

REM __________________Haut_gauche.

DATA 7E,FE,FE,FE,FE,FE,FE,FE

REM __________________Haut_droite.

DATA FC,FE,FE,FE,FE,FE,FE,FE

REM __________________plein.

DATA FE,FE,FE,FE,FE,FE,FE,FE

REM __________________bas_gauche.

DATA FE,FE,FE,FE,FE,FE,7E,00

REM __________________bas_droite.

DATA FE,FE,FE,FE,FE,FE,FC,00

REM ____________________________________PLAFOND.

REM __________________gauche.

DATA FF,FF,FF,FF,FF,00,7F,00

REM __________________plein.

DATA FF,FF,FF,FF,FF,00,FF,00

REM __________________droite.

DATA FE,FE,FE,FE,FE,00,FC,00

REM ____________________________________SOL.

REM __________________gauche.

DATA FF,FF,00,7F,7F,7F,7F,7F

REM __________________plein.

DATA FF,FF,00,FF,FF,FF,FF,FF

REM __________________droite.

DATA FF,FF,00,FE,FE,FE,FE,FE

REM ____________________________________PORTE.

REM __________________Haut_gauche.

DATA 00,7F,40,4F,5F,5F,5F,5F,00

REM __________________Haut_droite.

DATA 00,FC,04,F4,F4,F4,F4,F4,00

REM __________________gauche.

DATA 4F,4F,4F,4F,4F,4F,4F,4F,00

REM __________________droite.

DATA FA,FA,FA,FA,FA,FA,FA,FA,00

REM __________________clanche.

DATA 4F,4F,4F,47,41,47,47,4F,00

```

> -- Kazerlelutin

