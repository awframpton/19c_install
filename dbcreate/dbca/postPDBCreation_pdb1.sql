SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container="pdb1";
set echo on
spool /u01/app/oracle/admin/orcl/scripts/postPDBCreation.log append
CREATE SMALLFILE TABLESPACE "USERS" LOGGING  DATAFILE  SIZE 5M AUTOEXTEND ON NEXT  1280K MAXSIZE UNLIMITED  EXTENT MANAGEMENT LOCAL  SEGMENT SPACE MANAGEMENT  AUTO;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
host /u01/app/oracle/product/19.0.0.0/OPatch/datapatch -skip_upgrade_check -db orcl -pdbs pdb1;
connect "SYS"/"&&sysPassword" as SYSDBA
select property_value from database_properties where property_name='LOCAL_UNDO_ENABLED';
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container="pdb1";
set echo on
spool /u01/app/oracle/admin/orcl/scripts/postPDBCreation.log append
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container="pdb1";
set echo on
spool /u01/app/oracle/admin/orcl/scripts/postPDBCreation.log append
select TABLESPACE_NAME from cdb_tablespaces a,dba_pdbs b where a.con_id=b.con_id and UPPER(b.pdb_name)=UPPER('pdb1');
connect "SYS"/"&&sysPassword" as SYSDBA
alter session set container="pdb1";
set echo on
spool /u01/app/oracle/admin/orcl/scripts/postPDBCreation.log append
Select count(*) from dba_registry where comp_id = 'DV' and status='VALID';
alter session set container=CDB$ROOT;
exit;
