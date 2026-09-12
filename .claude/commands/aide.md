---
disable-model-invocation: true
---

# Liste des commandes de La Troupe

Affiche la liste complète des agents et commandes disponibles, organisée par catégorie. Ne charge aucun agent — c'est juste un index de référence.

## Agents Core (toujours disponibles)

| Prénom | Commande | Rôle | Périmètre |
|---|---|---|---|
| **Theo** | `/Theo` ou `/architecte` | Architecte Narratif | Structure, arcs, séquencier |
| **Mira** | `/Mira` ou `/psychologue` | Psychologue | Profils, cohérence comportementale |
| **Nina** | `/Nina` ou `/styliste` | Styliste | Voix, ton, registre, prose |
| **Kai** | `/Kai` ou `/metteur-en-scene` | Metteur en Scène | Découpage scénique, tension visuelle |
| **Nora** | `/Nora` ou `/script-doctor` | Script Doctor | Diagnostic, rythme, pacing |
| **Étranger** | `/etranger` | Étranger | Lecture froide, test du lecteur naïf |
| **Otto** | `/Otto` ou `/correcteur` | Correcteur | Orthographe, grammaire, typographie |
| **Noa** | `/Noa` ou `/inspirateur` | Inspirateur | Déblocage créatif, idées |
| **Léa** | `/Léa` ou `/archiviste` | Archiviste | Découpage de notes, classement, indexation, cohérence du workspace |
| **Sasha** | `/Sasha` ou `/assistant-ecriture` | Assistant | Synthèse, suivi, recherche transversale |

## Modules (activables selon le projet)

| Prénom | Commande | Rôle | Activer quand... |
|---|---|---|---|
| **Sutha** | `/Sutha` ou `/worldbuilder` | Worldbuilder | Créer ou réparer le lore |
| **Eli** | `/Eli` ou `/dialoguiste` | Dialoguiste | Dialogues lourds, théâtre |
| **Hugo** | `/Hugo` ou `/verificateur` | Vérificateur | Auditer faits et règles actées |
| **Milo** | `/Milo` ou `/humoriste` | Humoriste | Comédie, relief comique |
| **Aria** | `/Aria` ou `/musique` | Musique | Chanson, paroles, direction musicale |
| **Iris** | `/Iris` ou `/da` | DA | Identité visuelle, pochettes, affiches |
| **Mara** | `/Mara` ou `/iconographe` | Iconographe | Prompts d'illustration et intégration des images fournies |
| **Bernard** | `/Bernard` ou `/historien` | Historien | Dater, ordonner, bâtir une frise ou un calendrier |
| **Aléa** | `/Aléa` ou `/hasard` | Hasard | Dix possibles classés + tirage pondéré, pour casser l'évidence |

## Workflows

| Commande | Fonction |
|---|---|
| `/nouveau-projet` | Initialiser un nouveau projet d'écriture (guidé) |
| `/diagnostic` | Nora + Étranger sur un texte |
| `/relecture` | Pipeline complet : Nora → Étranger → Otto |
| `/propagation` | Répercuter un changement de canon partout où il compte, contrôle final par Hugo |
| `/status` | État du projet en cours, prochaines étapes |
| `/auto-ecriture` | Écrire directement une scène ou un passage, sans brainstorming |
| `/roles` | Rappel : qui fait quoi dans La Troupe |

## Utilisation

- Décris normalement ta demande : La Troupe choisit automatiquement l'agent principal et les appuis utiles
- Les commandes `/[Prénom]` et `/[role]` restent disponibles pour forcer exceptionnellement un rôle
- Chaque agent signe ses prises de parole par `Prénom (Rôle) :` (ex. `Iris (Direction artistique) :`)
- Ajoute du contexte après la commande : `/Mira Analyse ce personnage : [...]`
- `/aide` pour revenir à cet index
- `/roles` pour la liste des prénoms et rôles
