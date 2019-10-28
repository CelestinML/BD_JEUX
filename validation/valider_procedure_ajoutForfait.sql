REM VALIDATION DE LA PROCEDURE ajoutForfait

SET SERVEROUTPUT ON

-- Initialisation
DELETE FROM PERIODE
WHERE CodeForfait like 'TEST%';

DELETE FROM FORFAIT
WHERE code like 'TEST%';

DECLARE
    code CHAR(5);
    nom VARCHAR2(100);
    description VARCHAR2(1000);
    prix NUMBER(6,2);
BEGIN
    -- TEST #1 : Insertion reguliere
	code := 'TEST1';
    nom := 'SUPER FORFAIT';
    description := 'Description du SUPER FORFAIT';
    prix := 100;
    ajoutForfait(code, nom, description, prix);

    -- TEST #2 : Test du nom NULL
	code := 'TEST2';
    nom := NULL;
    description := NULL;
    prix := 10.99;
    ajoutForfait(code, nom, description, prix);

END; 
/
-- Verification
SELECT * FROM FORFAIT
WHERE Code like 'TEST%';

SELECT * FROM PERIODE
WHERE CodeForfait like 'TEST%';

-- SUPPRESSION DES TEST
DELETE FROM PERIODE
WHERE CodeForfait like 'TEST%';
DELETE FROM FORFAIT
WHERE code like 'TEST%';