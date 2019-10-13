CREATE OR REPLACE PROCEDURE SUPPRESSIONJEU(nom_du_jeu IN VARCHAR2, etat_sortie OUT INT) AS 

    id_jeu NUMBER(38,0);

BEGIN
    --On identifie l'ID du jeu, nécessaire pour accéder aux autres tables
    SELECT IDJEU INTO id_jeu
    FROM JEU
    WHERE NOM = nom_du_jeu;
    IF SQL%FOUND THEN
  
        DECLARE
            CURSOR contenus_jeu IS
            SELECT IDCONTENU FROM CONTENU
            WHERE IDJEU = id_jeu;
        
            nb_contenus_jeu INT;
        BEGIN
            SELECT COUNT(contenus_jeu)
            INTO nb_contenus_jeu
            FROM DUAL;
        
            IF nb_contenus_jeu > 0 THEN
        
                DECLARE
                    CURSOR joueurs_possedant_contenu IS
                    SELECT * FROM CONTENU_POSSEDE
                    WHERE IDCONTENU IN contenus_jeu;
        
                    nb_joueurs_jeu INT;
                BEGIN
                    SELECT COUNT(joueurs_possedant_contenu)
                    INTO nb_joueurs_jeu
                    FROM DUAL;
                    IF nb_joueurs_jeu > 0 THEN
                        DECLARE
                            CURSOR succes_jeu IS
                            SELECT IDSUCCES FROM SUCCES
                            WHERE IDCONTENU IN contenus_jeu;
                        BEGIN
                            SET AUTOCOMMIT OFF;
                            SET TRANSACTION NAME 'supressions'
                                DELETE
                                FROM SUCCES_EN_COURS
                                WHERE IDSUCCES IN succes_jeu;
                                DELETE
                                FROM SUCCES_CALCULE
                                WHERE IDSUCCES IN succes_jeu;
                                DELETE
                                FROM SUCCES_REALISE
                                WHERE IDSUCCES IN succes_jeu;
                                DELETE
                                FROM SUCCES
                                WHERE IDCONTENU IN contenus_jeu;
                                DELETE
                                FROM CONTENU
                                WHERE IDJEU = id_jeu;
                                DELETE
                                FROM JEU
                                WHERE NOM = nom_du_jeu;
                            COMMIT;
                        END;
                    ELSE
                        etat_sortie := 3;
                    END IF;
                END;
            ELSE
                etat_sortie := 1;
            END IF;
        END;
        
    ELSE
        etat_sortie := 2;
    END IF;
    
END SUPPRESSIONJEU;