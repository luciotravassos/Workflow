/* Workshifts */
SELECT   concurrent_time_period_name, from_week_day, to_week_day,
         specific_date, description, application_id, start_time, end_time,
         concurrent_time_period_id, concurrent_days_spec_method, created_by,
         creation_date, last_update_date, last_update_login, last_updated_by
    FROM apps.fnd_concurrent_time_periods
ORDER BY application_id,
         DECODE (concurrent_time_period_id, 0, 1, 2),
         concurrent_time_period_name

