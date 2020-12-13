-- Afisare ce ingrediente sunt necesare tuturor produselor 

SELECT p.nume_produs, i.nume_ingredient, r.cantitate_ingredient
FROM Produse p, Reteta r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient;

-- Afisare cate produse mai sunt in stoc pe baza ingredientelor

SELECT p.nume_produs, MIN(FLOOR((SELECT i.stoc_ingredient/r.cantitate_ingredient FROM DUAL))) as nr_preparate_disponibile
FROM Produse p, Reteta r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient
GROUP BY p.nume_produs;
