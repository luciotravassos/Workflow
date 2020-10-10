SELECT a.begin_date,
       a.item_type,
       a.item_key,
       b.activity_name,
       activity_result_code,
       error_name,
       error_message,
       error_stack
  FROM apps.wf_item_activity_statuses a, apps.wf_process_activities b
 WHERE a.process_activity = b.instance_id
  /* AND begin_date > = TO_DATE('16-08-2007', 'DD-MM-YYYY')
   AND item_type = 'POAPPRV'*/
   AND a.activity_status = 'ERROR'
   AND activity_result_code = '#MAIL'
   order by begin_date