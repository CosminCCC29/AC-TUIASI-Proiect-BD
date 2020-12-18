-------------------------------------- AFISARI --------------------------------------

-- Afisare ce ingrediente sunt necesare tuturor produselor 

SELECT p.nume_produs, i.nume_ingredient, r.cantitate_ingredient
FROM Produse p, Retete r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient;

-- Afisare cate produse mai sunt in stoc pe baza ingredientelor

SELECT p.nume_produs, MIN(FLOOR((SELECT i.stoc_ingredient/r.cantitate_ingredient FROM DUAL))) as nr_preparate_disponibile
FROM Produse p, Retete r, Ingrediente i 
WHERE p.nr_produs = r.Produse_nr_produs and i.id_ingredient = r.Ingrediente_id_ingredient
GROUP BY p.nume_produs;

-- Afisarea produselor al ultimei comenzi efectuate la o masa anume

SELECT c.id_comanda, p.nume_produs, pc.nr_produse_comandate, c.nr_masa, (SELECT to_char(c.data_comanda,'DD-MON-YYYY HH24:MI:SS') from dual) as data_si_ora_comanda
FROM Comenzi c, produse_comenzi pc, Produse p
WHERE c.id_comanda = pc.Comenzi_id_comanda and c.id_comanda = (SELECT MAX(id_comanda) FROM Comenzi WHERE nr_masa = 1) and pc.Produse_nr_produs = p.nr_produs;

-- Calcularea si afisarea pretului tuturor comenzilor din ultimele 30 de zile

SELECT c.id_comanda, SUM(p.pret * pc.nr_produse_comandate) as total_plata, c.nr_masa, (SELECT to_char(c.data_comanda,'DD-MON-YYYY HH24:MI:SS') from dual) as data_si_ora_comanda
FROM Comenzi c, produse_comenzi pc, Produse p
WHERE c.id_comanda = pc.Comenzi_id_comanda and pc.Produse_nr_produs = p.nr_produs and TRUNC(c.data_comanda) >= TRUNC(sysdate - 30)
GROUP BY c.id_comanda, c.nr_masa, c.data_comanda
ORDER BY c.id_comanda;

-- Suma facuta intreaga zi

SELECT SUM(p.pret * pc.nr_produse_comandate) as total_astazi, SUM(pc.nr_produse_comandate) as produse_vandute_astazi, TRUNC(sysdate) as data_de_azi
FROM Comenzi c, produse_comenzi pc, Produse p
WHERE c.id_comanda = pc.Comenzi_id_comanda and pc.Produse_nr_produs = p.nr_produs and TRUNC(c.data_comanda) = TRUNC(sysdate);

-- Dezactivare produs (stergerea stocului in caz ca exista)

BEGIN
    UPDATE Produse p
    SET p.stare = 'INACTIV'
    WHERE p.nr_produs = (SELECT nr_produs FROM produse WHERE nume_produs = 'Ursus 330 ml');

    DELETE FROM stocuri_produs WHERE Produse_nr_produs = (SELECT nr_produs FROM produse WHERE nume_produs = 'Ursus 330 ml');
END;

-------------------------------------- VERIFICARE CONSTRANGERI --------------------------------------

-- Verificare contrangere nume prenume cont
INSERT INTO administratori(nume_prenume_cont, parola_cont) VALUES('Ionut-Mihai', '3158');

-- Verificare contrangere inserare/actualizare stoc negativ
UPDATE Ingrediente i
SET i.stoc_ingredient = -1
WHERE i.id_ingredient = (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'portocala');

-- Verificare introducere data < SYSDATE
INSERT INTO Comenzi(id_comanda, data_comanda) VALUES(NULL, SYSDATE-1);

-- Verificare numele ingredientului si producatorului sa fie unice
INSERT INTO Ingrediente(nume_ingredient, stoc_ingredient, producator, tipuri_aliment_id_tip) VALUES('piept de pui', 35, (SELECT id_tip FROM tipuri_aliment WHERE nume_tip = 'carne'));

-- Verificare numele categoriei sa fie unic pentru fiecare meniu
INSERT INTO categorii(nume_categorie, Meniuri_nr_meniu) VALUES('Preparate din carne', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2017'));
INSERT INTO categorii(nume_categorie, Meniuri_nr_meniu) VALUES('Preparate din carne', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2016'));

INSERT INTO categorii(nume_categorie, Meniuri_nr_meniu) VALUES('Preparate din carne', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));