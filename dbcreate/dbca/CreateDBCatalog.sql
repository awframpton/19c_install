SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /u01/app/oracle/admin/orcl/scripts/CreateDBCatalog.log append
alter session set "_oracle_script"=true;
alter pluggable database pdb$seed close;
alter pluggable database pdb$seed open;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b catalog  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/catalog.sql;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b catproc  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/catproc.sql;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b catoctk  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/catoctk.sql;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b owminst  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/rdbms/admin/owminst.plb;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b pupbld -u SYSTEM/&&systemPassword  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/sqlplus/admin/pupbld.sql;
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b pupdel -u SYS/&&sysPassword  -U "SYS"/"&&sysPassword" /u01/app/oracle/product/19.0.0.0/sqlplus/admin/pupdel.sql;
connect "SYSTEM"/"&&systemPassword"
set echo on
spool /u01/app/oracle/admin/orcl/scripts/sqlPlusHelp.log append
host /u01/app/oracle/product/19.0.0.0/perl/bin/perl /u01/app/oracle/product/19.0.0.0/rdbms/admin/catcon.pl -n 1 -l /u01/app/oracle/admin/orcl/scripts -v  -b hlpbld -u SYSTEM/&&systemPassword  -U "SYS"/"&&sysPassword" -a 1  /u01/app/oracle/product/19.0.0.0/sqlplus/admin/help/hlpbld.sql 1helpus.sql;
spool off
spool off
