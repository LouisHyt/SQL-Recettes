-- 1 
SELECT r.recipe_name, r.prep_time, cg.category_name 
FROM recipe r 
INNER JOIN category cg 
ON r.id_category = cg.id_category 
ORDER BY r.prep_time DESC

-- 2 
SELECT r.recipe_name, r.prep_time, cg.category_name, count(rc.id_recipe) AS ingredient_amount 
FROM recipe r 
INNER JOIN category cg 
ON r.id_category = cg.id_category
INNER JOIN recipe_composition rc
ON r.id_recipe = rc.id_recipe 
GROUP BY r.id_recipe
ORDER BY r.prep_time DESC

-- 3
SELECT recipe_name, prep_time 
FROM recipe 
WHERE prep_time < 30 
ORDER BY prep_time DESC

-- 4
SELECT recipe_name, prep_time, instructions 
FROM recipe 
WHERE recipe_name 
LIKE '%salade%'

-- 5 On Ajoute la recette
INSERT INTO recipe (recipe_name, prep_time, instructions, id_category) 
VALUES 
("pâtes à la carbonara", 20, "Faites cuir des pâtes. Faites griller des lardons. Verser de la crème fraiche ainsi que des jaunes d'oeufs dans votre casserole. Mélanger le tout et assaisonnez", (SELECT id_category FROM category WHERE category_name = 'dish'))

-- 5.2 On ajoute les ingrédients manquants
INSERT INTO ingredient (ingredient_name, price)
VALUES
("pâtes", 1.45),
("lardons", 1.88),
("crême fraiche", 2.10)

-- 5.3 On lie la recette et les ingrédients
INSERT INTO recipe_composition 
VALUES
(1, 12, 21, "entier"),
(250, 12, 31, "g"),
(500, 12, 30, "g"),
(1, 12, 19, "pincée"),
(1, 12, 13, "pincée"),
(50, 12, 32, "cl"),
(1, 12, 6, "entier")


-- 6
UPDATE recipe 
SET recipe_name = "semoule vapeur" 
WHERE id_recipe = 3

--7
DELETE 
FROM recipe 
WHERE id_recipe = 2

--8
SELECT ROUND(SUM(ing.price), 2) AS totalprice
FROM recipe_composition rc
INNER JOIN ingredient ing 
ON ing.id_ingredient = rc.id_ingredient
WHERE id_recipe = 5

-- 9
SELECT ing.ingredient_name, rc.quantity, ing.price
FROM recipe_composition rc
INNER JOIN ingredient ing
ON ing.id_ingredient = rc.id_ingredient
WHERE id_recipe = 5

-- 10 (L'unité de mesure est gérée dans une table associative, je ne l'ajoute pas directement dans la table ingrédient)
INSERT INTO ingredient (ingredient_name, price)
VALUES
("poivre", 2.5),

-- 11
UPDATE ingredient 
SET price = 8.50 
WHERE ingredient_name = 'rhum'

-- 12
SELECT ct.category_name, COUNT(r.id_recipe) AS recipe_count
FROM recipe r
INNER JOIN category ct
ON r.id_category = ct.id_category
GROUP BY ct.id_category

-- 12: Afficher toutes les catégories même celles à 0
SELECT c.category_name, COUNT(r.id_recipe) AS recipe_count
FROM category c
LEFT JOIN recipe r
ON c.id_category = r.id_category
GROUP BY c.id_category

-- 12: Afficher uniquement les catégories dont aucune recette n'y est rattaché
SELECT c.category_name
FROM category c
LEFT JOIN recipe r
ON c.id_category = r.id_category
WHERE r.id_category IS NULL
GROUP BY c.id_category

-- 13
SELECT recipe_name, prep_time, instructions
FROM recipe r
INNER JOIN recipe_composition rc
ON r.id_recipe = rc.id_recipe
WHERE rc.id_ingredient = (SELECT id_ingredient FROM ingredient WHERE ingredient_name = "beurre")

-- 14
UPDATE recipe 
SET prep_time = prep_time - 5

-- 15


-- 16: Affiche Les 5 recettes les plus rapides à préparer
SELECT recipe_name, prep_time, instructions
FROM recipe
ORDER BY prep_time ASC
LIMIT 5

-- 17
SELECT r.recipe_name, r.prep_time, r.instructions
FROM recipe r
LEFT JOIN recipe_composition rc 
ON rc.id_recipe = r.id_recipe
WHERE rc.id_recipe IS NULL

-- 18
SELECT ing.ingredient_name, COUNT(rc.id_ingredient) AS recipe_count
FROM recipe_composition rc
INNER JOIN ingredient ing
ON rc.id_ingredient = ing.id_ingredient
GROUP BY rc.id_ingredient
HAVING COUNT(rc.id_ingredient) >= 3

-- 19
INSERT INTO ingredient
VALUES ("sauce soja", 2.36)

INSERT INTO recipe_composition
VALUES (50, 2, (SELECT id_ingredient FROM ingredient WHERE ingredient_name =  "sauce soja"), 'ml')

-- 20
SELECT r.recipe_name, ROUND(SUM(ing.price), 2) AS total_price
FROM recipe r
INNER JOIN recipe_composition rc
ON r.id_recipe = rc.id_recipe
INNER JOIN ingredient ing
ON rc.id_ingredient = ing.id_ingredient
GROUP BY r.id_recipe
HAVING total_price >= ALL(
	SELECT ROUND(SUM(ing.price), 2) AS total_price
	FROM recipe r
	INNER JOIN recipe_composition rc
	ON r.id_recipe = rc.id_recipe
	INNER JOIN ingredient ing
	ON rc.id_ingredient = ing.id_ingredient
	GROUP BY r.id_recipe
)




