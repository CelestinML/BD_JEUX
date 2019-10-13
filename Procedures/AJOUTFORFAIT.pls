CREATE OR REPLACE PROCEDURE AJOUTFORFAIT(code IN CHAR, nom IN VARCHAR2, desc_param IN VARCHAR2, prix IN NUMBER) AS 
    nom_param VARCHAR2(100);
BEGIN

    IF nom = NULL THEN
        nom_param := 'Forfait';
    ELSE
        nom_param := nom;
    END IF;
    
    INSERT INTO FORFAIT VALUES(code, nom_param, desc_param);
    INSERT INTO PERIODE(DATEDEBUT, DATEFIN, PRIX, CODEFORFAIT) VALUES(GETDATE(), GETDATE()+365, prix, code);
    
END AJOUTFORFAIT;