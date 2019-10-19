CREATE OR REPLACE PROCEDURE AJUSTERPROMOTION(code OUT char, nouveau_prix OUT INT) AS

    CURSOR reseaux_actifs IS
    SELECT CODE FROM RESEAU
    WHERE ACTIF = '1';
    
    code_reseau_actuel char(6);
    nb_joueurs INT;
    nb_max INT;
    code_reseau_plus_populaire char(6);
    
    CURSOR forfaits IS
    SELECT CODE FROM FORFAIT;
    
    code_forfait_actuel char(5);
    code_forfait_plus_populaire char(5);
    
    prix_max BOOLEAN;
    prix_forfait_plus_populaire NUMBER(6,2);
    prix_actuel NUMBER(6,2);
    code_forfait_max char(5);
    
BEGIN

    --Tout d'abord, on recherche le reseau le plus actif
    nb_max := 0;
    OPEN reseaux_actifs;
    FOR code_reseau_actuel IN reseaux_actifs LOOP
        --On compte le nombre de joueurs abonnes a ce reseau
        SELECT COUNT(*) INTO nb_joueurs
        FROM ABONNEMENT_RESEAU
        WHERE CODERESEAU = code_reseau_actuel;
        IF nb_joueurs > nb_max THEN
            nb_max := nb_joueurs;
            code_reseau_plus_populaire := code_reseau_actuel;
        END IF;
    END LOOP;
    CLOSE reseaux_actifs;
    
    --On va maintenant chercher quel forfait est le plus achete par les joueurs
    --abonnes a ce reseau
    nb_max := 0;
    OPEN forfaits;
    FOR code_forfait_actuel IN forfaits LOOP
        DECLARE
            --Pour trouver les joueurs possedant un forfait, il faut tout
            --d'abord trouver les periodes d'abonnement des joueurs ayant
            --achete le forfait actuel
            CURSOR periodes_forfait_actuel IS
            SELECT IDPERIODE FROM PERIODE
            WHERE CODEFORFAIT = code_forfait_actuel;
        BEGIN
            OPEN periodes_forfait_actuel;
            DECLARE
                --Maintenant que nous avons les periodes correspondant, on peut
                --trouver les joueurs ayant achete le forfait actuel
                CURSOR joueurs_forfait_actuel IS
                SELECT NOJOUEUR FROM PERIODE_FORFAIT_JOUEUR
                WHERE IDPERIODE IN periodes_forfait_actuel;
            BEGIN
                OPEN joueurs_forfait_actuel;
                --On compte le nombre de joueurs qui nt souscrit au forfait actuel
                --et qui font parti du reseau le plus populaire
                SELECT COUNT(*) INTO nb_joueurs
                FROM ABONNEMENT_RESEAU
                WHERE (NOJOUEUR IN joueurs_forfait_actuel) AND (CODERESEAU = code_reseau_plus_populaire);
                CLOSE joueurs_forfait_actuel;
            END;
            CLOSE periodes_forfait_actuel;
        END;
        IF nb_joueurs > nb_max THEN
            nb_max := nb_joueurs;
            code_forfait_plus_populaire := code_forfait_actuel;
        END IF;
    END LOOP;
    
    --Enfin, on va comparer le prix d'achat du forfait le plus populaire chez
    --les joueurs abonnes au reseau le plus populaire
    prix_max := TRUE; --A la base, ne sachant pas le prix des forfaits,
                      --on suppose que le forfait le plus populaire est le plus
                      --cher               
    --On cherche le prix du forfait le plus populaire
    DECLARE
        CURSOR prix_forfait_populaire IS
        SELECT PRIX FROM PERIODE
        WHERE CODEFORFAIT = code_forfait_plus_populaire;
    BEGIN
        OPEN prix_forfait_populaire;
        SELECT MAX(prix_forfait_populaire) INTO prix_forfait_plus_populaire FROM DUAL;
        CLOSE prix_forfait_populaire;
    END;
    --Fin de la recherche du prix du forfait le plus populaire
    FETCH forfaits INTO code_forfait_actuel;
    WHILE forfaits%FOUND AND prix_max LOOP --on ne veut pas forcement iterer sur
                                           --tous les forfaits si on a trouve un
                                           --forfait plus cher donc on utilise
                                           --une boucle while
        --On cherche le prix du forfait actuel
        DECLARE
            CURSOR prix_forfait_actuel IS
            SELECT PRIX FROM PERIODE
            WHERE CODEFORFAIT = code_forfait_actuel;
        BEGIN
            OPEN prix_forfait_actuel;
            SELECT MAX(prix_forfait_actuel) INTO prix_actuel FROM DUAL;
            CLOSE prix_forfait_actuel;
        END;
        --Fin de la recherche du prix du forfait actuel
        IF prix_actuel > prix_forfait_plus_populaire THEN
            prix_max := FALSE;
        END IF;
        FETCH forfaits INTO code_forfait_actuel;
    END LOOP;
    CLOSE forfaits;
    
    IF NOT(prix_max) THEN
        UPDATE PERIODE 
        SET PRIX = PRIX + 0.1*PRIX
        WHERE CODEFORFAIT = code_forfait_plus_populaire;
    END IF;
  
END AJUSTERPROMOTION;