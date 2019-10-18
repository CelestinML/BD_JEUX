CREATE OR REPLACE FUNCTION JOUEURLEPLUSPOPULAIRE RETURN VARCHAR2 AS

	CURSOR joueurs_actifs IS
	SELECT NOJOUEUR
	FROM JOUEUR
	WHERE ACTIF = '1';
	
	no_joueur_actuel NUMBER(38,0);
	joueur_plus_populaire VARCHAR2(50);
	nb_max_amis INT;
	nb_actuel_amis INT;
    
BEGIN
	
	nb_max_amis := 0;	
	FOR no_joueur_actuel IN joueurs_actifs LOOP
		SELECT COUNT(*)
		INTO nb_actuel_amis
		FROM AMI
		WHERE ((NOJOUEURINVITANT = no_joueur_actuel) AND (NOJOUEURINVITE IN joueurs_actifs)) OR ((NOJOUEURINVITE = no_joueur_actuel) AND (NOJOUEURINVITANT IN joueurs_actifs));
		IF nb_actuel_amis > nb_max_amis THEN
			nb_max_amis := nb_actuel_amis;
			SELECT SURNOM
			INTO joueur_plus_populaire
			FROM JOUEUR
			WHERE NOJOUEUR = no_joueur_actuel;
		END IF;
	END LOOP;

	RETURN no_joueur_actuel;
    
END JOUEURLEPLUSPOPULAIRE;