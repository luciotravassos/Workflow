/* Esse script força o processo sair do status IN PROCESS*/
SELECT    'exec wf_engine.startprocess('''
       || wf_item_type
       || ''','''
       || wf_item_key
       || ''');'
  FROM po.po_requisition_headers_all
 WHERE authorization_status = 'IN PROCESS'

