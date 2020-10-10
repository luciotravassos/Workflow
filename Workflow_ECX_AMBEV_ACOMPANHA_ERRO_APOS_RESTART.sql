SELECT trigger_id,
       status,
       error_id,
       DECODE(status,
               0,
               'Concluído com Sucesso',
               '1',
               'Problemas de Sintaxe no XML',
               '2',
               'Exceção Inesperada',
               '10',
               'Pendente') status_desc,
       to_char(time_stamp, 'DD-MM-YYYY HH24:MI:SS') stamp,
       to_char(sysdate, 'DD-MM-YYYY HH24:MI:SS') agora,
       logfile
  FROM apps.ecx_inbound_logs
  where status = '1'
 ORDER BY time_stamp DESC