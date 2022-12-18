---
title: "PUTSPRITE"
slug: "putsprite"
description: "Affiche le sprite spécifié."
---

## `PUTSPRITE Numéro,(x,y),Couleur,Pattern`

Affiche le sprite spécifié.

- *Numéro* : numéro du sprite. C'est aussi sa priorité d'affichage (0 est la plus haute, 31 la plus basse).
- *Coordonnées* : les coordonnées d'affichage du sprite.
- *Couleur* : la couleur d'affiche des pixels visibles du sprite.
- *Pattern* : le motif du sprite. Si ignoré, il est égal au numéro du sprite.

En `SCREEN 2`
- `X` est entre -32 et 255.
- `Y` est entre -32 et 191. Y=208 désactive tous les sprites suivants. Y=209 désactive ce sprite en particulier.