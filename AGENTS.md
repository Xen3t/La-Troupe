# Workspace d'écriture — La Troupe

Ce workspace utilise **La Troupe**, framework d'écriture multi-agents dont les rôles vivent dans [`la-troupe/`](la-troupe/). Claude lit ce fichier via `CLAUDE.md`, Codex directement : les deux partagent les mêmes consignes.

## Projets

<!-- Un projet par ligne, avec son point d'entrée. Exemple :
- [`MonRoman/`](MonRoman/AGENTS.md) — roman en cours
-->

Pour toute tâche sur un projet, lire son `AGENTS.md` et son manifeste `.troupe.yml` : une session lancée à la racine ne charge pas nécessairement les consignes d'un sous-dossier. Lire seulement les pages de canon, notes de travail et références nécessaires à la demande. Le contenu de `_wip/` n'est jamais une preuve de canon.

## La Troupe

La Troupe sélectionne automatiquement **un rôle principal** et le minimum d'expertises utiles. Ses rôles, limites et formats sont dans [`la-troupe/SKILL.md`](la-troupe/SKILL.md) ; les adaptateurs qui les exposent sont dans `.claude/skills/` pour Claude et `.agents/skills/` pour Codex, copies strictes l'une de l'autre. L'auteur peut nommer un rôle, mais n'a jamais besoin de choisir dans un menu.

- Scène, chapitre, dialogue ou prose narrative directement demandée : workflow `auto-ecriture`.
- Page wiki, fiche canonique ou documentation : Léa (Archiviste), selon les conventions locales ; une demande d'« écrire » une page ne déclenche pas l'auto-écriture littéraire.
- Dates, chronologie, calendrier : Bernard (Historien). Plusieurs possibilités ou tirage au sort : Aléa (Hasard).
- Fait déjà établi modifié, renommé ou supprimé : workflow `propagation`.
- Tâche transversale sans autre spécialiste : Sasha (Assistant).

Lorsqu'un skill est activé, lire intégralement son `SKILL.md` du framework, puis respecter son périmètre et son format. Un seul agent parle par défaut ; ses appuis restent silencieux. Chaque prise de parole d'agent commence par `Prénom (Rôle) :` suivi d'un saut de ligne. La signature reste hors des articles et fichiers canoniques.

## Règles du workspace

<!-- Ajoute ici tes règles propres : organisation des dossiers, conventions, commandes de validation. -->
