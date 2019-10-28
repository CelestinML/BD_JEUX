CREATE OR REPLACE PROCEDURE PROLONGATIONFORFAIT(CODE IN CHAR, NBTOUCHES OUT INT) AS 
BEGIN
    NBTOUCHES := 0;
    update PERIODE_FORFAIT_JOUEUR 
    set DATEACHAT = ADD_MONTHS(DATEACHAT,2)-- Ajout de deux mois � la date de fin de forfait
    where IDPERIODE IN (SELECT IDPERIODE FROM PERIODE WHERE CODEFORFAIT = CODE) 
    and  dateachat >= add_months(sysdate,-12);
    IF SQL%FOUND THEN
        NBTOUCHES := SQL%ROWCOUNT;
    END IF;
END PROLONGATIONFORFAIT;