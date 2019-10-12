REM Suppression des sequences

DROP SEQUENCE JEU_SEQ; 
DROP SEQUENCE CONTENU_SEQ;
DROP SEQUENCE SUCCES_SEQ;
DROP SEQUENCE PERIODE_SEQ;
DROP SEQUENCE JOUEUR_SEQ;
DROP SEQUENCE SUIVI_AMITIE_SEQ;
DROP SEQUENCE SUIVI_RESEAU_SEQ;

REM SUPPRESSION CHAMPS UNIQUE

ALTER TABLE JOUEUR DROP CONSTRAINT JOUEUR_UNIQUE;

REM SUPPRESSION DES CONTRAINTES

ALTER TABLE CONTENU DROP CONSTRAINT CHECK_CONTENU_TYPE;
ALTER TABLE JOUEUR DROP CONSTRAINT CHECK_JOUEUR_ACTIF;
ALTER TABLE RESEAU DROP CONSTRAINT CHECK_RESEAU_ACTIF; 
ALTER TABLE SUIVI_RESEAU DROP CONSTRAINT CHECK_SUIVI_RESEAU_ACTION; 
ALTER TABLE SUCCES DROP CONSTRAINT CHECK_SUCCES_VALEUR;
ALTER TABLE SUCCES_CALCULE DROP CONSTRAINT CHECK_SUCCES_C_MAX_REQUIS;
ALTER TABLE SUCCES_EN_COURS DROP CONSTRAINT CHECK_SUCCES_EN_COURS_COMPTEUR;
ALTER TABLE PERIODE DROP CONSTRAINT CHECK_PERIODE_PRIX;

REM SUPPRESSION CL�S �TRANGERES

ALTER TABLE GENRE DROP CONSTRAINT GENRE_FK;
ALTER TABLE SOUS_GENRE_JEU DROP CONSTRAINT SOUS_GENRE_JEU_SOUS_GENRE_FK;
ALTER TABLE SOUS_GENRE_JEU DROP	CONSTRAINT SOUS_GENRE_JEU_ID_JEU_FK;
ALTER TABLE JEU DROP CONSTRAINT JEU_CODE_ESRB_FK;
ALTER TABLE JEU DROP CONSTRAINT JEU_CODE_GENRE_FK;
ALTER TABLE CONTENU DROP CONSTRAINT CONTENU_FK;
ALTER TABLE CONTENU_POSSEDE DROP CONSTRAINT CONTENU_POSSEDE_ID_CONTENU_FK;
ALTER TABLE CONTENU_POSSEDE DROP CONSTRAINT CONTENU_POSSEDE_NO_JOUEUR_FK;
ALTER TABLE SUCCES DROP CONSTRAINT SUCCES_FK;
ALTER TABLE SUCCES_CALCULE DROP CONSTRAINT SUCCES_CALCULE_FK;
ALTER TABLE SUCCES_REALISE DROP CONSTRAINT SUCCES_REALISE_CONTENU_FK;
ALTER TABLE SUCCES_REALISE DROP CONSTRAINT SUCCES_REALISE_ID_SUCCES_FK;
ALTER TABLE SUCCES_EN_COURS DROP CONSTRAINT SUCCES_EN_COURS_CONTENU_FK;
ALTER TABLE SUCCES_EN_COURS DROP CONSTRAINT SUCCES_EN_COURS_ID_SUCCES_FK;
ALTER TABLE PERIODE DROP CONSTRAINT PERIODE_FK;
ALTER TABLE PERIODE_FORFAIT_JOUEUR DROP CONSTRAINT PERIODE_FORF_J_ID_PERIODE_FK;
ALTER TABLE PERIODE_FORFAIT_JOUEUR DROP CONSTRAINT PERIODE_FORF_J_NO_JOUEUR_FK;
ALTER TABLE ABONNEMENT_RESEAU DROP CONSTRAINT ABONNEMENT_CODE_RESEAU_FK;
ALTER TABLE ABONNEMENT_RESEAU DROP CONSTRAINT ABONNEMENT_NO_JOUEUR_FK;
ALTER TABLE SUIVI_RESEAU DROP CONSTRAINT SUIVI_RESEAU_CODE_RESEAU_FK;
ALTER TABLE SUIVI_RESEAU DROP CONSTRAINT SUIVI_RESEAU_NO_JOUEUR_FK;
ALTER TABLE AMI DROP CONSTRAINT AMI_NO_JOUEUR_INVITANT_FK;
ALTER TABLE AMI DROP CONSTRAINT AMI_NO_JOUEUR_INVITE_FK;
ALTER TABLE AMI DROP CONSTRAINT AMI_CODE_STATUT_FK;
ALTER TABLE SUIVI_AMITIE DROP CONSTRAINT SUIVI_AMI_NO_J_INVITANT_FK;
ALTER TABLE SUIVI_AMITIE DROP CONSTRAINT SUIVI_AMI_NO_J_INVITE_FK;
ALTER TABLE SUIVI_AMITIE DROP CONSTRAINT SUIVI_AMITIE_CODE_STATUT_FK;


REM SUPPRESSION CL�S PRIMAIRES

ALTER TABLE JOUEUR DROP CONSTRAINT JOUEUR_PK;
ALTER TABLE ESRB DROP CONSTRAINT ESRB_PK;
ALTER TABLE GENRE DROP CONSTRAINT GENRE_PK;
ALTER TABLE SOUS_GENRE_JEU DROP CONSTRAINT SOUS_GENRE_JEU_PK;
ALTER TABLE JEU DROP CONSTRAINT JEU_PK;
ALTER TABLE CONTENU DROP CONSTRAINT CONTENU_PK;
ALTER TABLE CONTENU_POSSEDE DROP CONSTRAINT CONTENU_POSSEDE_PK;
ALTER TABLE SUCCES DROP CONSTRAINT SUCCES_PK;
ALTER TABLE SUCCES_CALCULE DROP CONSTRAINT SUCCES_CALCULE_PK;
ALTER TABLE SUCCES_REALISE DROP CONSTRAINT SUCCES_REALISE_PK;
ALTER TABLE SUCCES_EN_COURS DROP CONSTRAINT SUCCES_EN_COURS_PK;
ALTER TABLE FORFAIT DROP CONSTRAINT FORFAIT_PK;
ALTER TABLE PERIODE DROP CONSTRAINT PERIODE_PK;
ALTER TABLE PERIODE_FORFAIT_JOUEUR DROP CONSTRAINT PERIODE_FORFAIT_JOUEUR_PK;
ALTER TABLE RESEAU DROP CONSTRAINT RESEAU_PK;
ALTER TABLE ABONNEMENT_RESEAU DROP CONSTRAINT ABONNEMENT_RESEAU_PK;
ALTER TABLE SUIVI_RESEAU DROP CONSTRAINT SUIVI_RESEAU_PK;
ALTER TABLE AMI DROP CONSTRAINT AMI_PK;
ALTER TABLE STATUT_AMITIE DROP CONSTRAINT STATUT_AMITIE_PK;
ALTER TABLE SUIVI_AMITIE DROP CONSTRAINT SUIVI_AMITIE_PK;