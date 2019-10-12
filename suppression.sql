set echo on
spool creation.log

@suppression_contraintes.sql
@suppression_tables.sql
@suppression_donnees.sql

spool off
set echo off
