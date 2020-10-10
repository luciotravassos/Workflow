/* VERIFICA O STATUS DO WORKFLOW MAILER */
SELECT component_name , component_status "WF Notification Mailer Status",
       CASE
          WHEN component_status = 'RUNNING'
             THEN 'OK'
          WHEN component_status = 'STOPPED'
             THEN 'Acionar Suporte'
       END component_status
  FROM apps.fnd_svc_components
 WHERE component_type = 'WF_MAILER'
UNION ALL
SELECT component_name, component_status "WF Notification Mailer Status",
       CASE
          WHEN component_status = 'RUNNING'
             THEN 'OK'
          WHEN component_status = 'STOPPED'
             THEN 'Acionar Suporte'
       END component_status
  FROM apps.fnd_svc_components
 WHERE component_name IN
          ('Workflow Deferred Agent Listener',
           'Workflow Deferred Notification Agent Listener',
           'Workflow Error Agent Listener'
          )
 union all
 select to_char(sysdate,'DD/MM/RRRR HH24:MI:SS'),'','' from dual
 

