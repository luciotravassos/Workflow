/*Esta query lista a situação do envio de XML. Ela é executada por data.
A linha Processando mensagem tem o total de processos que estão gerando 
o
XML, mas ainda não concluiram a geração do arquivo.

A linha Mensagem criada e enfileirada para distribuição com mensagem de
envio [] totaliza os processos que já geraram XML, mas ainda não 
enviaram o
arquivo para a Quadrem.

A linha Mensagem criada e enfileirada para distribuição com mensagem de
envio SUCCESS totaliza os processos que já geraram XML e que já 
enviaram o
arquivo para a Quadrem com sucesso.

A linha Mensagem criada e enfileirada para distribuição com mensagem de
envio Máx. de Tentativas de Tra totaliza os processos que já geraram 
/*XML e que ao enviar o arquivo ocorreu erro de timeout ou conexão recusada.
As duas últimas linhas são erros específicos.*/
SELECT   SUBSTR (generation_message, 1, 50), SUBSTR (delivery_message, 1, 50),
         COUNT (*)
    FROM apps.ecx_out_process_vl eop
   WHERE TRUNC (eop.generation_timestamp) = TRUNC (SYSDATE)
GROUP BY generation_message, delivery_message

