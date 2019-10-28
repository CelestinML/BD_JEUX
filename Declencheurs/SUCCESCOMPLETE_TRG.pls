CREATE OR REPLACE TRIGGER SUCCESCOMPLETE_TRG 
AFTER UPDATE OF COMPTEUR ON SUCCES_EN_COURS 
FOR EACH ROW
WHEN (NEW.COMPTEUR >= (SELECT MAXIMUMREQUIS FROM SUCCES_CALCULE WHERE IDSUCCES = NEW.IDSUCCES))
BEGIN
    INSERT INTO SUCCES_REALISE
    VALUES(NEW.IDCONTENU, NEW.NOJOUEUR, NEW.IDSUCCES);
    DELETE FROM SUCCES_EN_COURS
    WHERE IDCONTENU = NEW.IDCONTENU
    AND NOJOUEUR = NEW.NOJOUEUR
    AND IDSUCCES = NEW.IDSUCCES;
END;