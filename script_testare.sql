-- Afisare ce ingrediente sunt necesare tuturor produselor 

SELECT p.nume_produs, i.nume_ingredient, r.cantitate_ingredient
FROM Produse p, Reteta r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient;

-- Afisare cate produse mai sunt in stoc pe baza ingredientelor

SELECT p.nume_produs, MIN(FLOOR((SELECT i.stoc_ingredient/r.cantitate_ingredient FROM DUAL))) as nr_preparate_disponibile
FROM Produse p, Reteta r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient
GROUP BY p.nume_produs;

-- Afisarea produselor al ultimei comenzi efectuate la o masa anume

SELECT c.id_comanda, p.nume_produs, pc.nr_produse_comandate, c.nr_masa, c.data_comanda
FROM Comenzi c, produse_comenzi pc, Produse p
WHERE c.id_comanda = pc.Comenzi_id_comanda and c.id_comanda = (SELECT MAX(id_comanda) FROM Comenzi WHERE nr_masa = 1) and pc.Produse_nr_produs = p.nr_produs;

-- Calcularea si afisarea pretului tuturor comenzilor din ultimele 30 de zile

SELECT c.id_comanda, SUM(p.pret * pc.nr_produse_comandate) as total_plata, c.nr_masa, c.data_comanda
FROM Comenzi c, produse_comenzi pc, Produse p
WHERE c.id_comanda = pc.Comenzi_id_comanda and pc.Produse_nr_produs = p.nr_produs and TRUNC(c.data_comanda) >= TRUNC(sysdate - 30)
GROUP BY c.id_comanda, c.nr_masa, c.data_comanda
ORDER BY c.id_comanda;

-- Suma facuta intreaga zi

SELECT SUM(p.pret * pc.nr_produse_comandate) as total_astazi, TRUNC(sysdate) as data_de_azi
FROM Comenzi c, produse_comenzi pc, Produse p
WHERE c.id_comanda = pc.Comenzi_id_comanda and pc.Produse_nr_produs = p.nr_produs and TRUNC(c.data_comanda) = TRUNC(sysdate);