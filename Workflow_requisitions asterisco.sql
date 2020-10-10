/* Analisa um processo do workflow */
SELECT requisition_header_id, last_update_date, segment1, creation_date,
       wf_item_key, apps_source_code, description
  FROM po.po_requisition_headers_all
 WHERE segment1 = '102412' --Informe o número da requisição

