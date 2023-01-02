---
title: "SPRITE$(n)"
slug: "sprites-n"
description: "Défini ou récupère le motif du sprite en paramètre."
---

## `SPRITE$(n)`

Défini ou récupère le motif du sprite en paramètre.

- Si suivi de '=' et d'une chaîne de caractères, alors c'est une définition de motif.
- Si interrogé comme une fonction, renvoie le motif du sprite.

La chaîne de définition est d'une taille de 8 caractères ou 32 caractères, chacun d'entre eux représentant, sous sa représentation binaire, le motif d'une ligne ou demi-ligne de sprite (1 = pixel affiché, 0 = transparence).

Un sprite 8x8 est composé de 8 caractères. Un sprite 16x16 est composé de 32 caractères.

> -- Mokona