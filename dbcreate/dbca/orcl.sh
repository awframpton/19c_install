#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /u01/app/oracle
mkdir -p /u01/app/oracle/admin/orcl/adump
mkdir -p /u01/app/oracle/admin/orcl/dpdump
mkdir -p /u01/app/oracle/admin/orcl/pfile
mkdir -p /u01/app/oracle/audit
mkdir -p /u01/app/oracle/cfgtoollogs/dbca/orcl
mkdir -p /u01/app/oracle/fast_recovery_area
mkdir -p /u01/app/oracle/oradata
mkdir -p /u01/app/oracle/product/19.0.0.0/dbs
umask ${OLD_UMASK}
PERL5LIB=$ORACLE_HOME/rdbms/admin:$PERL5LIB; export PERL5LIB
ORACLE_SID=orcl; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$ORACLE_HOME/perl/bin:$PATH; export PATH
echo You should Add this entry in the /etc/oratab: orcl:/u01/app/oracle/product/19.0.0.0:Y
/u01/app/oracle/product/19.0.0.0/bin/sqlplus /nolog @/u01/app/oracle/admin/orcl/scripts/orcl.sql
