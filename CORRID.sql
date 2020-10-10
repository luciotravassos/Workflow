select w.user_data.event_name event_name, expiration, count(0)
  from wf_deferred w
 where deq_time is null
 group by w.user_data.event_name, expiration