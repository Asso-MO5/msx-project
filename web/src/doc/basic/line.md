---
title: "LINE"
slug: "line"
description: "Trace une ligne ou un rectangle entre deux points."
---

## `LINE (x1,y1)-(x2,y2),Couleur,Forme`

Trace une ligne ou un rectangle entre deux points.

- *Coordonnées* : un couple de coordonnées indiquant les deux extrémités de la ligne. Si les premières coordonnées sont omise, la ligne sera tracée depuis le dernier point tracé par une autre commande graphique.
- *Couleur* : la couleur de tracé. De 0 à 15 en mode 2.
- *Forme* : `B` pour un rectangle, `BF` pour un rectangle rempli. Si le paramètre est omis, alors c'est une ligne qui est tracée.

> -- Mokona