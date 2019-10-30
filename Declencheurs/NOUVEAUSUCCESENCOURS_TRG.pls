CREATE OR REPLACE TRIGGER NOUVEAUSUCCESENCOURS_TRG 
BEFORE INSERT ON SUCCES_EN_COURS 
FOR EACH ROW
BEGIN
    --On verifie si le succes en court d'insertion a ete realise par ce joueur dans ce jeu
    IF (:NEW.IDSUCCES IN (SELECT IDSUCCES FROM SUCCES_REALISE WHERE NOJOUEUR = :NEW.NOJOUEUR AND IDCONTENU = :NEW.IDCONTENU)) THEN
        raise_application_error(-1000, 'Succes deja realise.');
    END IF;
    --Si le succès n'est pas dans les succes deja realises par ce joueur dans ce jeu, rien ne se passe et l'insertion se termine correctement
END;