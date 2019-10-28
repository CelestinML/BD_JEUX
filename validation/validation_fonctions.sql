REM VALIDATION DES FONCTIONS

SET SERVEROUTPUT ON
SET ECHO ON



REM ------ joueurLePlusPopulaire

SELECT joueurLePlusPopulaire FROM DUAL;




REM ------ jeuLePlusPopulaire

DECLARE
	CodeESRB	CHAR(1);
	Nom			VARCHAR2(100);
BEGIN
 	CodeESRB := 'T';
	SELECT jeuLePlusPopulaire(CodeESRB) INTO Nom FROM DUAL;
	dbms_output.put_line('Nom : ' || Nom);
END; 
/




REM ------ succesPlusRealise

DECLARE
    titreSucces VARCHAR2(50);
BEGIN
	SELECT succesPlusRealise() INTO titreSucces FROM DUAL;
	dbms_output.put_line('titreSucces : ' || titreSucces);
END; 
/




REM ------ validerGenre

DECLARE
    genreRecherche CHAR(3);
    genreResultat CHAR(3);
BEGIN
    -- TEST #1 : Le genre recherche est un genre
    genreRecherche := 'HOR';
	SELECT validerGenre(genreRecherche) INTO genreResultat FROM DUAL;
	dbms_output.put_line('genreRecherche : ' || genreRecherche);
	dbms_output.put_line('genreResultat : ' || genreResultat);

    -- TEST #2 : Le genre recherche est un sous genre
    genreRecherche := 'HCK';
	SELECT validerGenre(genreRecherche) INTO genreResultat FROM DUAL;
	dbms_output.put_line('genreRecherche : ' || genreRecherche);
	dbms_output.put_line('genreResultat : ' || genreResultat);
END; 
/