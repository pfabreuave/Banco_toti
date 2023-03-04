-- operações de conta presentacão dinamic detallada

SELECT id_cliente_conta AS "CONTA", 
	   c.nome AS "NOME CLIENTE", 
	   COUNT(CASE WHEN id_tipo_transacao = 1 THEN valor END) AS '',
       SUM(CASE WHEN id_tipo_transacao = 1 THEN valor ELSE 0 END) AS DEPOS,
	   COUNT(CASE WHEN id_tipo_transacao = 2 THEN valor END) AS '',
	   SUM(CASE WHEN id_tipo_transacao = 2 THEN valor ELSE 0 END) AS SAQUES,
	   COUNT(CASE WHEN id_tipo_transacao = 3 THEN valor END) AS '',
	   SUM(CASE WHEN id_tipo_transacao = 3 THEN valor ELSE 0 END) AS 'CONTAS',
	   COUNT(CASE WHEN id_tipo_transacao = 4 THEN valor END) AS '',
	   SUM(CASE WHEN id_tipo_transacao = 4 THEN valor ELSE 0 END) AS TRANSF,
		
	   PRINTF('%.2f', (SUM(CASE WHEN id_tipo_transacao = 1 THEN valor
                      ELSE (-1) * valor END))) AS "SALDO",
	   COUNT(*) AS TRANSACOES
		
					  	         
FROM transacao

JOIN cliente AS c
	ON (id_cliente_conta = c.id)

GROUP BY id_cliente_conta
	
ORDER BY id_cliente_conta ASC;