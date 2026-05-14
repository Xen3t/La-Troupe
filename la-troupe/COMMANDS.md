# La Troupe — Guide d'utilisation

## Prérequis

- VS Code avec l'extension Claude installée (ou tout autre client qui supporte les slash commands `.claude/commands/`)
- Le workspace contenant `la-troupe/` ouvert

## Comment ça marche

Le framework repose sur deux mécanismes de l'extension Claude dans VS Code :

1. **CLAUDE.md** — fichier lu automatiquement par Claude à chaque session. Il contient le contexte permanent : structure du framework, règles, commandes disponibles. Tu n'as rien à faire, c'est chargé automatiquement.

2. **Slash commands** — fichiers `.md` dans `.claude/commands/`. Chaque fichier devient une commande `/nom` que tu tapes dans le chat Claude. La commande charge le prompt correspondant et active l'agent.

## Utilisation basique

### Activer un agent

Ouvre le chat Claude dans VS Code et tape :

```
/psychologue
```

Claude adopte le rôle du Psychologue tel que défini dans son SKILL.md. Il te demande sur quoi travailler.

### Passer du contexte directement

Tu peux enchaîner la commande et ta demande :

```
/psychologue Voici mon personnage principal. Il a 30 ans, ancien militaire, refuse de parler de son passé. Analyse sa cohérence psychologique.
```

Le `$ARGUMENTS` dans la commande est remplacé par tout ce que tu tapes après `/psychologue`.

### Switcher ou empiler les agents

Tape simplement une autre commande pour switcher :

```
/Nina Réécris ce passage dans un ton plus sec et nerveux.
```

**Tu peux aussi empiler plusieurs agents dans le même tour** — ils répondent en parallèle, chacun signé par son prénom :

```
/Mira /Nina Voici un passage clé. Qu'est-ce qu'il manque ?
```

Chaque agent appelé est désigné par son prénom (`/Theo`, `/Mira`, `/Nina`…) ou par son rôle (`/architecte`, `/psychologue`, `/styliste`…). Les deux formes sont des alias.

### Voir toutes les commandes

```
/aide
```

Affiche l'index complet des agents et workflows.

## Workflows

Les workflows combinent plusieurs agents en séquence.

### Démarrer un nouveau projet

```
/nouveau-projet
```

Claude te pose des questions une par une (titre, format, genre, pitch, thème...) puis crée un fichier `projet.md` avec tout le cadrage et une checklist d'avancement.

### Diagnostiquer un texte

```
/diagnostic [colle ton texte ici ou référence un fichier avec @]
```

Deux passes automatiques :
1. **Script Doctor** → rapport structurel (problèmes, rythme, scènes mortes)
2. **Étranger** → lecture froide (compréhension, confusion, accroche)
3. **Synthèse croisée** → convergences entre les deux analyses

### Pipeline de relecture complet

```
/relecture [texte ou @fichier]
```

Trois passes :
1. **Script Doctor** → structure et rythme
2. **Étranger** → lecture froide
3. **Correcteur** → orthographe, grammaire, typographie
4. **Rapport final** → top 3 des corrections, forces, verdict

### Vérifier l'état du projet

```
/status
```

Scanne le dossier, trouve le `projet.md`, et affiche ce qui est fait, en cours, et à faire.

## Référencer des fichiers

L'extension Claude VS Code supporte le `@` pour référencer des fichiers du projet :

```
/script-doctor Analyse ce chapitre : @chapitres/chapitre-03.md
```

Claude lit le fichier et l'analyse dans le rôle du Script Doctor.

## Workflows types par phase

### Phase 1 — Idéation
```
/inspirateur J'ai une vague idée de récit sur [thème], aide-moi à trouver un angle.
```
Puis :
```
/architecte Voici mon pitch : [pitch]. Propose-moi 2-3 structures possibles.
```

### Phase 2 — Fondations
```
/psychologue Crée la fiche psychologique de mon protagoniste : [description]
/worldbuilder Construis le système de magie de mon univers : [contraintes]
```

### Phase 3 — Pré-écriture
```
/architecte Développe le séquencier chapitre par chapitre.
/metteur-en-scene Découpe la scène d'ouverture en beats.
/dialoguiste Crée la carte vocale de [personnage].
```

### Phase 4 — Écriture
```
/styliste Voici la charte stylistique du projet. Réécris ce passage : [texte]
/humoriste Ce passage est censé être drôle mais tombe à plat. Diagnostic + réécriture.
```

### Phase 5 — Relecture
```
/diagnostic @chapitres/chapitre-05.md
```
Ou le pipeline complet :
```
/relecture @manuscrit/draft-v1.md
```

## Astuces

- **Empile quand c'est pertinent.** Pour des perspectives croisées, `/Mira /Eli` te donne psycho + dialogue dans le même tour. Pour une seule expertise, reste sur un seul agent.
- **Le Correcteur en dernier.** Toujours. Inutile de corriger l'orthographe d'un passage qui va être réécrit.
- **L'Étranger ne triche pas.** Ne lui donne pas tes notes ou fiches perso — il doit lire le texte nu, comme un lecteur.
- **L'Inspirateur aime les contraintes.** "Donne-moi des idées" → résultat moyen. "Donne-moi des idées pour un retournement au chapitre 8 qui implique le mentor et contredit ce que le lecteur croit depuis le chapitre 2" → résultat fort.
- **`/status` régulièrement.** Pour garder le cap et ne pas oublier ce qui reste à faire.

## Personnalisation

### Ajouter un agent custom

1. Crée un dossier dans `modules/` (ou `core/`) avec un `SKILL.md` qui suit le même format que les autres
2. Crée un fichier `.claude/commands/ton-agent.md` qui pointe vers le SKILL.md
3. Ajoute-le à l'index dans `/aide`

### Modifier un agent existant

Édite directement le `SKILL.md` correspondant. Les changements sont pris en compte à la prochaine invocation.

### Créer un workflow custom

Crée un fichier `.claude/commands/ton-workflow.md` qui enchaîne plusieurs agents, comme `/diagnostic` et `/relecture` le font.
