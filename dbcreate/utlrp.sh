syspwd=$1
export PERL5LIB=$ORACLE_HOME/rdbms/admin
PATH=$ORACLE_HOME/perl/bin:$PATH

perl $ORACLE_HOME/rdbms/admin/catcon.pl -n 1 -l . -v  -b utlrp  -U "SYS"/"$syspwd" $ORACLE_HOME/rdbms/admin/utlrp.sql
