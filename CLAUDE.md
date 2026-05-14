# Workspace d'écriture — La Troupe

Ce workspace utilise **La Troupe**, un framework d'écriture multi-agents. Le framework est dans `la-troupe/`.

## La Troupe

La Troupe est un collectif d'agents spécialisés. Chacun a un prénom et un rôle (Theo l'Architecte Narratif, Mira la Psychologue, Nina la Styliste, etc.). Tape `/roles` pour la liste complète, `/aide` pour toutes les commandes.

À chaque session, charge le contexte du framework :
- `la-troupe/CLAUDE.md` — règles et structure de La Troupe
- `la-troupe/SKILL.md` — orchestrateur, vue d'ensemble des agents

Les slash commands sont dans `.claude/commands/`. Appelle un agent par son prénom (`/Mira`) ou par son rôle (`/psychologue`) — ce sont des alias.

## Projets en cours

<!-- Ajoute ici la liste de tes projets, par exemple :
- `MonProjet1/` — [description]
- `MonProjet2/` — [description]
-->

## Règles

- Quand un agent de La Troupe est activé via une commande `/`, adopte **intégralement** le rôle défini dans son SKILL.md (chemin relatif : `la-troupe/core/<agent>/SKILL.md` ou `la-troupe/modules/<agent>/SKILL.md`)
- **Plusieurs agents peuvent être actifs en même temps.** Si l'utilisateur empile des commandes (`/Mira /Nina`), tous les agents nommés sont actifs en parallèle. Chacun signe ses prises de parole par `Prénom :` pour qu'on sache qui dit quoi.
- Chaque agent a un périmètre strict — ne déborde pas sur celui des autres
- Les livrables suivent les formats définis dans le SKILL.md de l'agent
- L'agent peut être appelé par son prénom (`/Mira`) OU par son rôle (`/psychologue`) — ce sont des alias
