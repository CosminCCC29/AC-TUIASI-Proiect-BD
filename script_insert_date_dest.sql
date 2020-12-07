-- cat_nr_men_nr_cat_nume_cat_un
-- ingr_id_ingr_nume_ingr_prod_un

-- Stergere tabele

BEGIN

  FOR i IN (SELECT ut.table_name
              FROM USER_TABLES ut) LOOP
    EXECUTE IMMEDIATE 'drop table '|| i.table_name ||' CASCADE CONSTRAINTS ';
  END LOOP;

END;

-- Inserare in tabela administratori

INSERT INTO administratori(id_admin, nume_prenume_cont, parola_cont) VALUES(1, 'Cojocaru Cosmin', '134679');
INSERT INTO administratori(id_admin, nume_prenume_cont, parola_cont) VALUES(2, 'Budeanu Radu', 'parola123');
INSERT INTO administratori(id_admin, nume_prenume_cont, parola_cont) VALUES(3, 'Alexandru Gabriel', '123456789');

-- Inserare in tabela meniuri

INSERT INTO meniuri(nr_meniu, nume_meniu, Administratori_id_admin) VALUES(1, 'Meniu an 2019', 1);


------------------------------------------ MENIUL I ------------------------------------------

-- Inserare in tabela categorii

INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(1, 'Preparate lichide', 1);
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(2, 'Preparate din peste', 1);
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(3, 'Preparate din carne', 1);
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(4, 'Pizza', 1);
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(5, 'Salate', 1);

INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(6, 'Vinuri', 1);
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(7, 'Bere', 1);
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(8, 'Bauturi non-alcoolice', 1);
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(9, 'Bauturi spirtoase', 1);

-- Inserare in tabela tipuri produs

INSERT INTO tipuri_aliment(nume_tip) VALUES('post');
INSERT INTO tipuri_aliment(nume_tip) VALUES('carne');
INSERT INTO tipuri_aliment(nume_tip) VALUES('peste');
INSERT INTO tipuri_aliment(nume_tip) VALUES('lactat');
INSERT INTO tipuri_aliment(nume_tip) VALUES('salata');
INSERT INTO tipuri_aliment(nume_tip) VALUES('lichid');
INSERT INTO tipuri_aliment(nume_tip) VALUES('fructe');
INSERT INTO tipuri_aliment(nume_tip) VALUES('legume');
INSERT INTO tipuri_aliment(nume_tip) VALUES('alcoolic');
INSERT INTO tipuri_aliment(nume_tip) VALUES('non-alcoolic');

-- Inserare in tabela produse

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(1, 'Supa cu galusti', 'preparat', 20, 'lichid');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(2, 'Supă cu tăiței', 'preparat', 25, 'lichid');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(3, 'Ciorbă de porc', 'preparat', 20, 'lichid');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(4, 'Păstrăv la gratar', 'preparat', 35, 'peste');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(5, 'Somn la cuptor', 'preparat', 25, 'peste');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(6, 'Hering marinat cu mărar', 'preparat', 13, 'peste');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(7, 'Cotlet de porc la gratar', 'preparat', 22, 'carne');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(8, 'Friptura de vita', 'preparat', 22, 'carne');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(9, 'Friptura de pui', 'preparat', 18, 'carne');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(10, 'Specialtatea casei', 'preparat', 18, 'carne');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(11, 'Pizza cu piept de pui', 'preparat', 18, 'carne');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(12, 'Pizza de post', 'preparat', 15, 'post');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(13, 'Salata de rosii si castraveti', 'preparat', 20, 'salata');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(14, 'Salata de spanc cu pui', 'preparat', 25, 'salata');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(15, 'Vin rosu', 'bautura', 12, 'alcoolic');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(16, 'Vin alb', 'bautura', 10, 'alcoolic');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(17, 'Timisoreana 330 ml', 'bautura', 5, 'alcoolic');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(18, 'Ursus 330 ml', 'bautura', 6, 'alcoolic');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(19, 'Suc portocale 330 ml', 'bautura', 5, 'non-alcoolic');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(20, 'Limonada 330 ml', 'bautura', 5, 'non-alcoolic');

-- Inserare in tabela categorii_produse

INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 1);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 2);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 3);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 4);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 5);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 6);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 7);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 8);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 9);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 10);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 11);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 12);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 13);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 14);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 15);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 16);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 17);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 18);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 19);
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES(1, 20);

-- Inserare in tabela Ingrdiente

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(1, 'somn', 50, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(2, 'pastrav', 30, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(3, 'cotet de porc', 85, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(4, 'hering', 50, 'Comert', 'peste');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(5, 'cotlet de vita', 50, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(6, 'pulpe de pui', 50, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(7, 'piept de pui', 50, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(8, 'cartofi', 50, 'Comert', 'legume');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(9, 'salam de vara', 50, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(10, 'rosii', 50, 'Comert', 'legume');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(11, 'castraveti', 50, 'Comert', 'legume');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(12, 'spanac', 50, 'Comert', 'legume');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(13, 'morcovi', 50, 'Comert', 'legume');
