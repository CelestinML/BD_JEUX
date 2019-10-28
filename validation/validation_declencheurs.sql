REM VALIDATION DES DECLENCHEURS


REM ------ Validation des sequences

SELECT JEU_SEQ.NEXTVAL FROM DUAL;
SELECT CONTENU_SEQ.NEXTVAL FROM DUAL;
SELECT SUCCES_SEQ.NEXTVAL FROM DUAL;
SELECT PERIODE_SEQ.NEXTVAL FROM DUAL;
SELECT JOUEUR_SEQ.NEXTVAL FROM DUAL;
SELECT SUIVI_AMITIE_SEQ.NEXTVAL FROM DUAL;
SELECT SUIVI_RESEAU_SEQ.NEXTVAL FROM DUAL;





REM ------ Validation de declencheur "nouveauSuccesEnCours"

SELECT * FROM SUCCES_CALCULE;

INSERT INTO SUCCES_REALISE (IdContenu, NoJoueur, IdSucces)
VALUES (1, 1, 8);
INSERT INTO SUCCES_EN_COURS (IdContenu, NoJoueur, IdSucces, Compteur)
VALUES (1, 1, 8, 0);





REM ------ Validation de declencheur "genre"

SELECT IdJeu, CodeGenre FROM JEU;

SELECT * FROM SOUS_GENRE_JEU
WHERE IdJeu = 1;

-- TEST #1 : UPDATE DANS CHANGER LE GENRE
UPDATE JEU
SET CodeGenre = 'ACT'
WHERE IdJeu = 1;

SELECT * FROM SOUS_GENRE_JEU
WHERE IdJeu = 1;

-- TEST #2 : UPDATE AVEC MODIFICATION DE GENRE

UPDATE JEU
SET CodeGenre = 'HOR'
WHERE IdJeu = 1;

SELECT * FROM SOUS_GENRE_JEU
WHERE IdJeu = 1;






REM ------ Validation de declencheur "suiviReseau"

INSERT INTO RESEAU (Code, Nom, Description)
VALUES ('TEST3', 'TEST DE SUIVI', 'SUIVI DE CREATION DU RESEAU');

UPDATE RESEAU SET ACTIF = '1' WHERE Code = 'TEST3';
UPDATE RESEAU SET ACTIF = '0' WHERE Code = 'TEST3';

SELECT * FROM SUIVI_RESEAU
WHERE CodeReseau = 'TEST3';

DELETE FROM SUIVI_RESEAU
WHERE CodeReseau = 'TEST3';







REM ------ Validation de declencheur "suiviAbonnementReseau"

INSERT INTO RESEAU (Code, Nom, Description)
	VALUES ('TEST02', 'TEST', 'TEST');

INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
VALUES ('TEST02', 1);

DELETE FROM ABONNEMENT_RESEAU
WHERE CodeReseau = 'TEST02';

SELECT * FROM SUIVI_RESEAU
WHERE CodeReseau = 'TEST02';

DELETE FROM SUIVI_RESEAU
WHERE CodeReseau = 'TEST02';






REM ------ Validation de declencheur "suiviAmi"

INSERT INTO AMI(noJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
VALUES (1, 4, To_DATE(sysdate), 'NOU');

UPDATE AMI
SET CodeStatut = 'REL'
WHERE nojoueurinvitant = 1 AND NoJoueurInvite = 4;

UPDATE AMI
SET CodeStatut = 'FIN'
WHERE nojoueurinvitant = 1 AND NoJoueurInvite = 4;

SELECT * FROM SUIVI_AMITIE
WHERE nojoueurinvitant = 1 AND NoJoueurInvite = 4;

DELETE FROM SUIVI_AMITIE
WHERE nojoueurinvitant = 1 AND NoJoueurInvite = 4;
