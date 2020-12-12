-- Afisare ce ingrediente sunt necesare tuturor produselor 

SELECT p.nume_produs, i.nume_ingredient, r.cantitate_ingredient
FROM Produse p, Reteta r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient;

-- Numarul de produse din fiecare categorie

SELECT (SELECT c.nume_categorie from Categorii c WHERE nr_categorie = cp.Categorii_nr_categorie), COUNT(*) as NR_PRODUSE
FROM categorii_produse cp
GROUP BY cp.Categorii_nr_categorie
ORDER BY cp.Categorii_nr_categorie;

-- Afisare cate produse mai sunt in stoc pe baza ingredientelor

SELECT p.nume_produs, MIN(FLOOR((SELECT i.stoc_ingredient/r.cantitate_ingredient FROM DUAL))) as nr_preparate_disponibile
FROM Produse p, Reteta r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient
GROUP BY p.nume_produs;
