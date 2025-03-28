set verify off
def syspwd=&1
set echo on
spool crdb
CREATE DATABASE "orcl"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 1024
SET DEFAULT BIGFILE TABLESPACE
DATAFILE SIZE 1G AUTOEXTEND ON NEXT  1G MAXSIZE 32G
EXTENT MANAGEMENT LOCAL
SYSAUX DATAFILE SIZE 1G AUTOEXTEND ON NEXT 1G MAXSIZE 32G
BIGFILE DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE SIZE 1G AUTOEXTEND ON NEXT  1G MAXSIZE 32G
BIGFILE UNDO TABLESPACE UNDOTBS1 DATAFILE  SIZE 1G AUTOEXTEND ON NEXT  1G MAXSIZE 32G
CHARACTER SET AL32UTF8
NATIONAL CHARACTER SET AL16UTF16
SET TIME_ZONE = 'UTC'
LOGFILE GROUP 1  SIZE 200M,
GROUP 2  SIZE 200M,
GROUP 3  SIZE 200M
USER SYS IDENTIFIED BY "&&syspwd" USER SYSTEM IDENTIFIED BY "&&syspwd"
enable pluggable database LOCAL UNDO ON;
spool off
set verify on
