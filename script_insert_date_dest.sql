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

INSERT INTO meniuri(nr_meniu, nume_meniu, Administratori_id_admin) VALUES(1, 'Meniu an 2019', (SELECT id_admin FROM administratori where nume_prenume_cont = 'Cojocaru Cosmin'));


------------------------------------------ MENIUL I ------------------------------------------

-- Inserare in tabela categorii

INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(1, 'Preparate lichide', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(2, 'Preparate din peste', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(3, 'Preparate din carne', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(4, 'Pizza', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(5, 'Salate', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));

INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(6, 'Vinuri', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(7, 'Bere', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(8, 'Bauturi non-alcoolice', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));
INSERT INTO categorii(nr_categorie, nume_categorie, Meniuri_nr_meniu) VALUES(9, 'Bauturi spirtoase', (SELECT nr_meniu FROM meniuri where nume_meniu = 'Meniu an 2019'));

-- Inserare in tabela tipuri_aliment

INSERT INTO tipuri_aliment(nume_tip) VALUES('post');
INSERT INTO tipuri_aliment(nume_tip) VALUES('carne');
INSERT INTO tipuri_aliment(nume_tip) VALUES('peste');
INSERT INTO tipuri_aliment(nume_tip) VALUES('lactat');
INSERT INTO tipuri_aliment(nume_tip) VALUES('salata');
INSERT INTO tipuri_aliment(nume_tip) VALUES('lichid');
INSERT INTO tipuri_aliment(nume_tip) VALUES('fructe');
INSERT INTO tipuri_aliment(nume_tip) VALUES('legume');
INSERT INTO tipuri_aliment(nume_tip) VALUES('dulce');
INSERT INTO tipuri_aliment(nume_tip) VALUES('cereale');
INSERT INTO tipuri_aliment(nume_tip) VALUES('fainoase');
INSERT INTO tipuri_aliment(nume_tip) VALUES('alcoolic');
INSERT INTO tipuri_aliment(nume_tip) VALUES('non-alcoolic');

-- Inserare in tabela produse

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(1, 'Supa cu legume', 'preparat', 20, 'lichid');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(2, 'Supa cu taitei', 'preparat', 25, 'lichid');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(3, 'Ciorba de vita cu legume', 'preparat', 20, 'lichid');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(4, 'Pastrav la gratar cu legume', 'preparat', 35, 'peste');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(5, 'Somn la cuptor', 'preparat', 25, 'peste');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(6, 'Somon afumat', 'preparat', 23, 'peste');

INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(7, 'Cotlet de porc la gratar', 'preparat', 22, 'carne');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(8, 'Friptura de vita', 'preparat', 22, 'carne');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(9, 'Piept de pui la gratar', 'preparat', 18, 'carne');

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
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(21, 'Fanta 330 ml', 'bautura', 4, 'non-alcoolic');
INSERT INTO Produse(nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES(22, 'Pepsi 330 ml', 'bautura', 5, 'non-alcoolic');

-- Inserare in tabela categorii_produse

INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate lichide' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate lichide' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu taitei'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate lichide' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ciorba de vita cu legume'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate din peste' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pastrav la gratar'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate din peste' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Somn la cuptor'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate din peste' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Hering marinat'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate din carne' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate din carne' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Friptura de vita cu legume'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Preparate din carne' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Piept de pui la gratar cu cartofi'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Pizza' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Specialtatea casei'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Pizza' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Pizza' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza de post'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Salate' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Salata de rosii si castraveti'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Salate' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Salata de spanc cu pui'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Vinuri' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Vin rosu'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Vinuri' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Vin alb'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Bere' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Timisoreana 330 ml'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Bere' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Bauturi non-alcoolice' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Suc portocale 330 ml'));
INSERT INTO categorii_produse(Categorii_nr_categorie, Produse_nr_produs) VALUES((SELECT nr_categorie FROM Categorii WHERE nume_categorie = 'Bauturi non-alcoolice' and nr_meniu = (SELECT nr_meniu FROM Meniuri WHERE nume_meniu = 'Meniu an 2019')), (SELECT nr_produs FROM Produse WHERE nume_produs = 'Limonada 330 ml'));

-- Inserare in tabela Ingrdiente

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(1, 'somn', 50, 'Comert', 'peste');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(2, 'pastrav', 30, 'Comert', 'peste');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(3, 'file de somon', 20, 'Comert', 'peste');

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(4, 'cotlet de porc', 50, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(5, 'bucati carne de vita', 60, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(6, 'piept de pui', 35, 'Comert', 'carne');

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(7, 'salam de porc', 20, 'Comert', 'carne');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(8, 'salam de vita', 30, 'Comert', 'carne');

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(9, 'cascaval', 30, 'Comert', 'lactat');

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(10, 'rosii', 70, 'Comert', 'legume');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(11, 'castraveti', 120, 'Comert', 'legume');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(12, 'amestec de legume', 75, 'Comert', 'legume');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(13, 'cartofi', 120, 'Comert', 'legume');

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(14, 'orez', 30, 'Comert', 'cereale');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(15, 'pachet taitei', 30, 'Comert', 'fainoase');

INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(16, 'lamaie', 40, 'Comert', 'fructe');
INSERT INTO Ingrediente(id_ingredient, nume_ingredient, stoc_ingredient, producator, tipuri_aliment_nume_tip) VALUES(17, 'portocala', 55, 'Comert', 'fructe');

-- Inserare in tabela Reteta

INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu legume'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'amestec de legume'), 1);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Supa cu taitei'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'taitei'), 0.5);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Ciorba de vita cu legume'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'bucati carne de vita'), 1);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Ciorba de vita cu legume'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'amestec de legume'), 1);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Pastrav la gratar cu legume'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'pastrav'), 1);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Pastrav la gratar cu legume'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'lamaie'), 0.5);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Somon afumat'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'file de somon'), 2);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Cotlet de porc la gratar'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'cotlet de porc'), 2);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Friptura de vita cu legume'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'bucati carne de vita'), 2);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Friptura de vita cu legume'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'amestec de legume'), 1);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Piept de pui la gratar cu cartofi'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'piept de pui'), 0.5);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Piept de pui la gratar cu cartofi'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'carofi'), 4);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Specialtatea casei'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'salam de porc'), 0.5);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Specialtatea casei'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'cascaval'), 1.5);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza cu piept de pui'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'piept de pui'), 1);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Salata de rosii si castraveti'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'rosii'), 3);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Salata de rosii si castraveti'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'castraveti'), 3);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Pizza de post'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'amestec de legume'), 1);
INSERT INTO Reteta (nr_produs, nume_produs, tip_produs, pret, tipuri_aliment_nume_tip) VALUES((SELECT nr_produs FROM Produse WHERE nume_produs = 'Salata de spanc cu pui'), (SELECT id_ingredient FROM Ingrediente WHERE nume_ingredient = 'piept de pui'), 0.5);

-- Inserare in tabela stocuri_produs

INSERT INTO stocuri_produs(stoc_produs, Produse_nr_produs) VALUES(30, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Timisoreana 330 ml'));
INSERT INTO stocuri_produs(stoc_produs, Produse_nr_produs) VALUES(25, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Ursus 330 ml'));
INSERT INTO stocuri_produs(stoc_produs, Produse_nr_produs) VALUES(25, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Fanta 330 ml'));
INSERT INTO stocuri_produs(stoc_produs, Produse_nr_produs) VALUES(20, (SELECT nr_produs FROM Produse WHERE nume_produs = 'Pepsi 330 ml'));