REM CREATION DES DONNÉES

INSERT INTO JOUEUR (Courriel, Surnom, Miniature, Nom, Prenom)
	VALUES ('bob@hotmail.com', 'BOB LE JOUEUR', NULL, 'Robert', 'Paquette');
INSERT INTO JOUEUR (Courriel, Surnom, Miniature, Nom, Prenom, Actif)
	VALUES ('fred@outlook.com', 'Fred Y', NULL, NULL, NULL, 0);
INSERT INTO JOUEUR (Courriel, Surnom, Miniature, Nom, Prenom, Actif)
	VALUES ('roger@gmail.com', 'Roger la menace', NULL, 'Roger', 'Tremblay', 1);
INSERT INTO JOUEUR (Courriel, Surnom, Miniature, Nom, Prenom, Actif)
	VALUES ('steve@hotmail.com', 'Steve le pirate', NULL, 'S', 'P', 1);
INSERT INTO JOUEUR (Courriel, Surnom, Miniature, Nom, Prenom, Actif)
	VALUES ('sylvie@outlook.com', 'SILL VI', NULL, NULL, NULL, 1);
INSERT INTO JOUEUR (Courriel, Surnom, Miniature, Nom, Prenom, Actif)
	VALUES ('barbie15@gmail.com', 'Tank Girl', NULL, 'Tank', NULL, 0);

INSERT INTO ESRB (Code, Description)
	VALUES ('E', 'Enfants et adultes');
INSERT INTO ESRB (Code, Description)
	VALUES ('T', 'Adolescents');
INSERT INTO ESRB (Code, Description)
	VALUES ('M', 'Jeunes adultes');
INSERT INTO ESRB (Code, Description)
	VALUES ('A', 'Adultes');
INSERT INTO ESRB (Code, Description)
	VALUES ('R', 'En attente de classement');
	
INSERT INTO GENRE (Code, Description, CodeGenreParent)
	VALUES ('ACT', 'Action', 'ACT');
INSERT INTO GENRE (Code, Description, CodeGenreParent)
	VALUES ('HOR', 'Horreur', 'HOR');
INSERT INTO GENRE (Code, Description, CodeGenreParent)
	VALUES ('SPT', 'Sport', 'SPT');
INSERT INTO GENRE (Code, Description, CodeGenreParent)
	VALUES ('AVT', 'Aventure', 'ACT');
INSERT INTO GENRE (Code, Description, CodeGenreParent)
	VALUES ('HCK', 'Hack and Slash', 'ACT');
INSERT INTO GENRE (Code, Description, CodeGenreParent)
	VALUES ('SUR', 'Survie', 'HOR');
INSERT INTO GENRE (Code, Description, CodeGenreParent)
	VALUES ('COU', 'Course', 'SPT');

INSERT INTO JEU (Nom, Description, CodeESRB, CodeGenre)
	VALUES ('TOMB RAIDER', 'Les aventures de Lara Croft', 'T', 'ACT');
INSERT INTO JEU (Nom, Description, CodeESRB, CodeGenre)
	VALUES ('Dying Light', 'Survivre dans un monde infesté de zombie. Bonne nuit!', 'M', 'HOR');
INSERT INTO JEU (Nom, Description, CodeESRB, CodeGenre)
	VALUES ('CANDY CRUSH', 'Le super jeu', 'T', 'HOR');

INSERT INTO SOUS_GENRE_JEU (CodeSousGenre, IdJeu)
	VALUES ('AVT', 1);
INSERT INTO SOUS_GENRE_JEU (CodeSousGenre, IdJeu)
	VALUES ('SUR', 2);

INSERT INTO CONTENU (Nom, Description, DateSortie, TypeContenu, IdJeu)
	VALUES ('Les quêtes principales', 'Les aventures de Lara Croft en Amazonie', to_date('2018-02-03'), 'J', 1);
INSERT INTO CONTENU (Nom, Description, DateSortie, TypeContenu, IdJeu)
	VALUES ('La quête secondaire du dragon', 'Les aventures de Lara Croft en Chine', to_date('2018-06-23'), 'D', 1);
INSERT INTO CONTENU (Nom, Description, DateSortie, TypeContenu, IdJeu)
	VALUES ('La quête secondaire de l''aigle', 'Les aventures de Lara Croft dans les montagnes', to_date('2018-11-11'),'D', 1);
INSERT INTO CONTENU (Nom, Description, DateSortie, TypeContenu, IdJeu)
	VALUES ('Ensemble d''exploration', 'Équipements supplémentaires pour l''aventure', to_date('2018-12-01'), 'O', 1);
INSERT INTO CONTENU (Nom, Description, DateSortie, TypeContenu, IdJeu)
	VALUES ('Chicago', 'La ville infestée de Chicago', to_date('2018-09-09'), 'J', 2);
INSERT INTO CONTENU (Nom, Description, DateSortie, TypeContenu, IdJeu)
	VALUES ('Niveau1', 'Les 10 premiers niveaux', to_date('2019-01-24'), 'J', 3);

INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (1, 1);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (2, 1);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (3, 1);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (4, 1);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (1, 2);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (5, 2);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (1, 3);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (2, 3);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (3, 3);
INSERT INTO CONTENU_POSSEDE (IdContenu, NoJoueur)
	VALUES (4, 3);

INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Survivre', 'Vous avez réussi à traverser la foret amazonienne', 50, 1);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Délivrance', 'Vous avez réussi à sauver Kevin', 10, 1);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Tenace', 'Rependre le combat après une raclée', 10, 1);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Rusé', 'Résoudre l''énigme du dragon', 20, 2);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Agile', 'Réussir un vol plané des hautes falaises', 20, 3);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Survivant', 'Survivre la première nuit dans la ville', 50, 5);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Mission_1', 'Vaincre le gros méchant zombie à la fin de la mission', 10, 5);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Herboriste', 'Recuperer des plantes médécinales', 5, 5);
INSERT INTO SUCCES (Titre, Description, Valeur, IdContenu)
	VALUES ('Super bonbonnier', 'Reussir 5X un tableau en 10 secondes', 5, 6);

INSERT INTO SUCCES_CALCULE (IdSucces, MaximumRequis)
	VALUES (8, 10);
INSERT INTO SUCCES_CALCULE (IdSucces, MaximumRequis)
	VALUES (9, 5);

INSERT INTO SUCCES_REALISE (IdContenu, NoJoueur, IdSucces)
	VALUES (1, 1, 1);
INSERT INTO SUCCES_REALISE (IdContenu, NoJoueur, IdSucces)
	VALUES (1, 1, 2);
INSERT INTO SUCCES_REALISE (IdContenu, NoJoueur, IdSucces)
	VALUES (1, 1, 3);
INSERT INTO SUCCES_REALISE (IdContenu, NoJoueur, IdSucces)
	VALUES (1, 2, 1);
INSERT INTO SUCCES_REALISE (IdContenu, NoJoueur, IdSucces)
	VALUES (5, 2, 6);

INSERT INTO SUCCES_EN_COURS (IdContenu, NoJoueur, IdSucces, Compteur)
	VALUES (5, 2, 8, 7);

INSERT INTO FORFAIT (Code, Nom, Description)
	VALUES ('GOLD1', 'XBox Gold' , 'Abonnement pour jouer en ligne et avoir des promotions');
INSERT INTO FORFAIT (Code, Nom, Description)
	VALUES ('PASS1', 'XBox Game Pass' , 'Abonnement pour 100 jeux par mois');
INSERT INTO FORFAIT (Code, Nom, Description)
	VALUES ('STAND', NULL , NULL);

INSERT INTO PERIODE (DateDebut, DateFin, Prix, CodeForfait)
	VALUES (to_date('2019-01-11'), to_date('2019-12-31'), 80, 'GOLD1');
INSERT INTO PERIODE (DateDebut, DateFin, Prix, CodeForfait)
	VALUES (to_date('2018-01-11'), to_date('2018-12-31'), 90, 'GOLD1');
INSERT INTO PERIODE (DateDebut, DateFin, Prix, CodeForfait)
	VALUES (to_date('2019-06-11'), to_date('2019-10-31'), 50, 'PASS1');
INSERT INTO PERIODE (DateDebut, DateFin, Prix, CodeForfait)
	VALUES (to_date('2000-01-01'), to_date('2030-12-31'), 0, 'STAND');

INSERT INTO PERIODE_FORFAIT_JOUEUR (IdPeriode, NoJoueur, DateAchat)
	VALUES (1, 1, to_date('2019-06-06'));
INSERT INTO PERIODE_FORFAIT_JOUEUR (IdPeriode, NoJoueur, DateAchat)
	VALUES (1, 2, to_date('2018-06-06'));
INSERT INTO PERIODE_FORFAIT_JOUEUR (IdPeriode, NoJoueur, DateAchat)
	VALUES (1, 3, to_date('2019-10-06'));
INSERT INTO PERIODE_FORFAIT_JOUEUR (IdPeriode, NoJoueur, DateAchat)
	VALUES (1, 4, to_date('2015-02-26'));
INSERT INTO PERIODE_FORFAIT_JOUEUR (IdPeriode, NoJoueur, DateAchat)
	VALUES (2, 1, to_date('2019-04-04'));
INSERT INTO PERIODE_FORFAIT_JOUEUR (IdPeriode, NoJoueur, DateAchat)
	VALUES (3, 1, to_date('2019-05-05'));

INSERT INTO RESEAU (Code, Nom, Description)
	VALUES ('LACKEN', 'Les amis du Lac Kénogami', 'Bienvenue à tous!');
INSERT INTO RESEAU (Code, Nom, Description, Actif)
	VALUES ('UQACBD', 'Le reseau des etudiants du 157', 'Tous les etudiants qui travaillent actuellement sur le PLSQL', 1);
INSERT INTO RESEAU (Code, Nom, Description, Actif)
	VALUES ('FRANCO', 'Le reseau des francophones', 'Ici, pas de Bienvenue-Hi!', 0);

INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
	VALUES ('LACKEN', 1);
INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
	VALUES ('UQACBD', 1);
INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
	VALUES ('FRANCO', 1);
INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
	VALUES ('FRANCO', 2);
INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
	VALUES ('FRANCO', 3);
INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
	VALUES ('UQACBD', 4);
INSERT INTO ABONNEMENT_RESEAU (CodeReseau, NoJoueur)
	VALUES ('UQACBD', 5);

INSERT INTO STATUT_AMITIE (CodeStatut, Description)
	VALUES ('NOU', 'Nouveau ami');
INSERT INTO STATUT_AMITIE (CodeStatut, Description)
	VALUES ('FIN', 'Fin de l''amitié');
INSERT INTO STATUT_AMITIE (CodeStatut, Description)
	VALUES ('REL', 'Rel. distante seulement');
INSERT INTO STATUT_AMITIE (CodeStatut, Description)
	VALUES ('PRO', 'Rel. professionnelle');

INSERT INTO AMI (NoJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
	VALUES (1, 2, to_date('2019-06-08'), 'NOU');
INSERT INTO AMI (NoJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
	VALUES (1, 6, to_date('2019-06-10'), 'FIN');
INSERT INTO AMI (NoJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
	VALUES (2, 3, to_date('2019-01-01'), 'NOU');
INSERT INTO AMI (NoJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
	VALUES (2, 4, to_date('2019-02-02'), 'NOU');
INSERT INTO AMI (NoJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
	VALUES (2, 5, to_date('2019-03-03'), 'PRO');
INSERT INTO AMI (NoJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
	VALUES (6, 2, to_date('2019-04-04'), 'REL');
INSERT INTO AMI (NoJoueurInvitant, NoJoueurInvite, DateDebut, CodeStatut)
	VALUES (3, 6, to_date('2019-06-04'), 'NOU');
