set lines 100
col status format a30
select comp_id,version,status
from dba_registry
order by 1;
