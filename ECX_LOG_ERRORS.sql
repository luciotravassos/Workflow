select LOGFILE
  FROM apps.ecx_inbound_logs
 WHERE ((time_stamp > SYSDATE - 120 / 24 / 60 and status in (1, 2)) OR
       (time_stamp < SYSDATE - 120 / 24 / 60 and status = 10))