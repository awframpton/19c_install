syspwd=$1
export PERL5LIB=$ORACLE_HOME/rdbms/admin
PATH=$ORACLE_HOME/perl/bin:$PATH

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b catalog  -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/catalog.sql

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b catproc  -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/catproc.sql

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b catoctk  -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/catoctk.sql

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b owminst  -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/owminst.plb

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b pupbld -u SYSTEM/$syspwd  -U "SYS"/"$syspwd" $ORACLE_HOME/sqlplus/admin/pupbld.sql

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b pupdel -u SYS/$syspwd  -U "SYS"/"$syspwd" $ORACLE_HOME/sqlplus/admin/pupdel.sql

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b hlpbld -u SYSTEM/$syspwd  -U "SYS"/"$syspwd" -a 1  $ORACLE_HOME/sqlplus/admin/help/hlpbld.sql 1helpus.sql
