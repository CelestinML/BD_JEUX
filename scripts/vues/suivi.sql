CREATE VIEW suiviReseau AS
   SELECT MOMENT, ACTION, CODERESEAU, NOM FROM RESEAU  natural JOIN SUIVI_RESEAU 
   WHERE NOJOUEUR IS NULL
   ORDER BY MOMENT ASC;
   
CREATE VIEW suiviReseauJoueur AS
   SELECT MOMENT, ACTION, CODERESEAU, SURNOM FROM JOUEUR  NATURAL JOIN SUIVI_RESEAU 
   WHERE NOJOUEUR IS NOT NULL
   ORDER BY MOMENT ASC;
   
CREATE VIEW suiviAmitieInvitation AS
   SELECT S.MOMENT, J.SURNOM, J.NOJOUEUR, S.NOJOUEURINVITE, S.DATESUIVI, S.CODESTATUT FROM JOUEUR J INNER JOIN SUIVI_AMITIE S
   ON J.NOJOUEUR = S.NOJOUEURINVITANT;