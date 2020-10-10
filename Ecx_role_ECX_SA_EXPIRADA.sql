/*ECX_SA role expirada ==> Note:430843.1*/
select name,
       email_address,
       notification_preference,
       user_flag,
       partition_id,
       orig_system,
       expiration_date
  from wf_local_roles
 where name like '%ECX%'