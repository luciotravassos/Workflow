/* Retorna dados sobre as requisi��es*/
SELECT --COUNT (*)
          requisition_header_id, creation_date, wf_item_type, wf_item_key,
          authorization_status, description
    FROM po.po_requisition_headers_all
   WHERE segment1 = '43985' --Informe o n�mero da requisi��o
--WHERE    --authorization_status = 'IN PROCESS'
--wf_item_key = '48814-99112'
ORDER BY creation_date DESC

