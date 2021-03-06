/* Notifications are    sent from the WF_NOTIFICATIONS table based on the query */
SELECT notification_id, recipient_role, MESSAGE_TYPE, message_name
  FROM wf_notifications
 WHERE status = 'OPEN'
   AND mail_status IN ('MAIL', 'INVALID')
   and message_type = 'ECXERROR'