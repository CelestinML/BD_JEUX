CREATE OR REPLACE FUNCTION joueurLePlusPopulaire RETURN VARCHAR2 AS

	joueur_plus_populaire JOUEUR.SURNOM%TYPE;

    
BEGIN
	
    select surnom 
    into joueur_plus_populaire
    from(
        select surnom
        from(
            select joueur.surnom, count(*)nb 
            from joueur natural join ami where actif = 1 and prenom is not null and  nom is not null and (joueur.nojoueur = ami.nojoueurinvitant or joueur.nojoueur = ami.nojoueurinvite) 
            group by joueur.surnom
            )
        order by nb desc)
    where rownum = 1;

	RETURN joueur_plus_populaire;
    
END joueurLePlusPopulaire;