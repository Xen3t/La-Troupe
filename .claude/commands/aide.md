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
| **Sasha** | `/Sasha` ou `/assistant-ecriture` | Assistant | Polyvalent, transversal |

## Modules (activables selon le projet)

| Prénom | Commande | Rôle | Activer quand... |
|---|---|---|---|
| **Sutha** | `/Sutha` ou `/worldbuilder` | Worldbuilder | Univers original, SF, fantasy |
| **Eli** | `/Eli` ou `/dialoguiste` | Dialoguiste | Dialogues lourds, théâtre |
| **Hugo** | `/Hugo` ou `/verificateur` | Vérificateur | Réalisme, hard SF, historique |
| **Milo** | `/Milo` ou `/humoriste` | Humoriste | Comédie, relief comique |
| **Aria** | `/Aria` ou `/musique` | Musique | Chanson, paroles, direction musicale |
| **Iris** | `/Iris` ou `/da` | DA | Identité visuelle, pochettes, affiches |

## Workflows

| Commande | Fonction |
|---|---|
| `/nouveau-projet` | Initialiser un nouveau projet d'écriture (guidé) |
| `/diagnostic` | Nora + Étranger sur un texte |
| `/relecture` | Pipeline complet : Nora → Étranger → Otto |
| `/status` | État du projet en cours, prochaines étapes |
| `/roles` | Rappel : qui fait quoi dans La Troupe |

## Utilisation

- Tape `/[Prénom]` ou `/[role]` pour activer un agent
- Tu peux **empiler plusieurs agents** dans le même tour : `/Mira /Nina` les active en parallèle
- Chaque agent signe ses prises de parole par `Prénom :` (ex : `Iris :`)
- Ajoute du contexte après la commande : `/Mira Analyse ce personnage : [...]`
- `/aide` pour revenir à cet index
- `/roles` pour la liste des prénoms et rôles
