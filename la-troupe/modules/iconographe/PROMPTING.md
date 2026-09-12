# Prompting d'image — référence de l'Iconographe

Gabarit et règles de rédaction des prompts de génération d'image. Document générique de La Troupe : aucune référence à un projet précis. Les faits visuels canoniques viennent toujours de l'article et de la direction artistique du projet actif.

## Règle des références (impérative)

**Dès qu'une image de référence est jointe à un prompt, son rôle doit être décrit dans le prompt lui-même** — jamais seulement listée à côté.

Sans consigne, le générateur reçoit l'image et ne sait pas quoi en faire : il la subit (copie tout, ou l'ignore) au lieu de l'exploiter. C'est une faute qui casse la continuité visuelle recherchée.

Ouvrir donc chaque prompt à références par un bloc explicite :

```text
You are given N reference images. Use them strictly as follows:
- Reference 1 (courte description de ce qu'on voit) : copier X ; NE PAS reproduire Y.
- Reference 2 (courte description) : utiliser seulement Z ; ignorer le reste.
```

- Dire pour chaque référence **ce qu'il faut copier** et **ce qu'il faut ignorer**.
- Préciser **l'ordre de chargement** quand il compte.
- Répéter le rôle même si un fichier sert à plusieurs images : chaque prompt doit être utilisable seul.
- Reprendre les exclusions dans le bloc `À ÉVITER` (« copying the ice wall from reference 1 », etc.) pour verrouiller le refus.

## Ordre des blocs d'un prompt

1. **Bloc références** (si des images sont jointes — voir ci-dessus).
2. **Usage et format** : nature de l'image, cadrage, ratio, niveau de détail.
3. **Médium et facture** : catégorie visible d'abord, puis technique (`peinture — huile…`, `photographie — plaque…`, `dessin — graphite…`).
4. **Sujet canonique** : apparence, matières, technologie, environnement, époque — uniquement des faits établis.
5. **Composition** : position des masses, point de vue, direction des regards et mouvements.
6. **Action lisible** : ce qui se passe, et ce qui doit rester hors champ.
7. **Direction artistique** : palette, lumière, registre — selon la DA du projet.
8. **Bloc `À ÉVITER`** : erreurs probables, éléments non canoniques, mauvais usage des références.

## Vocabulaire de composition

- Employer des repères non ambigus : `SCREEN LEFT`, `SCREEN RIGHT`, `foreground`, `middle ground`, `rear three-quarter view`.
- Situer chaque groupe ou masse explicitement plutôt que de décrire une ambiance vague.
- Pour une figure large destinée à un wiki, viser un format horizontal haute définition (p. ex. 16:9, 3840 × 2160).

## Médium

- Toujours annoncer la **catégorie commune** avant le procédé : `Peinture — …`, `Photographie — …`, `Dessin — …`, `Gravure — …`, `Dessin technique — …`.
- Ne jamais employer seul un procédé secondaire (un « tirage au charbon » est une photographie, pas un médium autonome).
- Après réception, contrôler que la matière visible correspond à la catégorie annoncée ; corriger la provenance sinon.

## Série et autonomie

- Chaque prompt d'une série est **autosuffisant** : répéter les invariants visuels essentiels dans chacun.
- Un générateur ne doit jamais dépendre du prompt précédent ni d'un contexte implicite.

## Texte dans l'image

- Interdire le texte, les inscriptions, logos et signalétiques générés (rendus illisibles).
- La provenance et les légendes vivent dans le wiki, pas dans l'image — sauf demande explicite de l'auteur.
