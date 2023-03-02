-- operações de conta presentacão dinamic

SELECT t.id_cliente_conta AS "CONTA", 
	   c.nome AS "NOME CLIENTE", 
    	SUM(CASE WHEN id_tipo_transacao = 1 THEN valor ELSE 0 END) AS 'DEPOSITOS',
		SUM(CASE WHEN id_tipo_transacao = 2 THEN valor ELSE 0 END) AS 'SAQUES',
		SUM(CASE WHEN id_tipo_transacao = 3 THEN valor ELSE 0 END) AS 'PAGAR CONTAS',
		SUM(CASE WHEN id_tipo_transacao = 4 THEN valor ELSE 0 END) AS 'TRANSFERENCIAS',
		SUM(CASE WHEN id_tipo_transacao = 1 THEN valor
                      ELSE (-1) * valor END) "SALDO",
		COUNT(*) AS "CANT"
		
					  	         
FROM transacao AS t
JOIN tipo_transacao AS tt
	ON (id_tipo_transacao = tt.id) 

JOIN cliente AS c
	ON (t.id_cliente_conta = c.id)

GROUP BY t.id_cliente_conta
	
ORDER BY t.id_cliente_conta ASC;
	