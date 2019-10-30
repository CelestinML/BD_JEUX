CREATE OR REPLACE FUNCTION SUCCESPLUSREALISE(nb_realisations_max OUT INT) RETURN VARCHAR2 AS 

    CURSOR id_succes IS
    SELECT IDSUCCES FROM SUCCES;
    
    id_succes_actuel SUCCES.IDSUCCES%TYPE;
    
    succes_plus_realise SUCCES.TITRE%TYPE;
    nb_realisations INT;
    
BEGIN

    OPEN id_succes;

    nb_realisations_max := 0;
    
    FOR id_succes_actuel IN id_succes LOOP
        SELECT COUNT(*) INTO nb_realisations
        FROM SUCCES_REALISE
        WHERE IDSUCCES = id_succes_actuel;
        IF nb_realisations > nb_realisations_max THEN
            nb_realisations_max := nb_realisations;
            SELECT TITRE
            INTO succes_plus_realise
            FROM SUCCES
            WHERE IDSUCCES = id_succes_actuel;
        END IF;
    END LOOP;
    
    CLOSE id_succes;
    
    RETURN succes_plus_realise;
    
END SUCCESPLUSREALISE;