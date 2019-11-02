CREATE OR REPLACE FUNCTION joueurLePlusPopulaire RETURN VARCHAR2 AS

	CURSOR joueurs_actifs IS
	SELECT NOJOUEUR
	FROM JOUEUR
	WHERE ACTIF = '1';
	
	no_joueur_actuel JOUEUR.NOJOUEUR%TYPE;
	joueur_plus_populaire JOUEUR.SURNOM%TYPE;
	nb_max_amis INT;
	nb_actuel_amis INT;
    
BEGIN
	
	nb_max_amis := 0;
    OPEN joueurs_actifs;
	FOR no_joueur_actuel IN joueurs_actifs LOOP
		SELECT COUNT(*)
		INTO nb_actuel_amis
		FROM AMI
		WHERE (NOJOUEURINVITANT = no_joueur_actuel)
        OR (NOJOUEURINVITE = no_joueur_actuel);
		IF nb_actuel_amis > nb_max_amis THEN
			nb_max_amis := nb_actuel_amis;
			SELECT SURNOM
			INTO joueur_plus_populaire
			FROM JOUEUR
			WHERE (NOJOUEUR = no_joueur_actuel);
		END IF;
	END LOOP;
    CLOSE joueurs_actifs;

	RETURN joueur_plus_populaire;
    
END joueurLePlusPopulaire;