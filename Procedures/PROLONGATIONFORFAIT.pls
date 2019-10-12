CREATE OR REPLACE PROCEDURE PROLONGATIONFORFAIT(CODE IN CHAR, NBTOUCHES OUT INT) AS 
BEGIN
    NBTOUCHES := 0;
    update PERIODE 
    set DATEFIN = DATEFIN + 62 --on additionne directement le nombre de jours souhaités en plus (ici 2 mois = 62 jours)
    where CODEFORFAIT = CODE;
    IF SQL%FOUND THEN
        NBTOUCHES := SQL%ROWCOUNT;
    END IF;
END PROLONGATIONFORFAIT;