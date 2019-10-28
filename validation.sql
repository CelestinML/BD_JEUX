REM VALIDATION DES SCRIPTS

set echo on
spool validation.log
	
@validation/validation_vues.sql
@validation/validation_fonctions.sql
@validation/validation_declencheurs.sql
@validation/validation_procedures.sql

spool off
set echo off
