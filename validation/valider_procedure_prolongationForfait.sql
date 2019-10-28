REM VALIDATION DE LA PROCEDURE prolongationForfait

SET SERVEROUTPUT ON

-- Initialisation
SELECT *
FROM periode_forfait_joueur pfj, periode p
WHERE pfj.idPeriode = p.idPeriode
AND pfj.dateachat >= add_months(sysdate,-12);

DECLARE
    code CHAR(5);
    nombreJoueursTouches INTEGER;
BEGIN
    -- TEST #1
	code := 'GOLD1';
    prolongationForfait(code, nombreJoueursTouches);
    dbms_output.put_line('nombreJoueursTouches : ' || nombreJoueursTouches);

    -- TEST #2
	code := 'TEST1';
    prolongationForfait(code, nombreJoueursTouches);
    dbms_output.put_line('nombreJoueursTouches : ' || nombreJoueursTouches);

END; 
/

-- Verification
REM La liste des forfaits de joueurs valides
SELECT * 
FROM periode_forfait_joueur pfj, periode p
WHERE pfj.idPeriode = p.idPeriode
AND pfj.dateachat >= add_months(sysdate,-12);
