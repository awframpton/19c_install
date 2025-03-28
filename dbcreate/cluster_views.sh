syspwd=$1
export PERL5LIB=$ORACLE_HOME/rdbms/admin
PATH=$ORACLE_HOME/perl/bin:$PATH

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b catclust  -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/catclust.sql

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b catfinal  -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/catfinal.sql

