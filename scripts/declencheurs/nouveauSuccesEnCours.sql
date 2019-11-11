CREATE OR REPLACE TRIGGER NOUVEAUSUCCESENCOURS_TRG 
    BEFORE INSERT 
    ON SUCCES_EN_COURS 
    FOR EACH ROW
DECLARE
    CURSOR succes_realise_par_joueur IS
	SELECT * FROM SUCCES_REALISE;
BEGIN

        FOR succes IN succes_realise_par_joueur LOOP
            IF(succes.idcontenu = :NEW.idcontenu AND succes.nojoueur = :NEW.nojoueur AND succes.IDSUCCES = :NEW.idsucces) THEN
            raise_application_error(-20000, 'Succes deja realise.');
            END IF;   
        END LOOP;
END;