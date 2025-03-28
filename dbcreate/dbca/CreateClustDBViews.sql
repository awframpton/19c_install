SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u01/app/oracle/admin/orcl/scripts/CreateClustDBViews.log append
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b catclust  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/catclust.sql;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b catfinal  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/catfinal.sql;
spool off
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u01/app/oracle/admin/orcl/scripts/postDBCreation.log append
