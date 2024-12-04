BDD RECETTES DE CUISINE:
EXERCICES DE REQUETES A PARTIR DE LA LIGNE 170.

	
-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recipe
CREATE DATABASE IF NOT EXISTS `recipe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipe`;

-- Listage de la structure de table recipe. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recipe.categorie : ~3 rows (environ)
REPLACE INTO `categorie` (`id_categorie`, `nomCategorie`) VALUES
	(1, 'entree'),
	(2, 'plat'),
	(3, 'dessert');

-- Listage de la structure de table recipe. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nomIngredient` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recipe.ingredient : ~30 rows (environ)
REPLACE INTO `ingredient` (`id_ingredient`, `nomIngredient`) VALUES
	(1, 'chouvert'),
	(2, 'oignons'),
	(3, 'rizcru'),
	(4, 'viande'),
	(5, 'beurre'),
	(6, 'bouillonboeuf'),
	(7, 'farine'),
	(8, 'courgette'),
	(9, 'canard'),
	(10, 'tomates'),
	(11, 'abricots'),
	(12, 'framboises'),
	(13, 'cremeliquide'),
	(14, 'sucreenpoudre'),
	(15, 'vanille'),
	(16, 'groseille'),
	(17, 'beurre'),
	(18, 'cannelle'),
	(19, 'huileolive'),
	(20, 'sojatexture'),
	(21, 'haricotsrouges'),
	(22, 'carottes'),
	(23, 'ail'),
	(24, 'tomates'),
	(25, 'oeufs'),
	(26, 'poivre'),
	(27, 'pommesdeterre'),
	(28, 'fromage'),
	(29, 'lardon'),
	(30, 'pates');

-- Listage de la structure de table recipe. miseenplace
CREATE TABLE IF NOT EXISTS `miseenplace` (
  `id_ingredient` int NOT NULL DEFAULT '0',
  `id_recette` int NOT NULL DEFAULT '0',
  `qttIngredient` int NOT NULL DEFAULT '0',
  `uniteDeMesure` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `prixIngredient` float NOT NULL DEFAULT '0',
  KEY `FK_ingredients_recette_ingredients` (`id_ingredient`),
  KEY `FK_ingredients_recette_recette` (`id_recette`),
  CONSTRAINT `FK_ingredients_recette_ingredients` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_ingredients_recette_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recipe.miseenplace : ~37 rows (environ)
REPLACE INTO `miseenplace` (`id_ingredient`, `id_recette`, `qttIngredient`, `uniteDeMesure`, `prixIngredient`) VALUES
	(3, 1, 250, 'g', 2),
	(1, 1, 10, 'piece', 5),
	(2, 1, 1, 'L', 10),
	(4, 1, 20, 'ml', 1.5),
	(5, 2, 10, 'g', 0.8),
	(6, 2, 5, 'g', 20),
	(7, 2, 400, 'ml', 15),
	(8, 3, 200, 'g', 54),
	(9, 3, 3, 'piece', 0.7),
	(15, 3, 10, 'g', 0.5),
	(11, 3, 250, 'g', 10),
	(12, 4, 2, 'piece', 15),
	(13, 4, 50, 'g', 214),
	(14, 4, 10, 'g', 10),
	(12, 5, 1, 'L', 13),
	(13, 5, 12, 'g', 0.99),
	(15, 5, 10, 'g', 1.99),
	(16, 6, 400, 'ml', 0.5),
	(5, 6, 5, 'piece', 10),
	(7, 6, 200, 'g', 5),
	(18, 6, 20, 'ml', 4),
	(2, 7, 45, 'g', 10),
	(19, 7, 8, 'piece', 10),
	(20, 7, 10, 'piece', 2),
	(21, 8, 5, 'g', 0.5),
	(22, 8, 300, 'g', 15),
	(2, 8, 300, 'g', 10),
	(26, 8, 300, 'g', 7),
	(23, 9, 10, 'g', 8),
	(15, 9, 5, 'g', 7),
	(2, 9, 250, 'ml', 6),
	(27, 10, 30, 'g', 5),
	(25, 10, 40, 'g', 4),
	(2, 10, 50, 'g', 3),
	(7, 10, 20, 'piece', 2),
	(5, 11, 200, 'g', 1),
	(4, 4, 1, 'piece', 2);

-- Listage de la structure de table recipe. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tempsPreparation` int NOT NULL,
  `instructions` text COLLATE utf8mb4_bin NOT NULL,
  `id_categorie` int NOT NULL,
  PRIMARY KEY (`id_recette`) USING BTREE,
  KEY `FK_recette_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recipe.recette : ~12 rows (environ)
REPLACE INTO `recette` (`id_recette`, `nom`, `tempsPreparation`, `instructions`, `id_categorie`) VALUES
	(1, 'chou farci', 75, '', 2),
	(2, 'sauce au poivre', 15, '', 2),
	(3, 'brochettes de canard', 30, '', 2),
	(4, 'mousse au framboise', 20, '', 3),
	(5, 'panna cotta framboise', 15, '', 3),
	(6, 'muffins aux groseilles', 45, '', 3),
	(7, 'bouillon de legumes', 15, '', 1),
	(8, 'steak vegetarien aux haricots', 15, '', 1),
	(9, 'steakhacheavecsaladeetsauce', 55, '', 1),
	(10, 'rostis maison', 30, '', 1),
	(11, 'patescarbonara', 30, '', 2),
	(12, 'tasse d\eau chaud', 2, '', 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;



	
/*------------------------------------------------------------------------------*/
	
-- 1.- afficher recettes dispo (nom, catégorie, temps de prepa-
SELECT nom, tempsPreparation, nomCategorie AS categorie
FROM recette

INNER JOIN categorie
ON recette.id_Categorie = categorie.id_Categorie

ORDER BY tempsPreparation DESC

2.- ajouter nombre d'ingrédients

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

--15.Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure 

SELECT nom
FROM recette

INNER JOIN miseenplace
ON recette.id_recette = miseenplace.id_recette

WHERE miseenplace.prixIngredient <= 2

GROUP BY nom;

--16.- Afficher la / les recette(s) les plus rapides à préparer

SELECT
	nom, tempsPreparation AS Temps
FROM
	recette

WHERE 
	tempsPreparation = (SELECT MIN(tempsPreparation) FROM recette)

/*----------------------------------------------------------------*/

SELECT
	nom, tempsPreparation AS Temps
FROM
	recette

HAVING 
	tempsPreparation = ALL (SELECT MIN(tempsPreparation) FROM recette)

--17.- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau 
--chaude qui consiste à verser de l’eau chaude dans une tasse)

SELECT nom
FROM recette

LEFT JOIN miseenplace
ON recette.id_recette = miseenplace.id_recette

WHERE miseenplace.id_ingredient IS NULL

--18.- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes

SELECT nomIngredient
FROM ingredient

INNER JOIN miseenplace
ON ingredient.id_ingredient = miseenplace.id_ingredient

INNER JOIN recette
ON miseenplace.id_recette = recette.id_recette

GROUP BY nomIngredient
HAVING COUNT(ingredient.id_ingredient) >= 3

--19.-Ajouter un nouvel ingrédient à une recette spécifique
INSERT INTO miseenplace(id_ingredient, id_recette, qttIngredient, uniteDeMesure, prixIngredient)
VALUES(4, 4, 1, 'piece', 2)

--20.- Trouver la recette la plus chere
/* WITH (CTE common table expression) crée une table temporaire (ici nommée recetteLaPlusChere, avec une requete scondaire
afin de l'utiliser dans la requete principale.  */

WITH recetteLaPlusChere AS (
	SELECT nom, SUM(miseenplace.prixIngredient) AS prixTotal
	FROM recette

	JOIN miseenplace
	ON recette.id_recette = miseenplace.id_recette

	GROUP BY nom
	)

SELECT nom, prixTotal
FROM recetteLaPlusChere
WHERE prixTotal = (SELECT MAX(prixTotal) FROM recetteLaPlusChere);

