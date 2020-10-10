select count(*), module
  from v$session
 where program like '%JDBC%'
 group by module;