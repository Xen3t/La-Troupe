# La Troupe

**La Troupe** est un framework d'écriture multi-agents pour Claude Code et Codex. Chaque agent porte un prénom, un rôle et un périmètre strict : Theo bâtit la structure, Mira vérifie la psychologie des personnages, Nina tient la prose, Hugo contrôle la cohérence…

Tu n'as pas à choisir qui intervient. Tu décris ta demande en langage naturel ; La Troupe choisit l'agent principal et mobilise en silence les expertises utiles.

## Ce qui a changé depuis la première version

- **Routage automatique.** Les agents ne s'appellent plus à la main : la description de chaque skill décide qui se déclenche. Les commandes par prénom deviennent un forçage facultatif.
- **Une seule voix par défaut.** Un agent principal parle, ses appuis restent silencieux. Signature complète : `Prénom (Rôle) :`.
- **Quatre nouveaux agents** : Léa (Archiviste), Mara (Iconographe), Bernard (Historien) et Aléa (Hasard).
- **Workflows sous forme de skills** : `auto-ecriture` et `propagation` s'ajoutent à `diagnostic`, `relecture`, `statut-projet` et `nouveau-projet`.
- **Rôles resserrés** : Theo construit une structure, Nora diagnostique l'existant ; Sutha crée le lore, Hugo audite sans rien inventer.
- **Claude et Codex alignés** : mêmes consignes (`AGENTS.md`), mêmes adaptateurs dans `.claude/skills/` et `.agents/skills/`.
- **Projets déclarés** par un manifeste `.troupe.yml`, que `nouveau-projet` crée avec la source de vérité, l'atelier `_wip/` et le backlog.
- **Validation automatique** de la cohérence du framework : adaptateurs, commandes, signatures et isolation des projets.

## Installation

1. Copie à la racine de ton workspace :
   - `la-troupe/` — le framework ;
   - `.claude/` — skills et commandes pour Claude Code ;
   - `.agents/` — skills pour Codex ;
   - `AGENTS.md` et `CLAUDE.md` — consignes du workspace (`CLAUDE.md` importe simplement `AGENTS.md`).
2. Complète `AGENTS.md` avec tes projets et tes règles locales.
3. Ouvre le workspace dans Claude Code (terminal ou extension VS Code) ou dans Codex.
4. Vérifie l'installation : `/roles` doit afficher la troupe.

Pour démarrer un projet, décris-le simplement ou lance `/nouveau-projet`.

## Utilisation

Écris ce que tu veux, sans nommer d'agent :

```text
Cette réaction de mon personnage est-elle crédible ?
Continue cette scène jusqu'à l'arrivée au village.
Quelque chose cloche dans ce chapitre, trouve quoi.
J'ai renommé la capitale : propage le changement.
```

Pour imposer un rôle malgré le routage :

```text
/Mira Analyse ce personnage : [...]
/psychologue Analyse ce personnage : [...]
/Mira /Nina Voici un passage clé. Qu'est-ce qu'il manque ?
```

`/aide` liste toutes les commandes, `/roles` rappelle qui fait quoi, `/status` fait l'état des lieux du projet. Le guide complet est dans [`la-troupe/COMMANDS.md`](la-troupe/COMMANDS.md).

## La troupe

### Core

| Prénom | Rôle | Périmètre |
|---|---|---|
| Theo | Architecte Narratif | Structure, arcs, actes, chapitres |
| Mira | Psychologue | Profils, cohérence des comportements |
| Nina | Styliste | Voix narrative, ton, registre, prose |
| Kai | Metteur en Scène | Découpage scénique, espace, tension visuelle |
| Nora | Script Doctor | Diagnostic structurel, rythme, scènes mortes |
| Étranger | Lecteur froid | Lecture sans contexte, test du lecteur naïf |
| Otto | Correcteur | Orthographe, grammaire, typographie |
| Noa | Inspirateur | Déblocage créatif, sortie d'impasse |
| Léa | Archiviste | Pages de wiki, fiches canoniques, classement des notes |
| Sasha | Assistant | Synthèse, suivi, tâches transversales |

### Modules

| Prénom | Rôle | Périmètre |
|---|---|---|
| Sutha | Worldbuilder | Création et réparation du lore |
| Eli | Dialoguiste | Voix des personnages, sous-texte |
| Hugo | Vérificateur | Audit factuel et respect des règles actées |
| Milo | Humoriste | Timing comique, registres d'humour |
| Aria | Musique | Paroles, direction musicale |
| Iris | DA | Identité visuelle, moodboards, pochettes |
| Mara | Iconographe | Prompts d'illustration, intégration des images fournies |
| Bernard | Historien | Datation, chronologie, calendriers, anachronismes |
| Aléa | Hasard | Dix possibles crédibles classés, puis tirage pondéré |

### Workflows

| Skill | Fonction |
|---|---|
| `auto-ecriture` | Écrit directement la scène, le chapitre ou le dialogue demandé, sous la plume de Nina |
| `diagnostic` | Diagnostic de Nora et lecture froide de l'Étranger |
| `relecture` | Diagnostic macro, lecture froide, contrôles utiles, correction finale |
| `propagation` | Répercute un fait de canon modifié sur les pages qui en dépendent, contrôle final par Hugo |
| `statut-projet` | État des lieux depuis le manifeste, les fichiers, le backlog et Git (`/status`) |
| `nouveau-projet` | Initialise un projet : manifeste, source de vérité, atelier, backlog, guide de style |

## Comment ça marche

```text
la-troupe/
├── SKILL.md          # Orchestrateur : liste des agents et règles de routage (référence unique)
├── AGENTS.md         # Architecture et procédure d'ajout d'un agent
├── COMMANDS.md       # Guide d'utilisation
├── core/             # Agents toujours présents
├── modules/          # Agents spécialisés
├── workflows/        # Enchaînements de plusieurs agents
└── scripts/          # Synchronisation et validation
.agents/skills/       # Adaptateurs Codex, un par agent ou workflow
.claude/skills/       # Copie stricte des adaptateurs, pour Claude
.claude/commands/     # Forçage manuel par prénom, /aide, /roles, /status
```

- **Les skills routent.** Chaque adaptateur pointe vers le `SKILL.md` du framework ; sa `description` décide quand l'agent se déclenche.
- **Les commandes forcent.** Elles portent toutes `disable-model-invocation: true` et ne se déclenchent jamais seules.
- **Le framework reste générique.** Aucun agent ne cite un projet : les conventions propres à ton monde vivent dans le dossier du projet.

## Étendre La Troupe

La procédure d'ajout d'un agent est dans [`la-troupe/AGENTS.md`](la-troupe/AGENTS.md) : un `SKILL.md`, un adaptateur Codex, la synchronisation vers Claude, une commande prénom éventuelle, puis la validation.

```text
py la-troupe/scripts/sync_claude_skills.py
powershell -File la-troupe/scripts/validate.ps1
```

La validation demande Python 3 avec PyYAML (`pip install pyyaml`) et Windows PowerShell 5.1 ou PowerShell 7 (`pwsh`). Elle échoue sur un agent sans adaptateur, une commande auto-invocable ou doublonnant un skill, une cible absente, une signature manquante, ou le nom d'un projet du workspace cité dans le framework.

## Licence

CC0 1.0 — domaine public. Tu peux copier, modifier, distribuer et vendre sans demander la permission ni créditer. Voir [`LICENSE`](LICENSE).
