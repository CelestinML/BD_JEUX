create or replace PROCEDURE AJUSTERPROMOTION(code OUT char, nouveau_prix OUT INT) AS

    reseau_le_pop char(6);
    periode_plus_utilise char(5);
    prix_max number(6,2);
    prix_pop number(6,2);
    

    
BEGIN

  
  
   select codereseau 
   into reseau_le_pop 
   from(
    select codereseau 
    from 
    (
        SELECT codereseau, count(*)nb 
        FROM abonnement_reseau natural join joueur inner join reseau on abonnement_reseau.codereseau = reseau.code 
        where reseau.actif = 1 
        group by codereseau
    ) 
    ORDER BY nb desc) 
   where rownum = 1;
   
   
   
   select idPeriode 
   into periode_plus_utilise
   from (
    select idPeriode
    from (
        select idPeriode,count (*)  nb 
        from periode natural join periode_forfait_joueur natural join abonnement_reseau 
        where codereseau = reseau_le_pop group by idPeriode
        ) 
    order by nb desc
    )
where ROWNUM = 1;


--On cherche le prix max
select prix into prix_max from (select prix from periode  order by prix desc) where ROWNUM =1; 

-- On cherche le prix de la periode concerné
select prix into prix_pop from periode where idPeriode = periode_plus_utilise;

if prix_max > prix_pop then
        UPDATE PERIODE 
        SET PRIX = PRIX + 0.1*PRIX
        WHERE idPeriode = periode_plus_utilise;
end if;

select codeForfait,prix into code, nouveau_prix from periode where idPeriode = periode_plus_utilise;
    
  
END AJUSTERPROMOTION;

