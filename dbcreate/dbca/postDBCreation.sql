SET VERIFY OFF
spool /u01/app/oracle/admin/orcl/scripts/postDBCreation.log append
host /u01/app/oracle/product/19.0.0.0/OPatch/datapatch -skip_upgrade_check -db orcl;
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
create spfile='/u01/app/oracle/product/19.0.0.0/dbs/spfileorcl.ora' FROM pfile='/u01/app/oracle/admin/orcl/scripts/init.ora';
connect "SYS"/"&&sysPassword" as SYSDBA
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b utlrp  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/utlrp.sql;
select comp_id, status from dba_registry;
shutdown immediate;
connect "SYS"/"&&sysPassword" as SYSDBA
startup ;
spool off
