# La Troupe

Framework d'écriture multi-agents. Chaque agent porte un prénom et un rôle défini
par un `SKILL.md`, avec un périmètre strict et des livrables fixes.

**La référence unique est [`SKILL.md`](SKILL.md)** : liste des agents, workflows,
règles de routage et conventions de signature. Ne pas dupliquer cette liste
ailleurs — la maintenir à deux endroits est la seule façon de la faire diverger.

## Où vivent les agents

| Emplacement | Rôle |
|---|---|
| `core/`, `modules/`, `workflows/` | Les agents eux-mêmes. Un dossier, un `SKILL.md`. Génériques : aucune référence à un projet. |
| `.agents/skills/` *(racine du workspace)* | Adaptateurs lus par Codex. Un par agent, il pointe vers le `SKILL.md` du framework. |
| `.claude/skills/` *(racine)* | Copie stricte des précédents, lue par Claude. Régénérée par `scripts/sync_claude_skills.py`. |
| `.claude/commands/` *(racine)* | Forçage manuel par prénom (`/Mira`), plus `/aide`, `/roles`, `/status`. Toujours `disable-model-invocation: true`. |

Le routage automatique passe par les **skills**, pas par les commandes. Les
commandes ne servent qu'à imposer un rôle contre le routage.

## Ajouter ou modifier un agent

1. Écrire ou modifier le `SKILL.md` dans `core/`, `modules/` ou `workflows/`.
2. Créer l'adaptateur dans `.agents/skills/<nom>/SKILL.md` (frontmatter `name` +
   `description` : c'est la description qui décide du routage automatique).
3. `py la-troupe/scripts/sync_claude_skills.py` pour propager vers `.claude/skills/`.
4. Ajouter la commande prénom dans `.claude/commands/` si l'agent en a un.
5. `pwsh -File la-troupe/scripts/validate.ps1` — la validation est dérivée du
   disque : un agent sans adaptateur, une commande auto-invocable, une commande
   qui doublonne un skill ou une cible absente font échouer le contrôle.
