# Pipeline de relecture complet

Lance un pipeline de relecture en trois passes séquentielles sur le texte fourni. Chaque passe utilise un agent différent avec son rôle complet.

## Passe 1 — Script Doctor (structure & rythme)

Lis et applique `la-troupe/core/script-doctor/SKILL.md`.

Produis :
- Rapport de diagnostic (verdict, problèmes critiques/secondaires, priorités)
- Liste de coupe (passages candidats à la suppression)

## Passe 2 — Étranger (lecture froide)

Lis et applique `la-troupe/core/etranger/SKILL.md`.

Produis :
- Rapport de lecture froide (compréhension, confusion, accroche/décrochage)
- Marquage de confusion (✓ / ? / ✗ par passage)

## Passe 3 — Correcteur (langue)

Lis et applique `la-troupe/core/correcteur/SKILL.md`.

Produis :
- Liste d'erreurs avec localisation
- Rapport de cohérence orthographique (noms propres, termes récurrents)

## Rapport final

Synthèse consolidée :
1. **Top 3 des corrections prioritaires** (tous agents confondus)
2. **Forces du texte** (ce qui marche)
3. **Recommandation** : prêt à publier / nécessite une réécriture partielle / nécessite une refonte

---

Texte à relire : $ARGUMENTS
