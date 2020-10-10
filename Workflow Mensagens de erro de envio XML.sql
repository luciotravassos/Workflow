-- Mensagens de erro de envio XML

SELECT   eol.sender_message_id, eol.begin_date, eol.completed_date,
         eol.result_code, eol.exception_text
    FROM apps.ecx_oxta_logmsg eol
   WHERE TRUNC (eol.begin_date) = TRUNC (SYSDATE)
ORDER BY begin_date

