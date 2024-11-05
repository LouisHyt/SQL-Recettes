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


-- Listage de la structure de la base pour exo_recettes
CREATE DATABASE IF NOT EXISTS `exo_recettes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exo_recettes`;

-- Listage de la structure de table exo_recettes. category
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table exo_recettes.category : ~0 rows (environ)
INSERT INTO `category` (`id_category`, `category_name`) VALUES
	(3, 'dessert'),
	(2, 'dish'),
	(1, 'starter ');

-- Listage de la structure de table exo_recettes. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(25) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ingredient`) USING BTREE,
  UNIQUE KEY `ingredient_name` (`ingredient_name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table exo_recettes.ingredient : ~0 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `ingredient_name`, `price`) VALUES
	(1, 'rhum', 9.99),
	(2, 'beurre', 2.5),
	(3, 'huile', 1.95),
	(4, 'sucre', 3),
	(5, 'farine', 2.45),
	(6, 'oeuf', 0.85),
	(7, 'lait', 2.12),
	(8, 'nori', 3.5),
	(9, 'riz', 1.99),
	(10, 'eau', 0),
	(11, 'vinaigre de riz', 4.22),
	(12, 'saumon fumé', 5.31),
	(13, 'sel', 1.5),
	(14, 'semoule', 2.18),
	(15, 'levure', 0.85),
	(16, 'sucre vanillé', 1.05),
	(17, 'foie gras de canard', 15.4),
	(18, 'monbazillac', 18.5),
	(19, 'poivre', 1.4),
	(20, 'oeuf de caille', 0.79),
	(21, 'oignon rouge', 0.89),
	(22, 'vinaigre', 1.67),
	(23, 'comté', 3.41),
	(24, 'tomate', 0.68),
	(25, 'ciboulette', 1.42),
	(26, 'coriandre', 1.02),
	(28, 'vanille', 8.12),
	(30, 'pâtes', 1.45),
	(31, 'lardons', 1.88),
	(32, 'crême fraiche', 2.1);

-- Listage de la structure de table exo_recettes. recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id_recipe` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(100) NOT NULL,
  `prep_time` int NOT NULL DEFAULT '0',
  `instructions` text,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_recipe`),
  UNIQUE KEY `recipe_name` (`recipe_name`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `FK_recipe_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table exo_recettes.recipe : ~0 rows (environ)
INSERT INTO `recipe` (`id_recipe`, `recipe_name`, `prep_time`, `instructions`, `id_category`) VALUES
	(1, 'pâte à crêpes', 10, '• Étape 1\r\nMettre la farine dans une terrine et former un puits.\r\n\r\n• Étape 2\r\nY déposer les oeufs entiers, le sucre, l\'huile et le beurre.\r\n\r\n• Étape 3\r\nMélanger délicatement avec un fouet en ajoutant au fur et à mesure le lait. La pâte ainsi obtenue doit avoir une consistance d\'un liquide légèrement épais.\r\n\r\n• Étape 4\r\nParfumer de rhum.\r\n\r\n• Étape 5\r\nFaire chauffer une poêle antiadhésive et la huiler très légèrement à l\'aide d\'un papier Essuie-tout. Y verser une louche de pâte, la répartir dans la poêle puis attendre qu\'elle soit cuite d\'un côté avant de la retourner. Cuire ainsi toutes les crêpes à feu doux.', 3),
	(2, 'sushis Halloween', 30, '• Étape 1\r\nLavez le riz jusqu\'à ce que l\'eau soit claire. Égouttez et versez dans une casserole d\'eau bouillante. Faites cuire pendant 15 min environ. Éteignez le feu et laissez reposer dans la casserole pendant 10 min.\r\n\r\n• Étape 2\r\nDans un bol, mélangez le vinaigre, le sucre et une pincée de sel. Ajoutez cette préparation au riz et mélangez bien le tout. Laissez refroidir.\r\n\r\n• Étape 3\r\nAvec un emporte-pièce rond, découpez des disques de saumon fumé. Déposez un disque sur une feuille de film alimentaire. Avec vos mains, prélevez une portion de riz et façonnez-la en forme de boule. Disposez-la sur le disque de saumon. Fermez le film et serrez bien afin d\'obtenir un sushi bien compact. Retirez le sushis du papier.\r\n\r\n• Étape 4\r\nDécoupez la feuille de nori pour former le visage de la citrouille. Disposez sur le saumon. Renouvelez l\'opération jusqu\'à épuisement des ingrédients.', 2),
	(3, 'semoule vapeur', 15, '• Étape 1\r\nPour préparer votre semoule à l’eau, portez tout d\'abord à ébullition, dans une casserole, un poids identique d\'eau légèrement salée à celui de votre semoule (200 ml d\'eau pour 200 g de semoule).\r\n\r\n• Étape 2\r\nQuand l\'eau bout, éteignez le feu, puis versez la semoule et l\'huile d\'olive et remuez avec une fourchette pour bien détacher tous les grains. Couvrez la casserole et laissez la semoule gonfler pendant 5 min.\r\n\r\n• Étape 3\r\nDès que la semoule a suffisamment gonflé, si vous voulez bien détacher la graine, roulez-la dans vos mains, tout en y ajoutant le beurre.', 2),
	(4, 'gauffres', 20, '• Étape 1\r\nBattez l’œuf puis ajoutez le lait. Dans un autre récipient, mélangez la farine avec le sucre, le sel et la levure. Creusez un puits au centre, versez-y le mélange aux œufs et mélangez jusqu’à obtenir une pâte homogène. Laissez reposer 15 min au frigo.\r\n\r\n• Étape 2\r\nBeurrez ou huilez les plaques du gaufrier et faites-les chauffer. Déposez-y une louche de pâte, fermez et laissez cuire environ 5 min. Répétez pour les gaufres suivantes.', 3),
	(5, 'foie gras maison en bocaux', 75, '• Étape 1\r\nCommencez par dénerver le foie gras, en enlevant même les plus petits nerfs.\r\n\r\n• Étape 2\r\nDans des bocaux préalablement nettoyés et stérilisés, versez 2 c. à soupe de Montbazillac.\r\n\r\n• Étape 3\r\nDans une assiette, versez le sel et le poivre, puis roulez le foie gras dedans de sorte à bien l’enrober.\r\n\r\n• Étape 4\r\nPlacez le foie gras dans les bocaux, en veillant à ne pas les remplir entièrement (laissez 1-2 cm du bord). Fermez-les bien hermétiquement.\r\n\r\n• Étape 5\r\nPlacez vos bocaux de foie gras dans une grande cocotte et recouvrez-les d\'eau froide et portez la cocotte à ébullition. Laissez cuire pendant 30 min.\r\n\r\n• Étape 6\r\nAu bout de 30 min de cuisson, laissez refroidir puis sortez les bocaux de l’eau en faisant attention à ne pas vous ébouillanter.\r\n\r\n• Étape 7\r\nLes bocaux sont prêts !', 2),
	(6, 'Oeuf de caille', 8, '• Étape 1\r\nFaites chauffer une casserole remplie d’eau et plongez-y les œufs de caille.\r\n\r\n• Étape 2\r\nComptez 4 min de cuisson à partir de l’ébullition.\r\n\r\n• Étape 3\r\nPassez les œufs de caille durs sous l’eau froide après les avoir sortis de la casserole pour stopper leur cuisson.\r\n\r\n• Étape 4\r\nDégustez !', 1),
	(7, 'pickles d\'oignons rouges', 25, '• Étape 1\r\nPelez les oignons puis émincez-les en rondelles. Dans votre casserole versez l’eau, le vinaigre le sucre roux, le sel et le poivre et portez à ébullition. Ajoutez les oignons rouges et laissez cuire 10 minutes.\r\n\r\n• Étape 2\r\nDéposez les oignons dans un bocal de 250 ml environ et couvrez avec le jus de cuisson. Ajoutez le sel et poivre dans le bocal.Fermez le bocal et gardez au frais.', 1),
	(8, 'Gougères au comté', 50, '• Étape 1\r\nPréchauffez le four à 180°C (thermostat 6).\r\n\r\n• Étape 2\r\nDéposez dans une casserole le beurre coupé en morceaux. Faites-le fondre à feu doux avec le sel et 25 cl d’eau.\r\n\r\n• Étape 3\r\nLorsque le beurre est bien fondu, ajoutez la farine d’un seul coup. Mélangez vigoureusement à l’aide d’une spatule en bois, jusqu’à obtenir une pâte homogène, qui se décolle des parois de la casserole.\r\n\r\n• Étape 4\r\nAjoutez les œufs un à un en mélangeant bien à chaque fois.\r\n\r\n• Étape 5\r\nRâpez le Comté et ajoutez-le à la pâte à chou. Mélangez-bien pour le répartir uniformément.\r\n\r\n• Étape 6\r\nCouvrez une plaque de cuisson de papier sulfurisé. Déposez-y à l’aide de deux petites cuillères, des tas de pâte suffisamment espacés car ils vont gonfler à la cuisson.\r\n\r\n• Étape 7\r\nEnfournez pendant 35 minutes. Lorsque les gougères au Comté sont bien dorées, sortez-les du four.\r\n\r\n• Étape 8\r\nLaissez les gougères au Comté refroidir 1 ou 2 minutes pour ne pas vous brûler. Dégustez-les chaudes ou tièdes.', 1),
	(9, 'Salade de tomates', 10, '• Étape 1\r\nLavez les tomates et coupez-les en quartiers. Déposez-les ensuite dans un saladier.\r\n\r\n• Étape 2\r\nÉpluchez l\'oignon et émincez-le. Ajoutez-le aux quartiers de tomate puis mélangez.\r\n\r\n• Étape 3\r\nPréparez la vinaigrette en mélangeant l\'huile avec le vinaigre, la ciboulette et la coriandre ciselées. Salez et poivrez à votre convenance. Versez cette vinaigrette dans le saladier et placez-le au frais jusqu\'au moment de servir.', 2),
	(10, 'Iles flottantes', 15, '• Étape 1\r\nPréparez la crème anglaise en portant le lait à ébullition dans une casserole. Coupez la gousse de vanille en deux, grattez-en les grains et ajoutez-les au lait avec les morceaux de gousse. Laissez infuser et tiédir.\r\n\r\n• Étape 2\r\nSéparez les blancs des jaunes d’œufs. Conservez les blancs pour la suite de la recette. Dans un saladier, mélangez au batteur les jaunes avec le sucre en poudre. Versez peu à peu le lait tiédi et filtré sur les jaunes d’œufs battus en fouettant vigoureusement.\r\n\r\n• Étape 3\r\nVersez le tout dans la casserole et faites chauffer doucement pour épaissir pendant 10 min, sans atteindre l\'ébullition. Veillez à bien remuer régulièrement la crème anglaise à l’aide d’une spatule en bois. Lorsqu’elle nappe bien la cuillère, ôtez du feu et laissez refroidir dans un saladier. Puis réservez au réfrigérateur.\r\n\r\n• Étape 4\r\nBattez les blancs en neige à l’aide d’un fouet électrique. Lorsqu’ils commencent à devenir fermes, incorporez le sucre en poudre et continuez de battre quelques minutes.\r\n\r\n• Étape 5\r\nDans une grande casserole, faites bouillir de l’eau. À l’aide d’une écumoire, découpez des portions de blanc d’œuf que vous plongerez soigneusement dans l’eau frémissante pendant 30 sec de chaque côté. Lorsque les œufs en neige sont cuits, disposez-les dans le saladier de crème anglaise. Réservez au réfrigérateur jusqu’au moment de servir.', 3),
	(12, 'pâtes à la carbonara', 20, 'Faites cuir des pâtes. Faites griller des lardons. Verser de la crème fraiche ainsi que des jaunes d\'oeufs dans votre casserole. Mélanger le tout et assaisonnez', 2);

-- Listage de la structure de table exo_recettes. recipe_composition
CREATE TABLE IF NOT EXISTS `recipe_composition` (
  `quantity` float NOT NULL DEFAULT '0',
  `id_recipe` int NOT NULL,
  `id_ingredient` int NOT NULL,
  `unity` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_recipe` (`id_recipe`),
  CONSTRAINT `FK_recipe_composition_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_recipe_composition_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table exo_recettes.recipe_composition : ~0 rows (environ)
INSERT INTO `recipe_composition` (`quantity`, `id_recipe`, `id_ingredient`, `unity`) VALUES
	(3, 1, 6, 'entier'),
	(60, 1, 7, 'cl'),
	(300, 1, 5, 'g'),
	(3, 1, 4, 'cuillères à soupe'),
	(2, 1, 3, 'cuillères à soupe'),
	(50, 1, 2, 'g'),
	(1, 2, 8, 'feuille'),
	(350, 2, 9, 'g'),
	(38.5, 2, 10, 'cl'),
	(4.8, 2, 11, 'cl'),
	(11.8, 2, 4, 'g'),
	(4.5, 2, 12, 'tranches'),
	(1, 2, 13, 'g'),
	(200, 3, 14, 'g'),
	(200, 3, 10, 'ml'),
	(1, 3, 3, 'cuillères à soupe'),
	(10, 3, 2, 'g'),
	(1, 3, 13, 'pincée'),
	(150, 4, 5, 'g'),
	(40, 4, 7, 'cl'),
	(1, 4, 6, 'entier'),
	(0.5, 4, 16, 'sachet'),
	(0.5, 4, 15, 'sachet'),
	(1, 4, 13, 'pincée'),
	(1.2, 5, 17, 'kg'),
	(25, 5, 18, 'cl'),
	(1, 5, 19, 'pincée'),
	(1, 5, 13, 'pincée'),
	(3, 6, 20, 'entier'),
	(2, 7, 21, 'entier'),
	(60, 7, 22, 'ml'),
	(160, 7, 10, 'ml'),
	(1, 7, 13, 'cuillères à soupe'),
	(2, 7, 4, 'cuillères à soupe'),
	(1, 7, 13, 'pincée'),
	(1, 7, 19, 'pincée'),
	(75, 8, 23, 'g'),
	(3, 8, 6, 'entier'),
	(125, 8, 5, 'g'),
	(50, 8, 2, 'g'),
	(0.5, 8, 13, 'cuillères à café'),
	(3, 9, 24, 'entière'),
	(1, 9, 21, 'entier'),
	(3, 9, 3, 'cuillères à soupe'),
	(1, 9, 22, 'cuillères à soupe'),
	(10, 9, 25, 'brins'),
	(5, 9, 26, 'brins'),
	(1, 9, 19, 'pincée'),
	(1, 9, 13, 'pincée'),
	(4, 10, 6, 'entier'),
	(80, 10, 4, 'g'),
	(0.5, 10, 7, 'l'),
	(1, 10, 28, 'gousse'),
	(1, 12, 21, 'entier'),
	(250, 12, 31, 'g'),
	(500, 12, 30, 'g'),
	(1, 12, 19, 'pincée'),
	(1, 12, 13, 'pincée'),
	(50, 12, 32, 'cl'),
	(1, 12, 6, 'entier');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
