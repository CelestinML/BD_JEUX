REM CREATION DES TABLES

CREATE TABLE JOUEUR(
	NoJoueur						INTEGER			NOT NULL,
	Courriel						VARCHAR2(256)	NOT NULL,
	Surnom							VARCHAR2(50)	NOT NULL,
	Miniature						BLOB,
	Nom								VARCHAR2(100),
	Prenom							VARCHAR2(100),
	Actif							CHAR(1)
);

CREATE TABLE ESRB(
	Code							CHAR(1)			NOT NULL,
	Description						VARCHAR2(50)	NOT NULL
);

CREATE TABLE GENRE(
	Code							CHAR(3)			NOT NULL,
	Description						VARCHAR2(50)	NOT NULL,
	CodeGenreParent					CHAR(3)			NOT NULL
);

CREATE TABLE SOUS_GENRE_JEU(
	CodeSousGenre					CHAR(3)			NOT NULL,
	IdJeu							INTEGER			NOT NULL
);

CREATE TABLE JEU(
	IdJeu							INTEGER			NOT NULL,
	Nom								VARCHAR2(100)	NOT NULL,
	Description						VARCHAR2(256)	NOT NULL,
	CodeESRB						CHAR(1),
	CodeGenre						CHAR(3)
);	

CREATE TABLE CONTENU(
	IdContenu						INTEGER			NOT NULL,
	Nom								VARCHAR2(100)	NOT NULL,
	Description						VARCHAR2(256)	NOT NULL,
	DateSortie						DATE,
	TypeContenu						VARCHAR2(1)		NOT NULL,
	IdJeu							INTEGER			NOT NULL	
);

CREATE TABLE CONTENU_POSSEDE(
	IdContenu						INTEGER			NOT NULL,
	NoJoueur						INTEGER			NOT NULL
);

CREATE TABLE SUCCES(
	IdSucces						INTEGER			NOT NULL,
	Titre							VARCHAR2(50)	NOT NULL,
	Description						VARCHAR2(256),
	Image							BLOB,
	Valeur							NUMBER(3,0),
	IdContenu						INTEGER			NOT NULL	
);

CREATE TABLE SUCCES_CALCULE(
	IdSucces						INTEGER			NOT NULL,
	MaximumRequis					NUMBER(3,0)		NOT NULL
);

CREATE TABLE SUCCES_REALISE(
	IdContenu						INTEGER			NOT NULL,
	NoJoueur						INTEGER			NOT NULL,
	IdSucces						INTEGER			NOT NULL
);

CREATE TABLE SUCCES_EN_COURS(
	IdContenu						INTEGER			NOT NULL,
	NoJoueur						INTEGER			NOT NULL,
	IdSucces						INTEGER			NOT NULL,
	Compteur						NUMBER(3,0)		NOT NULL
);


CREATE TABLE FORFAIT(
	Code							CHAR(5)			NOT NULL,
	Nom								VARCHAR2(100),
	Description						VARCHAR2(1000)
);

CREATE TABLE PERIODE(
	IdPeriode						INTEGER			NOT NULL,
	DateDebut						DATE			NOT NULL,
	DateFin							DATE			NOT NULL,
	Prix							NUMBER (6,2)	NOT NULL,
	CodeForfait						CHAR(5)			NOT NULL
);

CREATE TABLE PERIODE_FORFAIT_JOUEUR(
	IdPeriode						INTEGER			NOT NULL,
	NoJoueur						INTEGER			NOT NULL,
	DateAchat						DATE			NOT NULL
);

CREATE TABLE RESEAU(
	Code							CHAR(6)			NOT NULL,
	Nom								VARCHAR2(50)	NOT NULL,
	Description						VARCHAR2(100)	NOT NULL,
	Actif							VARCHAR2(1)		NOT NULL
);

CREATE TABLE ABONNEMENT_RESEAU(
	CodeReseau						CHAR(6)			NOT NULL,
	NoJoueur						INTEGER			NOT NULL
);

CREATE TABLE SUIVI_RESEAU(
	IdSuivi							INTEGER			NOT NULL,
	Moment							TIMESTAMP		NOT NULL,
	CodeReseau						CHAR(6)			NOT NULL,
	DateSuivi						DATE			NOT NULL,
	Action							CHAR(3)			NOT NULL,
	NoJoueur						INTEGER
);

CREATE TABLE AMI(
	NoJoueurInvitant				INTEGER			NOT NULL,	
	NoJoueurInvite					INTEGER			NOT NULL,	
	DateDebut						DATE,
	CodeStatut						CHAR(3)			NOT NULL	
);

CREATE TABLE STATUT_AMITIE(
	CodeStatut						CHAR(3)			NOT NULL,
	Description						VARCHAR2(25)	NOT NULL	
);

CREATE TABLE SUIVI_AMITIE(
	IdSuivi							INTEGER			NOT NULL,
	Moment							TIMESTAMP		NOT NULL,
	NoJoueurInvitant				INTEGER			NOT NULL,	
	NoJoueurInvite					INTEGER			NOT NULL,	
	DateSuivi						DATE			NOT NULL,
	CodeStatut						CHAR(3)			NOT NULL
);