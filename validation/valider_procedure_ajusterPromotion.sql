REM VALIDATION DE LA PROCEDURE ajusterPromotion

SET SERVEROUTPUT ON

SELECT * FROM PERIODE;

DECLARE
    codeForfait	CHAR(5);
	prix		NUMBER (6,2);
BEGIN
    -- TEST
    ajusterPromotion(codeForfait, prix);
    dbms_output.put_line('codeForfait : ' || codeForfait);
    dbms_output.put_line('Prix : ' || prix);
END; 
/

SELECT * FROM PERIODE;