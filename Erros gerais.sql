/* Verifica problemas no flow...se tiver erro retorna mais de uma linha */
SELECT w.user_data.event_name event_name, expiration, COUNT(0)
  FROM wf_deferred w
 WHERE deq_time IS NULL
 GROUP BY w.user_data.event_name, expiration