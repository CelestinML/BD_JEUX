CREATE OR REPLACE FUNCTION succesPlusRealise RETURN VARCHAR2 AS 

    id_succes_plus_realise SUCCES.IDSUCCES%TYPE;
    succes_plus_realise SUCCES.TITRE%TYPE;
    
BEGIN
    
    SELECT IDSUCCES
    INTO id_succes_plus_realise
    FROM (SELECT IDSUCCES, COUNT(*) as nb FROM SUCCES_REALISE GROUP BY IDSUCCES ORDER BY nb)
    WHERE rownum = 1;
    
    SELECT TITRE
    INTO succes_plus_realise
    FROM SUCCES
    WHERE IDSUCCES = id_succes_plus_realise;
    
    RETURN succes_plus_realise;
    
END succesPlusRealise;