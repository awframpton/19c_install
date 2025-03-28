SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u01/app/oracle/admin/orcl/scripts/context.log append
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b catctx -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" -a 1  /u01/app/oracle/product/19.0.0.0/ctx/admin/catctx.sql 1Xbkfsdcdf1ggh_123 1SYSAUX 1TEMP 1LOCK;
alter user CTXSYS account unlock identified by "CTXSYS";
connect "CTXSYS"/"CTXSYS"
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b dr0defin -c  'PDB$SEED CDB$ROOT'  -u CTXSYS/CTXSYS  -U "SYS"/"&&sysPassword" -a 1  /u01/app/oracle/product/19.0.0.0/ctx/admin/defaults/dr0defin.sql 1\"AMERICAN\";
connect "SYS"/"&&sysPassword" as SYSDBA
alter user CTXSYS password expire account lock;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b dbmsxdbt -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/dbmsxdbt.sql;
spool off
