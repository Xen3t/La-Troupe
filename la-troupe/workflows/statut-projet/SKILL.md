---
name: statut-projet
description: >-
  État des lieux automatique d'un projet d'écriture à partir de son manifeste, de ses fichiers, de son backlog et de son historique Git. Utiliser sur « statut », « où en est le projet », « prochaine étape » ou une demande d'inventaire d'avancement, sans exiger un fichier projet.md.
---

# Statut du projet

## Sources

1. Repérer le projet concerné.
2. Lire d'abord .troupe.yml s'il existe.
3. Lire les instructions locales, le backlog, les index et les documents d'état.
4. Inventorier les livrables réels et leur dernière activité.
5. Utiliser Git comme preuve d'évolution lorsqu'il est disponible.
6. Ne pas déduire qu'un travail est terminé du seul fait qu'un fichier existe.

Sasha produit le statut. Léa intervient uniquement si l'inventaire révèle un besoin de classement ou de cohérence du workspace.

## Sortie

Commencer par Sasha (Assistant) :.

- État global en une phrase.
- Terminé, avec preuves ou fichiers.
- En cours, avec état concret.
- Bloqué ou non arbitré.
- Prochaines actions, ordonnées.
- Pour chaque action, rôle automatiquement routé en toutes lettres ; aucune commande manuelle n'est demandée.

## Limites

Le statut est en lecture seule. Ne créer, déplacer ou réécrire aucun fichier sans demande d'exécution explicite. L'absence de projet.md n'est pas une erreur si le manifeste ou la structure du projet fournit l'information.
