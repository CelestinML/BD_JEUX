CREATE OR REPLACE PROCEDURE suppressionJeu(etat_sortie OUT INT, nom_du_jeu IN JEU.NOM%TYPE) AS 

    nb_jeux INT;
    id_jeu JEU.IDJEU%TYPE;

BEGIN
    
    SELECT COUNT(*)
    INTO nb_jeux
    FROM JEU
    WHERE NOM = nom_du_jeu;
    
    IF nb_jeux = 0 THEN
        etat_sortie := 1;
    ELSIF nb_jeux > 1 THEN
        etat_sortie := 2;
    ELSE
    
        SELECT IDJEU
        INTO id_jeu
        FROM JEU
        WHERE NOM = nom_du_jeu;
        
        COMMIT;
        SET TRANSACTION NAME 'supressions';
            DELETE
            FROM SUCCES_EN_COURS
            WHERE IDSUCCES IN (SELECT IDSUCCES FROM SUCCES WHERE IDCONTENU IN (SELECT IDCONTENU FROM CONTENU WHERE IDJEU = id_jeu));
            DELETE
            FROM SUCCES_CALCULE
            WHERE IDSUCCES IN (SELECT IDSUCCES FROM SUCCES WHERE IDCONTENU IN (SELECT IDCONTENU FROM CONTENU WHERE IDJEU = id_jeu));
            DELETE
            FROM SUCCES_REALISE
            WHERE IDSUCCES IN (SELECT IDSUCCES FROM SUCCES WHERE IDCONTENU IN (SELECT IDCONTENU FROM CONTENU WHERE IDJEU = id_jeu));
            DELETE
            FROM SUCCES
            WHERE IDCONTENU IN (SELECT IDCONTENU FROM CONTENU WHERE IDJEU = id_jeu);
            DELETE
            FROM CONTENU
            WHERE IDJEU = id_jeu;
            DELETE
            FROM JEU
            WHERE NOM = nom_du_jeu;
        COMMIT;
        
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        etat_sortie := 3;
        ROLLBACK;
END suppressionJeu;