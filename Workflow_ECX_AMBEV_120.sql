SELECT component_name,
       component_status "WF Notification Mailer Status",
       'Nada' "MSG",
       0 "QTDE"
  FROM apps.fnd_svc_components
 WHERE COMPONENT_NAME not like '%Web Services%'
   and component_name <> 'Workflow Inbound JMS Agent Listener'
   and component_status <> 'RUNNING'
union
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
       COUNT(1) "QTDE"
  FROM apps.ecx_inbound_logs
 WHERE ((time_stamp > SYSDATE - 120 / 24 / 60 and status in (1, 2)) OR
       (time_stamp < SYSDATE - 120 / 24 / 60 and status = 10))
 GROUP BY status
union
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
       COUNT(1) "QTDE"
  FROM apps.ecx_outbound_logs
 WHERE ((time_stamp > SYSDATE - 120 / 24 / 60 and status in (1, 2)) OR
       (time_stamp < SYSDATE - 120 / 24 / 60 and status = 10))
 GROUP BY status