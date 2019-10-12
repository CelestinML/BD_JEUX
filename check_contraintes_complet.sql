set echo on
spool contraintes.log

@check_contraintes.sql JOUEUR;
@check_contraintes.sql ESRB;
@check_contraintes.sql GENRE;
@check_contraintes.sql SOUS_GENRE_JEU;
@check_contraintes.sql JEU;
@check_contraintes.sql CONTENU;
@check_contraintes.sql CONTENU_POSSEDE;
@check_contraintes.sql SUCCES;
@check_contraintes.sql SUCCES_CALCULE;
@check_contraintes.sql SUCCES_REALISE;
@check_contraintes.sql SUCCES_EN_COURS;
@check_contraintes.sql FORFAIT;
@check_contraintes.sql PERIODE;
@check_contraintes.sql PERIODE_FORFAIT_JOUEUR;
@check_contraintes.sql RESEAU;
@check_contraintes.sql ABONNEMENT_RESEAU;
@check_contraintes.sql SUIVI_RESEAU;
@check_contraintes.sql AMI;
@check_contraintes.sql STATUT_AMITIE;
@check_contraintes.sql SUIVI_AMITIE;

spool off
set echo off
