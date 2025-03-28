syspwd=$1
export PERL5LIB=$ORACLE_HOME/rdbms/admin
PATH=$ORACLE_HOME/perl/bin:$PATH

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b catctx -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"$syspwd" -a 1  $ORACLE_HOME/ctx/admin/catctx.sql 1Xbkfsdcdf1ggh_123 1SYSAUX 1TEMP 1LOCK

sqlplus -s / as sysdba <<EOD
alter user CTXSYS account unlock identified by "CTXSYS";
EOD

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b dr0defin -c  'PDB$SEED CDB$ROOT'  -u CTXSYS/CTXSYS  -U "SYS"/"$syspwd" -a 1  $ORACLE_HOME/ctx/admin/defaults/dr0defin.sql 1\"AMERICAN\"

sqlplus -s / as sysdba <<EOD
alter user CTXSYS password expire account lock;
EOD

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b dbmsxdbt -c  'PDB$SEED CDB$ROOT'   -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/dbmsxdbt.sql
