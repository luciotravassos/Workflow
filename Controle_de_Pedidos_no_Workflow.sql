-- 1-2 Cotas criadas na ultima hora
SELECT TO_CHAR(a.creation_date, 'HH24') hora, count(1) nr_cotas_ult_hora
  FROM apps.pon_bid_headers a, apps.pon_bid_item_prices b
 WHERE a.bid_number = b.bid_number
   AND a.creation_date BETWEEN (SYSDATE - 60 / 24 / 60) AND SYSDATE
 GROUP BY TO_CHAR(a.creation_date, 'HH24')
union all
-- 3-4 SDCs criadas na ultima hora
SELECT TO_CHAR(a.creation_date, 'HH24') hora, count(1) nr_sdcs_ult_hora
  FROM apps.pon_auction_headers_all a, apps.pon_auction_item_prices_all b
 WHERE a.auction_header_id = b.auction_header_id
   AND a.creation_date BETWEEN (SYSDATE - 60 / 24 / 60) AND SYSDATE
 GROUP BY TO_CHAR(a.creation_date, 'HH24')
union all
-- 5-6 Pedidos criados na ultima hora
SELECT TO_CHAR(a.creation_date, 'HH24'), count(1) nr_pedidos_ult_hora
  FROM apps.po_headers_all a, apps.po_lines_all b
 WHERE a.po_header_id = b.po_header_id
   AND a.document_creation_method = 'AWARD_SOURCING'
   AND a.creation_date BETWEEN (SYSDATE - 60 / 24 / 60) AND SYSDATE
 GROUP BY TO_CHAR(a.creation_date, 'HH24')
union all
-- 7-8 Nr requisicoes catalogo na ultima hora
SELECT TO_CHAR(prha.creation_date, 'HH24'), count(1) nr_req_ult_h
  FROM apps.PO_requisition_headers_all prha,
       apps.PO_requisition_lines_all   prla
 WHERE prha.requisition_header_id = prla.requisition_header_id
   AND prha.interface_source_code = 'ECAT'
   AND prha.creation_date BETWEEN (SYSDATE - 60 / 24 / 60) AND SYSDATE
 GROUP BY TO_CHAR(prha.creation_date, 'HH24')
union all
--9-10 Nr reservas catalogo criadas na ultima hora
SELECT TO_CHAR(creation_date, 'HH24'), count(1) nr_reserv_ult_h
  FROM xxa.xxa_reserve_lines
 WHERE creation_date BETWEEN (SYSDATE - 60 / 24 / 60) AND SYSDATE
 GROUP BY TO_CHAR(creation_date, 'HH24')