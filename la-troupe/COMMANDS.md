# La Troupe — Guide d'utilisation

## Prérequis

- VS Code avec l'extension Claude installée (ou tout autre client qui supporte les slash commands `.claude/commands/`)
- Le workspace contenant `la-troupe/` ouvert

## Comment ça marche

Le framework repose sur trois mécanismes :

1. **`AGENTS.md` / `CLAUDE.md`** — lus automatiquement à l'ouverture d'une session à la racine du workspace. Ils portent le contexte permanent et les règles de routage. Tu n'as rien à faire.

2. **Skills** — un dossier par agent dans `.agents/skills/` (Codex) et `.claude/skills/` (Claude), copies strictes l'une de l'autre. **C'est par eux que passe le routage automatique** : leur `description` décide quel agent se déclenche sur une demande donnée. Ils sont aussi appelables à la main : `/archiviste`, `/historien`, `/auto-ecriture`…

3. **Commandes** — fichiers `.md` dans `.claude/commands/`, un par prénom (`/Mira`, `/Léa`…) plus `/aide`, `/roles` et `/status`. Elles ne servent qu'au **forçage manuel** : elles ne se déclenchent jamais toutes seules.

## Utilisation normale — routage automatique

Décris simplement ce que tu veux faire. La Troupe déduit le rôle principal et les éventuels appuis à partir du contexte :

```text
Cette réaction de mon personnage est-elle crédible ?
Continue cette scène jusqu'à l'arrivée au village.
Quelque chose cloche dans ce chapitre, trouve quoi.
```

Tu n'as pas besoin de connaître les prénoms ni les commandes. Un seul agent principal parle par défaut et signe `Prénom (Rôle) :`.

Une demande comme « écris », « continue », « rédige » ou « prends la main » active le mode **auto-écriture** : La Troupe livre directement de la prose, sans brainstorming ni plan de remplacement.

## Commandes manuelles — facultatives

### Forcer un agent

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

### Forcer plusieurs expertises

Tape simplement une autre commande pour switcher :

```
/Nina Réécris ce passage dans un ton plus sec et nerveux.
```

Tu peux exceptionnellement imposer plusieurs expertises. Chacune signe alors sa contribution complète :

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

### Déléguer l'écriture

Le workflow s'active automatiquement dès que la demande attend du texte rédigé. La commande explicite reste disponible :

```text
/auto-ecriture Continue ce chapitre jusqu'à la confrontation.
```

Nina écrit la prose et applique silencieusement les contraintes utiles de structure, psychologie, dialogue, mise en scène et lore.

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

- **Laisse le routage automatique travailler.** Force plusieurs agents seulement si tu veux réellement plusieurs rapports séparés.
- **Le Correcteur en dernier.** Toujours. Inutile de corriger l'orthographe d'un passage qui va être réécrit.
- **L'Étranger ne triche pas.** Ne lui donne pas tes notes ou fiches perso — il doit lire le texte nu, comme un lecteur.
- **L'Inspirateur aime les contraintes.** "Donne-moi des idées" → résultat moyen. "Donne-moi des idées pour un retournement au chapitre 8 qui implique le mentor et contredit ce que le lecteur croit depuis le chapitre 2" → résultat fort.
- **`/status` régulièrement.** Pour garder le cap et ne pas oublier ce qui reste à faire.

## Personnalisation

### Ajouter un agent custom

La procédure complète, avec la validation qui va avec, est dans [`AGENTS.md`](AGENTS.md). En résumé : un `SKILL.md` dans `modules/` ou `core/`, un adaptateur dans `.agents/skills/`, `sync_claude_skills.py` pour propager vers Claude, une commande prénom si l'agent en a un, puis `validate.ps1`.

**Ne pas créer de commande portant le nom d'un skill** (`archiviste.md` à côté du skill `archiviste`) : le routage devient ambigu, et `validate.ps1` refuse désormais cette configuration.

### Modifier un agent existant

Édite directement le `SKILL.md` correspondant. Les changements sont pris en compte à la prochaine invocation.

### Créer un workflow custom

Crée un dossier dans `workflows/` avec son `SKILL.md`, puis son adaptateur dans `.agents/skills/`, comme `/diagnostic` et `/relecture` le font.
