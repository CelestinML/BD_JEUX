set echo on
spool creation.log

@creation_tables.sql
@creation_contraintes.sql
@creation_scripts.sql
@creation_donnees.sql

spool off
set echo off
