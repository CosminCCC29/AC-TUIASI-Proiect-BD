-- trg_data_crearii_meniuri
-- trg_data_crearii_categorii
-- trg_data_crearii_produse
-- trg_data_comanda_comenzi

BEGIN
	IF ( :new.data_crearii < SYSDATE )
	THEN
		RAISE_APPLICATION_ERROR( -20001,
			'Data invalida: ' || TO_CHAR( :new.data_crearii, 'DD.MM.YYYY HH24:MI:SS' ) || 'trebuie sa fie egala sau mai mare decat data curenta.' );
	END IF;
END;

BEGIN
	IF ( :new.data_comanda < SYSDATE )
	THEN
		RAISE_APPLICATION_ERROR( -20001,
			'Data invalida: ' || TO_CHAR( :new.data_comanda, 'DD.MM.YYYY HH24:MI:SS' ) || 'trebuie sa fie egala sau mai mare decat data curenta.' );
	END IF;
END;