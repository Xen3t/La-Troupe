# La Troupe — package de déploiement

**La Troupe** est un framework d'écriture multi-agents. Chaque agent porte un prénom et un rôle spécialisé (Theo l'Architecte, Mira la Psychologue, Nina la Styliste, etc.). On les appelle via des slash commands, seuls ou en parallèle.

Ce package contient tout ce qu'il faut pour installer La Troupe dans un nouveau workspace.

## Contenu du package

```
la-troupe-deploy/
├── la-troupe/             # Le framework lui-même (SKILL.md de chaque agent)
│   ├── SKILL.md           # Orchestrateur
│   ├── CLAUDE.md          # Doc du framework
│   ├── COMMANDS.md        # Guide d'utilisation
│   ├── core/              # 9 agents toujours là
│   └── modules/           # 6 modules activables
├── .claude/
│   └── commands/          # Slash commands pour Claude Code
├── .agents/
│   └── skills/            # Wrappers pour Codex CLI / OpenAI agents
├── CLAUDE.md              # À placer à la racine du workspace (Claude)
├── AGENTS.md              # À placer à la racine du workspace (Codex)
└── README.md              # Ce fichier
```

## Installation dans un nouveau workspace

1. **Copie l'intégralité du contenu** de ce package à la racine de ton nouveau workspace :
   - `la-troupe/` → dossier du framework
   - `.claude/commands/` → slash commands Claude Code
   - `.agents/skills/` → skills Codex (si tu utilises Codex)
   - `CLAUDE.md` → instructions pour Claude Code
   - `AGENTS.md` → instructions pour Codex

2. **Ouvre le workspace** dans VS Code (extension Claude installée) ou ton client préféré.

3. **Teste** : tape `/roles` dans le chat. Si la liste des agents s'affiche, c'est bon.

## Personnaliser pour ton projet

Édite `CLAUDE.md` (et/ou `AGENTS.md`) à la racine pour :
- Ajouter la liste de tes projets en cours
- Ajouter des règles spécifiques à ton workspace
- Documenter ton organisation de dossiers

Le contenu de `la-troupe/` n'a normalement pas besoin d'être modifié — c'est le framework lui-même.

## Comment utiliser La Troupe

### Commandes essentielles

- `/aide` — liste complète des commandes
- `/roles` — qui fait quoi dans La Troupe
- `/nouveau-projet` — initialiser un projet guidé
- `/status` — état du projet en cours
- `/diagnostic <texte>` — passage Nora + Étranger
- `/relecture <texte>` — pipeline complet Nora → Étranger → Otto

### Appeler un agent

Par prénom ou par rôle (alias) :

```
/Mira     ou    /psychologue
/Nina     ou    /styliste
/Theo     ou    /architecte
/Iris     ou    /da
```

### Empiler plusieurs agents

```
/Mira /Nina Analyse ce passage de plusieurs angles
```

Les deux agents répondent dans le même tour, chacun signe ses interventions par `Prénom :`.

## Les 15 agents

### Core (toujours là)

| Prénom | Rôle |
|---|---|
| Theo | Architecte Narratif — structure, arcs, séquencier |
| Mira | Psychologue — profils, cohérence comportementale |
| Nina | Styliste — voix, ton, prose |
| Kai | Metteur en Scène — découpage scénique, espace |
| Nora | Script Doctor — diagnostic structurel, rythme |
| Étranger | Lecteur froid — test du lecteur naïf |
| Otto | Correcteur — orthographe, grammaire |
| Noa | Inspirateur — déblocage créatif |
| Sasha | Assistant — polyvalent |

### Modules (activables selon le projet)

| Prénom | Rôle |
|---|---|
| Sutha | Worldbuilder — univers, lore, systèmes |
| Eli | Dialoguiste — voix, sous-texte |
| Hugo | Vérificateur — exactitude factuelle |
| Milo | Humoriste — timing comique |
| Aria | Musique — paroles + direction musicale |
| Iris | DA — direction visuelle, pochettes, affiches |

## Étendre La Troupe

Pour ajouter un agent custom :

1. Crée un dossier dans `la-troupe/core/` ou `la-troupe/modules/` avec un `SKILL.md` qui suit le format des autres
2. Crée un fichier `.claude/commands/<nom>.md` qui pointe vers le SKILL.md
3. Optionnel : crée un wrapper dans `.agents/skills/<nom>/SKILL.md` pour Codex
4. Ajoute l'agent dans `/aide` et `/roles`

## Licence

CC0 1.0 — domaine public. Tu peux copier, modifier, distribuer, vendre, sans demander permission ni créditer. Voir `LICENSE`.
