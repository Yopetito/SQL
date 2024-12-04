-- 1.- afficher recettes dispo (nom, catégorie, temps de prepa-
SELECT nom, tempsPreparation, nomCategorie AS categorie
FROM recette

INNER JOIN categorie
ON recette.id_Categorie = categorie.id_Categorie

ORDER BY tempsPreparation DESC

-- 2.- ajouter nombre d'ingrédients

SELECT nom, tempsPreparation, nomCategorie, COUNT(id_ingredient) AS nombreIngredients
FROM recette

INNER JOIN categorie
ON recette.id_Categorie = categorie.id_Categorie

INNER JOIN miseenplace
ON recette.id_Recette = miseenplace.id_Recette

GROUP BY recette.id_Recette

ORDER BY tempsPreparation DESC

-- 3.- Au moins 30 min de prepa

SELECT recette.nom FROM recette
WHERE recette.tempsPreparation >= 30

-- 4.- Afficher recette avec "salade"

SELECT recette.nom FROM recette
WHERE recette.nom LIKE '%Salade%'

-- 5.- Ajouter pates carbo

INSERT INTO recette
VALUES (8, 'Pates a la carbonara', 35, 'Faire ceci faire cela', 2)

--6.- Modifier nom recette numero 3

UPDATE recette
SET nom = 'Velouté de carrote'
WHERE id_recette = 3

-- 7.- Ajouter pas carbo

DELETE FROM miseenplace
WHERE id_recette = 2;

DELETE FROM recette
WHERE id_recette = 2;

--8.-  afficher prix total recette n5

SELECT recette.id_Recette, recette.nom, SUM(ingredient.prixIngredient) AS prixTotal
FROM recette

INNER JOIN miseenplace
ON recette.id_recette = miseenplace.id_recette

INNER JOIN ingredient
ON miseenplace.id_ingredient = ingredient.id_Ingredient

WHERE recette.id_Recette = 5

GROUP BY	recette.id_Recette

--9.- Details de la recette 5

SELECT 
recette.id_Recette,
recette.nom, 
ingredient.nomIngredient,
miseenplace.qttIngredient,
miseenplace.uniteDeMesure,
SUM(ingredient.prixIngredient) AS prixTotal

FROM recette

INNER JOIN miseenplace
ON recette.id_recette = miseenplace.id_recette

INNER JOIN ingredient
ON miseenplace.id_ingredient = ingredient.id_Ingredient

WHERE recette.id_Recette = 5

GROUP BY	recette.nom, ingredient.nomIngredient, miseenplace.qttIngredient, miseenplace.uniteDeMesure;

--10.- Ajouter poivre

INSERT INTO ingredient (id_ingredient, nomIngredient, prixIngredient)
VALUES (NULL, 'Poivre', '2.5')

--11.- modifier prix ingredient n12
UPDATE ingredient
SET prixIngredient = 50
WHERE id_Ingredient = 12

--12.- afficher nombre de recettes par categorie

SELECT categorie.nomCategorie, COUNT(recette.id_Recette) AS Quantité
FROM recette

INNER JOIN categorie 
ON recette.id_Categorie = categorie.id_Categorie

GROUP BY categorie.nomCategorie;

--13.- Afficher recettes avec ingredient Poulet
SELECT 
   recette.nom AS recette_nom, 
   ingredient.nomIngredient
FROM recette

INNER JOIN miseenplace 
ON recette.id_recette = miseenplace.id_recette

JOIN ingredient 
ON miseenplace.id_ingredient = ingredient.id_ingredient

WHERE ingredient.nomIngredient LIKE '%Poulet%';

--14.- Diminuter de 5 min le temps de prepa de toutes recettes
UPDATE recette
SET tempsPreparation = tempsPreparation - 5;
