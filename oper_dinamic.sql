-- operações de conta presentacão dinamic

SELECT id_cliente_conta AS "CONTA", 
	   c.nome AS "NOME CLIENTE", 
    	SUM(CASE WHEN id_tipo_transacao = 1 THEN valor ELSE 0 END) AS 'DEPOSITOS',
		SUM(CASE WHEN id_tipo_transacao = 2 THEN valor ELSE 0 END) AS 'SAQUES',
		SUM(CASE WHEN id_tipo_transacao = 3 THEN valor ELSE 0 END) AS 'PAGAR CONTAS',
		SUM(CASE WHEN id_tipo_transacao = 4 THEN valor ELSE 0 END) AS 'TRANSFERENCIAS',
		PRINTF('%.2f', (SUM(CASE WHEN id_tipo_transacao = 1 THEN valor
                      ELSE (-1) * valor END))) AS "SALDO",
		COUNT(*) AS "CANT"
		
					  	         
FROM transacao

JOIN cliente AS c
	ON (id_cliente_conta = c.id)

GROUP BY id_cliente_conta
	
ORDER BY id_cliente_conta ASC;
	