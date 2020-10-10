SELECT component_name,
       component_status "WF Notification Mailer Status",
       'Nada' "MSG",
       0 "QTDE"
  FROM apps.fnd_svc_components
 WHERE COMPONENT_NAME not like '%Web Services%'
   AND component_name <> 'Workflow Inbound JMS Agent Listener'
   AND component_name <> 'Workflow Notification Mailer'
   AND component_status <> 'RUNNING'
UNION
SELECT 'ecx_inbound_logs' "component_name",
       'status' "WF Notification Mailer Status",
       DECODE(status,
              0,
              'Concluído com Sucesso',
              '1',
              'Problemas de Sintaxe no XML',
              '2',
              'Exceção Inesperada',
              '10',
              'Pendente') "MSG",
       count(1) "QTDE"
  FROM apps.ecx_inbound_logs
 WHERE status in (1, 2)
   AND (time_stamp >
       (SELECT MAX(time_stamp) FROM apps.ecx_inbound_logs WHERE status = 0) OR
       time_stamp > SYSDATE - 30 / 24 / 60)
 GROUP BY STATUS
UNION
SELECT 'ecx_outbound_logs' "component_name",
       'status' "WF Notification Mailer Status",
       DECODE(status,
              0,
              'Concluído com Sucesso',
              '1',
              'Problemas de Sintaxe no XML',
              '2',
              'Exceção Inesperada',
              '10',
              'Pendente') "MSG",
       count(1) "QTDE"
  FROM apps.ecx_outbound_logs
 WHERE status in (1, 2)
   AND (time_stamp >
       (SELECT MAX(time_stamp) FROM apps.ecx_outbound_logs WHERE status = 0) OR
       time_stamp > SYSDATE - 30 / 24 / 60)
 GROUP BY STATUS
UNION
SELECT 'ecx_inbound_logs' "component_name",
       'status' "WF Notification Mailer Status",
       DECODE(status,
              0,
              'Concluído com Sucesso',
              '1',
              'Problemas de Sintaxe no XML',
              '2',
              'Exceção Inesperada',
              '10',
              'Pendente') "MSG",
       count(1) "QTDE"
  FROM apps.ecx_inbound_logs
 WHERE status = 10
   AND time_stamp < SYSDATE - 10 / 24 / 60
 GROUP BY STATUS
UNION
SELECT 'ecx_outbound_logs' "component_name",
       'status' "WF Notification Mailer Status",
       DECODE(status,
              0,
              'Concluído com Sucesso',
              '1',
              'Problemas de Sintaxe no XML',
              '2',
              'Exceção Inesperada',
              '10',
              'Pendente') "MSG",
       count(1) "QTDE"
  FROM apps.ecx_outbound_logs
 WHERE status = 10
   AND time_stamp < SYSDATE - 10 / 24 / 60
 GROUP BY STATUS;