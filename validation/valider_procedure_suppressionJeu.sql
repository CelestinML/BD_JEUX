REM VALIDATION DE LA PROCEDURE suppressionJeu

SET SERVEROUTPUT ON

-- Initialisation
SELECT * FROM JEU;
SELECT * FROM CONTENU;
SELECT * FROM SUCCES;
SELECT * FROM SUCCES_CALCULE;

DECLARE
    resultat INTEGER;
    nomJeu VARCHAR2(100);
BEGIN
    -- TEST #1 : Un jeu que personne ne possede
	nomJeu := 'CANDY CRUSH';
    suppressionJeu(resultat, nomJeu);
    dbms_output.put_line('resultat : ' || resultat);

    -- TEST #2 : un jeu possede (ROLLBACK)
	nomJeu := 'TOMB RAIDER';
    suppressionJeu(resultat, nomJeu);
    dbms_output.put_line('resultat : ' || resultat);

END; 
/

SELECT * FROM JEU;
SELECT * FROM CONTENU;
SELECT * FROM SUCCES;
SELECT * FROM SUCCES_CALCULE;
