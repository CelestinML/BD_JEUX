--------------------------------------------------------
--  Fichier créé - lundi-octobre-07-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger NO_AUTO_IDCONTENU
--------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';





  CREATE OR REPLACE TRIGGER "ORA8TRD157_44"."NO_AUTO_IDCONTENU" 
   before insert 
   on "ORA8TRD157_44"."CONTENU"  
   for each row 
begin  
      select CONTENU_SEQ.nextval 
      into :NEW."IDCONTENU" 
      from SYS.dual; 
end;
/
ALTER TRIGGER   "ORA8TRD157_44"."NO_AUTO_IDCONTENU"ENABLE;
--------------------------------------------------------
--  DDL for Trigger NO_AUTO_IDJEU
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORA8TRD157_44"."NO_AUTO_IDJEU" 
   before insert on "ORA8TRD157_44"."JEU" 
   for each row 
begin  
    select JEU_SEQ.nextval 
    into :NEW."IDJEU" 
    from dual; 
end;
/
ALTER TRIGGER "ORA8TRD157_44"."NO_AUTO_IDJEU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NO_AUTO_IDPERIODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORA8TRD157_44"."NO_AUTO_IDPERIODE" 
   before insert on "ORA8TRD157_44"."PERIODE" 
   for each row 
begin  
    select PERIODE_SEQ.nextval 
    into :NEW."IDPERIODE" 
    from dual; 
end;
/
ALTER TRIGGER "ORA8TRD157_44"."NO_AUTO_IDPERIODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NO_AUTO_IDSUCCES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORA8TRD157_44"."NO_AUTO_IDSUCCES" 
   before insert on "ORA8TRD157_44"."SUCCES" 
   for each row 
begin  
     select SUCCES_SEQ.nextval 
     into :NEW."IDSUCCES" 
     from dual; 
end;
/
ALTER TRIGGER "ORA8TRD157_44"."NO_AUTO_IDSUCCES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NO_AUTO_IDSUIVI
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORA8TRD157_44"."NO_AUTO_IDSUIVI" 
   before insert on "ORA8TRD157_44"."SUIVI_AMITIE" 
   for each row 
begin  
    select SUIVI_AMITIE_SEQ.nextval 
    into :NEW."IDSUIVI" 
    from dual; 
end;
/
ALTER TRIGGER "ORA8TRD157_44"."NO_AUTO_IDSUIVI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NO_AUTO_IDSUIVIR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORA8TRD157_44"."NO_AUTO_IDSUIVIR" 
   before insert on "ORA8TRD157_44"."SUIVI_RESEAU" 
   for each row 
begin 
    select SUIVI_RESEAU_SEQ.nextval 
    into :NEW."IDSUIVI" 
    from dual; 
end;
/
ALTER TRIGGER "ORA8TRD157_44"."NO_AUTO_IDSUIVIR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NO_AUTO_NOJOUEUR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ORA8TRD157_44"."NO_AUTO_NOJOUEUR" 
   before insert on "ORA8TRD157_44"."JOUEUR" 
   for each row 
begin  
     select JOUEUR_SEQ.nextval 
     into :NEW."NOJOUEUR" 
     from dual; 
end;
/
ALTER TRIGGER "ORA8TRD157_44"."NO_AUTO_NOJOUEUR" ENABLE;

REM CREATION DES TRIGGERS

@declencheurs/sequences.sql

@declencheurs/nouveauSuccesEnCours.sql 
@declencheurs/genre.sql 
@declencheurs/suiviReseau.sql 
@declencheurs/suiviAbonnementReseau.sql
@declencheurs/suiviAmi.sql