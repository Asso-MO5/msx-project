---
title: "les SCREENS"
slug: "screen"
description: "Explication des screens"
---

Le **MSX1** est équipé d’un processeur graphique **TMS9918** de Texas Instrument. Ce processeur contient
16 kilo-octets de mémoire vidéo (VRAM), et peut afficher **16 couleurs** selon une palette fixe. Il
possède 4 modes d’affichage :

## Mode écran 0 (Text)

Mode textuel de **2 couleurs** qui peut afficher **40x24** caractères avec une résolution totale de **240x192**
pixels. Les dessins des **256 caractères** peuvent être redéfinis (que ce soit pour afficher des lettres ou des
bouts de dessin).

### Avantages
- Prends très peu de place en **VRAM**.
- Permet un scrolling de 6 pixel en pixel (contre 8 pour les autres modes).

### Inconvénients
- Seulement **2 couleurs pour tout l’écran**.
- Petits caractères (tuiles) de **6x8 pixels**.
- Pas de possibilité d’utiliser les sprites.
- Les 960 cases affichées à l’écran rendent le scrolling logiciel trop coûteux.

## Mode écran 1 (Graphic 1)

Mode graphique à base de tuile. Chaque tuile de **8x8 pixels** peut utiliser **2 couleurs** (32 combinaisons
maximale). Un écran peut afficher **32x24 tuiles** (parmi 256 dessins) pour une résolution totale de
**256x192 pixels**. Les dessins des 256 tuiles peuvent être redéfinies.

### Avantages
- Prends très peu de place en VRAM.
- Permet d’utiliser les sprites.
- Les **768 cases** affichées à l’écran rendent le scrolling logiciel raisonnablement coûteux.


### Inconvénients
- La limite de **2 couleurs par blocs de 8x8 pixels** est assez contraignante pour avoir un affichage
coloré.

## Mode écran 2 (Graphic 2)

Mode graphique à base de tuile (parfois considéré comme un mode pseudo-Bitmap). 
Les tuiles font également 8x8 pixels, mais on peut définir **2 couleurs par ligne** (et non plus pour la tuile entière comme
en mode écran 1). Un écran peut afficher **32x24 tuiles** (parmi 768 dessins) pour une résolution totale de
**256x192 pixels**. 
Le fait d’avoir 768 dessins de tuiles disponibles permet de mettre une tuile unique sur
chaque case de l’écran et c’est en ce sens qu’on peut le considérer comme un mode Bitmap.

### Avantages
- Permet d’avoir des tuiles assez colorées.
- Peut servir de mode Bitmap pour afficher une image plein écran.
- Permet d’utiliser les sprites.
- Les 768 cases affichées à l’écran rendent le scrolling logiciel raisonnablement coûteux.

### Inconvénients
- Occupe quasiment toute la VRAM.
- Le chargement des 768 tuiles en VRAM est assez lent.

## Mode écran 3 (Multicolor)

Mode graphique à base de tuile (considéré comme un mode Bitmap). Les tuiles font **2x2 points** et
chaque point peut avoir sa propre couleur. Un écran peut afficher **32x24 tuiles** (parmi 768 dessins) pour
une résolution totale de **64x48 pixels** (agrandi 4 fois pour occuper l’espace de 256x192 pixels).

### Avantages
- Chaque « pixel » peut avoir sa propre couleur.
- Permet d’utiliser les sprites.


### Inconvénients
- Le résolution de **64x48 pixels** est très faible et ne permet aucun détail dans les graphismes.

> -- Aoineko
