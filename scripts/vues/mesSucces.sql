CREATE VIEW MesSucces AS
    select titre, description, valeur, noJoueur from succes natural join succes_realise;
    select titre, description, valeur, noJoueur from succes natural join succes_calcule natural join  succes_en_cours;
   