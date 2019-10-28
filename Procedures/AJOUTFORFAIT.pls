CREATE OR REPLACE PROCEDURE AJOUTFORFAIT(code IN CHAR, nom IN VARCHAR2, desc_param IN VARCHAR2, prix IN NUMBER) AS 
    
    bon_nom FORFAIT.NOM%TYPE;
    
BEGIN
    
    IF nom IS NULL THEN
        bon_nom := 'Forfait';
    ELSE
        bon_nom := nom;
    END IF;
    INSERT INTO FORFAIT VALUES(code, bon_nom, desc_param);
    INSERT INTO PERIODE(DATEDEBUT, DATEFIN, PRIX, CODEFORFAIT) VALUES(SYSDATE(), ADD_MONTHS(SYSDATE(), 12), prix, code);
    
END AJOUTFORFAIT;