export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/19.0.0.0
export CV_ASSUME_DISTID=OL7

cd $ORACLE_HOME
./runInstaller -silent -waitforcompletion -applyRU /u01/app/oracle/stage/ru/37260974 \
  oracle.install.option=INSTALL_DB_SWONLY \
  oracle.install.db.InstallEdition=EE \
  oracle.install.db.OSDBA_GROUP=dba \
  oracle.install.db.OSOPER_GROUP=dba \
  oracle.install.db.OSBACKUPDBA_GROUP=dba \
  oracle.install.db.OSDGDBA_GROUP=dba \
  oracle.install.db.OSKMDBA_GROUP=dba \
  oracle.install.db.OSRACDBA_GROUP=dba
