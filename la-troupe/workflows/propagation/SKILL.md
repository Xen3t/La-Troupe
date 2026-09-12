---
name: propagation
description: >-
  Propagation d'un changement de canon dans La Troupe : quand un fait déjà établi est modifié, renommé ou supprimé, recense les pages qui en dépendent, les fait corriger ou vérifier une à une, puis fait contrôler la cohérence par Hugo. Utiliser aussi sur « propage ce changement » ou « vérifie que c'est pris en compte partout ».
---

# Propagation d'un changement de canon

## Déclenchement

- **Obligatoire** dès qu'un fait déjà établi est modifié, renommé ou supprimé, quel que soit l'agent qui fait la modification, et même si elle survient au milieu d'une autre tâche.
- Un ajout qui ne contredit rien n'y est pas soumis. Un ajout qui précise ou restreint un fait existant est une modification.
- Sur demande explicite de l'auteur.

## Routage

L'agent à l'origine du changement mène la propagation. Léa corrige les pages de canon et de documentation. Sutha n'intervient que si une entrée révèle un conflit à résoudre dans le monde. Hugo vérifie la cohérence à la fin. Une contradiction qui exige un choix de fond remonte à l'auteur.

## Pipeline

1. **Recenser avant d'éditer.** Lancer l'outil d'impact indiqué par les consignes locales du projet, avec la fiche source, le nom court du sujet et ses variantes usuelles. Sans outil, rechercher les liens vers la fiche et les mentions du nom dans le canon, les décisions en attente et la chronologie. Une liste vide obtenue avec de mauvais termes ne prouve rien.
2. **Modifier la source.**
3. **Traiter chaque entrée, sans en sauter** : la corriger, la noter « vérifiée, rien à changer », ou signaler un conflit. Ne pas réécrire une page au-delà de ce que le changement impose.
4. **Contrôler.** Si au moins une autre page a été modifiée ou si un conflit reste ouvert, Hugo vérifie en mode cohérence les pages touchées. Si toutes les entrées sont « vérifiées, rien à changer », ce contrôle n'est pas requis.
5. **Valider** avec la commande de validation du projet.

## Sortie

```
PROPAGATION — [changement en une phrase]
Source : [fichier]
Termes recherchés : [liste]
Entrées recensées : [nombre]
- [chemin] — corrigée | vérifiée, rien à changer | conflit → [Sutha ou auteur]
Contrôle de cohérence : fait par Hugo | non requis (aucune autre page modifiée)
Validation : [résultat]
```

Consigner ce compte rendu là où le projet trace ses séances de travail, s'il en a.

## Limites

- Un outil d'impact trouve des liens et des mots, pas des dépendances de sens : une page peut reposer sur un fait sans jamais nommer le sujet. Relire aussi les pages voisines de la source quand le changement est structurant.
- La propagation ne crée aucun fait nouveau : elle répercute une décision déjà prise.
- Une décision d'auteur pas encore intégrée au canon est une entrée à signaler, jamais à réécrire sans son accord.
