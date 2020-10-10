/* Formatted on 2004/12/09 03:25 (Formatter Plus v4.7.0) */
SELECT   SUBSTR (state, 1, 20), SUBSTR (corrid, 1, 45), COUNT (*)
    FROM wf_deferred
GROUP BY corrid, state

