CREATE OR REPLACE PROCEDURE SUPPRESSIONJEU(nom_du_jeu IN JEU.NOM%TYPE, etat_sortie OUT INT) AS 

    id_jeu JEU.IDJEU%TYPE;
    nb_contenus_jeu INT;
    nb_joueurs_jeu INT;

BEGIN
    --On identifie l'ID du jeu, nécessaire pour accéder aux autres tables
    SELECT IDJEU INTO id_jeu
    FROM JEU
    WHERE NOM = nom_du_jeu;
    
    IF SQL%FOUND THEN
    
        SELECT COUNT(*)
        INTO nb_contenus_jeu
        FROM CONTENU
        WHERE IDJEU = id_jeu;
        
        IF nb_contenus_jeu > 0 THEN
        
            SELECT COUNT(*)
            INTO nb_joueurs_jeu
            FROM CONTENU_POSSEDE
            WHERE IDCONTENU IN (SELECT IDCONTENU FROM CONTENU WHERE IDJEU = id_jeu); 
            
            IF NOT(nb_joueurs_jeu = 0) THEN
            
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
                
            ELSE
                etat_sortie := 3;
            END IF;
            
        ELSE
            etat_sortie := 1;
        END IF;
        
    ELSE
        etat_sortie := 2;
    END IF;
    
END SUPPRESSIONJEU;