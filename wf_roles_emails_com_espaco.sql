select name, DISPLAY_NAME, EMAIL_ADDRESS, ORIG_SYSTEM
  from wf_roles
 where EMAIL_ADDRESS like '% @%';