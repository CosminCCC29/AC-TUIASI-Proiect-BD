-- Stergere tabele

-- nume_prenume     REGEXP_LIKE(nume_prenume_cont, '^([A-Z][a-z]+)\ ([A-Z][a-z]+)(\-[A-Z][a-z]+)?$) --
-- parola           REGEXP_LIKE(parola_cont, '^\S+$')
-- nume_tip         REGEXP_LIKE(nume_tip, '^[a-z]+\-?[a-z]+$')
-- nume_categorie   REGEXP_LIKE(nume_categorie, '^[A-Z][a-z]+(\ ?[a-z]+)*$') --
-- nume_ingredient  REGEXP_LIKE(nume_ingredient, '^[a-z]+(\ ?[a-z]+)*$') --
-- nume_meniu       REGEXP_LIKE(nume_meniu, '^[A-Z][a-z]+([\ \-]?[A-Z]?[a-z0-9]+)*$') --
-- nume_produs      REGEXP_LIKE(nume_produs, '^[A-Z][a-z]+(\ ?[A-Za-z0-9]+(\.[0-9]+)?)*$') --

BEGIN

  FOR i IN (SELECT ut.table_name
              FROM USER_TABLES ut) LOOP
    EXECUTE IMMEDIATE 'drop table '|| i.table_name ||' CASCADE CONSTRAINTS ';
  END LOOP;

END;