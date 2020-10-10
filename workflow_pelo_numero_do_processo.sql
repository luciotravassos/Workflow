SELECT * --WF_ITEM_KEY, CLOSED_CODE,WF_ITEM_TYPE,AUTHORIZATION_STATUS --*
  FROM po.po_requisition_headers_all
 WHERE --authorization_status = 'IN PROCESS'
 --and 
 segment1 = '102412'
