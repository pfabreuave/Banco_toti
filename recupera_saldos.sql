--- Recuperação de saldos en contas

UPDATE conta
SET saldo = calculo_novo_saldo.NEW_SALDO
FROM
 (SELECT conta.id,
 SUM(CASE WHEN transacao.id_tipo_transacao = 1 THEN transacao.valor
                      ELSE (-1) * transacao.valor END) NEW_SALDO
  
FROM transacao
      
JOIN cliente_conta
	 ON (transacao.id_cliente_conta = cliente_conta.id_conta)
     
JOIN conta 
	ON (cliente_conta.id_conta = conta.id)
     
GROUP BY  
        conta.id,                          
        conta.saldo) AS calculo_novo_saldo
        WHERE calculo_novo_saldo.id = conta.id;