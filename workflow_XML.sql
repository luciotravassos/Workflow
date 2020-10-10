/*Esta query lista a situa��o do envio de XML. Ela � executada por data.
A linha Processando mensagem tem o total de processos que est�o gerando 
o
XML, mas ainda n�o concluiram a gera��o do arquivo.

A linha Mensagem criada e enfileirada para distribui��o com mensagem de
envio [] totaliza os processos que j� geraram XML, mas ainda n�o 
enviaram o
arquivo para a Quadrem.

A linha Mensagem criada e enfileirada para distribui��o com mensagem de
envio SUCCESS totaliza os processos que j� geraram XML e que j� 
enviaram o
arquivo para a Quadrem com sucesso.

A linha Mensagem criada e enfileirada para distribui��o com mensagem de
envio M�x. de Tentativas de Tra totaliza os processos que j� geraram 
/*XML e que ao enviar o arquivo ocorreu erro de timeout ou conex�o recusada.
As duas �ltimas linhas s�o erros espec�ficos.*/
SELECT   SUBSTR (generation_message, 1, 50), SUBSTR (delivery_message, 1, 50),
         COUNT (*)
    FROM apps.ecx_out_process_vl eop
   WHERE TRUNC (eop.generation_timestamp) = TRUNC (SYSDATE)
GROUP BY generation_message, delivery_message

