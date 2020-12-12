-- Stergere tabele

-- nume_prenume REGEXP_LIKE(nume_atribut, '^[A-Za-z]+\ (\-?[A-Za-z]+)+$')
-- parola REGEXP_LIKE(nume_atribut, '^\S+$')
-- nume_tip REGEXP_LIKE(nume_atribut, '^[A-Za-z]+\-?[A-Za-z]+$')
-- nume_categorie REGEXP_LIKE(nume_atribut, '^[A-Za-z]+\ ?(\ ?[A-Za-z]+)+$')
-- nume_produs REGEXP_LIKE(nume_atribut, '^[A-Za-z]+(\ ?[A-Za-z[0-9]+(\.[0-9]+)?)+$')

BEGIN

  FOR i IN (SELECT ut.table_name
              FROM USER_TABLES ut) LOOP
    EXECUTE IMMEDIATE 'drop table '|| i.table_name ||' CASCADE CONSTRAINTS ';
  END LOOP;

END;