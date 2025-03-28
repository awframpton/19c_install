SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u01/app/oracle/admin/orcl/scripts/plugDatabase.log append
spool /u01/app/oracle/admin/orcl/scripts/plugDatabase.log append
CREATE PLUGGABLE DATABASE "pdb1" ADMIN USER PDBADMIN IDENTIFIED BY "&&pdbadminPassword" ROLES=(CONNECT)  file_name_convert=NONE  STORAGE ( MAXSIZE UNLIMITED MAX_SHARED_TEMP_SIZE UNLIMITED);
alter pluggable database "pdb1" open;
alter system register;
