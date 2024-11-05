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
SELECT * FROM recipe WHERE prep_time < 30

--4
SELECT * FROM recipe WHERE 

--5
SELECT * FROM recipe WHERE recipe_name LIKE '%salade%'