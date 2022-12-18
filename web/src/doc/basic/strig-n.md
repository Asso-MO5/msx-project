---
title: "STRIG(n)"
slug: "strig-n"
description: "Renvoie la valeur de la barre espace ou d'un bouton de périphériques d'entrée de type joystick, souris,..."
---

## `STRIG(n)`

Renvoie la valeur de la barre espace ou d'un bouton de périphériques d'entrée de type joystick, souris,...

Le paramètre est le numéro de périphérique.

- 0 : barre espace
- 1 : bouton 1 du port 1
- 2 : bouton 1 du port 2
- 3 : bouton 2 du port 1
- 4 : bouton 2 du port 2

Il est aussi possible d'utiliser cette commande de manière évènementielle avec `ON STRIG GOSUB`.