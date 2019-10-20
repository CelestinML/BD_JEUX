CREATE OR REPLACE PROCEDURE SUPPRESSIONJEU(nom_du_jeu IN JEU.NOM%TYPE, etat_sortie OUT INT) AS 

    id_jeu JEU.IDJEU%TYPE;

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
            
            OPEN contenus_jeu;
            
            nb_contenus_jeu := contenus_jeu%ROWCOUNT;
        
            IF nb_contenus_jeu > 0 THEN
        
                DECLARE
                    CURSOR joueurs_possedant_contenu IS
                    SELECT * FROM CONTENU_POSSEDE
                    WHERE IDCONTENU IN contenus_jeu;
        
                    nb_joueurs_jeu INT;
                BEGIN
                
                    OPEN joueurs_possedant_contenu;
                    
                    nb_joueurs_jeu := joueurs_possedant_contenu%ROWCOUNT;
                    
                    IF nb_joueurs_jeu > 0 THEN
                        DECLARE
                            CURSOR succes_jeu IS
                            SELECT IDSUCCES FROM SUCCES
                            WHERE IDCONTENU IN contenus_jeu;
                        BEGIN
                        
                            OPEN succes_jeu;
                        
                            SET TRANSACTION NAME 'supressions';
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
                            
                            CLOSE succes_jeu;
                            
                        END;
                    ELSE
                        etat_sortie := 3;
                    END IF;
                    
                    CLOSE joueurs_possedant_contenu;
                    
                END;
            ELSE
                etat_sortie := 1;
            END IF;
            
            CLOSE contenus_jeu;
            
        END;
        
    ELSE
        etat_sortie := 2;
    END IF;
    
END SUPPRESSIONJEU;